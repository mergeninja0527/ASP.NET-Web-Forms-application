Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Imports System.IO
Imports System.Net
Imports System.Security.Cryptography
Imports System.Text
Imports System.Web
Imports System.Web.Security
Imports System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel
Imports DevExpress.Web
Imports DevExpress.Xpo.Logger

Namespace SeymourWebsite
    Partial Public Class SSO
        Inherits System.Web.UI.Page

        Dim cookie As HttpCookie
        Const QS_RETURN_URL As String = "ReturnURL"
        Dim nextpage As String
        'Dim L As LibraryRoutines
        'Dim L As LibraryRoutines
        Private L As LibraryRoutines
        Private sqlQuery As String

        Dim clientValue     As String = ""
        Dim firstNameValue  As String = ""
        Dim lastNameValue   As String = ""
        Dim streetNoValue   As String = ""
        Dim streetAddrValue As String = ""
        Dim zipCodeValue    As String = ""

	    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
			L = New LibraryRoutines
			' 1) Read the “payload” parameter from the query string
			Dim encodedPayload As String = Request.QueryString("payload")
			If String.IsNullOrEmpty(encodedPayload) Then
				Response.Write("Missing encoded payload.")
				Return
			End If

			' 2) URL-decode it (Base64 can include + / = etc.)
			encodedPayload = HttpUtility.UrlDecode(encodedPayload)

			Try
				' 3) Base64-decode → e.g.
				'    "client=RanchoBernardo|firstname=Wilson|lastname=Sutjiadi|streetno=17388|streetaddress=Via Del Campo|zipcode=92127|Key=-152228057"
				Dim decodedBytes As Byte() = Convert.FromBase64String(encodedPayload)
				Dim fullPayload As String = Encoding.UTF8.GetString(decodedBytes)

				'Response.Write("<p>Full decoded payload: " & HttpUtility.HtmlEncode(fullPayload) & "</p>")

				' 4) Split off "|Key="
				Dim splitMarker As String = "|Key="
				Dim idx As Integer = fullPayload.LastIndexOf(splitMarker, StringComparison.Ordinal)
				If idx < 0 Then
					Response.Write("<p>Invalid payload format: no '|Key=' found.</p>")
					Return
				End If

				Dim rawPart As String = fullPayload.Substring(0, idx)
				Dim adlerFromPayload As String = fullPayload.Substring(idx + splitMarker.Length)

				'Response.Write("<p>Raw portion (before Key): " & HttpUtility.HtmlEncode(rawPart) & "</p>")
				'Response.Write("<p>Adler-32 from payload: " & HttpUtility.HtmlEncode(adlerFromPayload) & "</p>")

				' 5) Get the server’s view of the user IP (must match ipify in JS)
				Dim userIP As String = HttpContext.Current.Request.UserHostAddress
				Response.Write("<p>Server-side user IP: " & HttpUtility.HtmlEncode(userIP) & "</p>")

				' 6) Reconstruct exactly what JS hashed: rawPart + "|ip=" + userIP
				Dim reconstructed As String = rawPart & "|ip=" & userIP
				'Response.Write("<p>String used for checksum: " & HttpUtility.HtmlEncode(reconstructed) & "</p>")

				' 7) Compute Adler-32 over that reconstructed string (unsigned 32-bit)
				Dim computedAdler As UInteger = ComputeAdler32(reconstructed)

				' ── FIX: reinterpret as a signed 32-bit (two's complement) using BitConverter ──
				Dim adlerBytes As Byte() = BitConverter.GetBytes(computedAdler)
				Dim computedSigned As Integer = BitConverter.ToInt32(adlerBytes, 0)
				' Now computedSigned is the same signed 32-bit JS would have printed.

				' 7.2) Parse the incoming Key string (JS sent a signed decimal, e.g. "-152228057")
				Dim adlerPayloadSigned As Integer
				If Not Integer.TryParse(adlerFromPayload, adlerPayloadSigned) Then
					Response.Write("<p style=""color:red;"">Invalid Key format: '" & HttpUtility.HtmlEncode(adlerFromPayload) & "' is not a 32-bit signed integer.</p>")
					Return
				End If

				' 7.3) Debug output
				'Response.Write("<p>Computed Adler-32 (unsigned): " & computedAdler.ToString() & "</p>")
				'Response.Write("<p>Computed Adler-32 (signed): " & computedSigned.ToString() & "</p>")
				'Response.Write("<p>Payload’s Key (signed): " & HttpUtility.HtmlEncode(adlerPayloadSigned.ToString()) & "</p>")

				' 8) Compare the two signed integers
				If adlerPayloadSigned <> computedSigned Then
					Response.Write("<p style=""color:red;"">Checksum mismatch! Payload invalid or IP changed.</p>")
					Return
				End If

				Response.Write("<p style=""color:green;"">Checksum OK. Parsing fields and querying database…</p>")

				' 9) Parse out each "key=value" pair from rawPart
				Dim parts() As String = rawPart.Split("|"c)
				Dim fieldDict As New Dictionary(Of String, String)(StringComparer.OrdinalIgnoreCase)
				For Each p As String In parts
					Dim kv() As String = p.Split(New Char() { "="c }, 2)
					If kv.Length = 2 Then
						fieldDict(kv(0)) = kv(1)
					End If
				Next

				' 10) Extract each field safely
				clientValue      = If(fieldDict.ContainsKey("client"),       fieldDict("client"),       "")
				firstNameValue   = If(fieldDict.ContainsKey("firstname"),    fieldDict("firstname"),    "")
				lastNameValue    = If(fieldDict.ContainsKey("lastname"),     fieldDict("lastname"),     "")
				streetNoValue    = If(fieldDict.ContainsKey("streetno"),     fieldDict("streetno"),     "")
				streetAddrValue  = If(fieldDict.ContainsKey("streetaddress"), fieldDict("streetaddress"), "")
				zipCodeValue     = If(fieldDict.ContainsKey("zipcode"),      fieldDict("zipcode"),      "")

				' 11) Convert streetno to Integer
				Dim streetnoInt As Integer
				If Not Integer.TryParse(streetNoValue, streetnoInt) Then
					Response.Write("<p style=""color:red;"">Invalid StreetNo format: " & HttpUtility.HtmlEncode(streetNoValue) & "</p>")
					Return
				End If
				
				
				Dim sqlQuery As String = _
					"SELECT * " & _
					"FROM CID_People " & _
					"WHERE Firstname       = '" & firstNameValue   & "' " & _
					"  AND Lastname    = '" & lastNameValue    & "' " & _
					"  AND StreetNo   = '" & streetNoValue   & "' " & _
					"  AND StreetName = '" & streetAddrValue & "';"
				' 12) Query only WebUsername/WebPassword for that StreetNo
			    
				
				L.SetConnection()
				L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
				L.dbConnectionSql.Open()
				
				Dim webUsernameDb As String = ""
				Dim webPasswordDb As String = ""
				Dim updatedRow As Integer = 0

				Try
					' 1) Create SqlCommand with the above SQL (no parameters needed)
					Dim cmd As New SqlCommand(sqlQuery, L.dbConnectionSql)

					' 2) Execute reader
					Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult)

					' 3) If there are rows, loop through and display WebUsername / WebPassword
					If reader.HasRows Then
						While reader.Read()
							' Only assign if NOT DBNull
							If Not reader.IsDBNull(reader.GetOrdinal("WebUsername")) Then
								webUsernameDb = reader("WebUsername").ToString().Trim()
							End If

							If Not reader.IsDBNull(reader.GetOrdinal("WebPassword")) Then
								webPasswordDb = reader("WebPassword").ToString().Trim()
							End If
							updatedRow = 1
						End While
					Else
						UserMessage("Sign-In Problem", "No matched user info!")
					End If

					reader.Close()
				Catch ex As Exception
					Response.Write("<p><strong>Error querying WebUsername/WebPassword:</strong> " & HttpUtility.HtmlEncode(ex.Message) & "</p>")
				Finally
					If L.dbConnectionSql IsNot Nothing AndAlso L.dbConnectionSql.State = ConnectionState.Open Then
						L.dbConnectionSql.Close()
					End If
				End Try
				
				If String.IsNullOrEmpty(webUsernameDb) AndAlso String.IsNullOrEmpty(webPasswordDb) Then
                    webUsernameDb = firstNameValue & lastNameValue
                    webPasswordDb = streetNoValue & streetAddrValue & zipCodeValue
					webPasswordDb = webPasswordDb.Replace(" ", "")
                    updatedRow = RegisterUserInfo(webUsernameDb, webPasswordDb)
                End If
				if updatedRow > 0 Then
					Response.Write("aaa" & webUsernameDb & "     " & webPasswordDb)
					SignIn(webUsernameDb, webPasswordDb)
				End If
                

			Catch ex As FormatException
				Response.Write("<p>Invalid Base64 payload.</p>")
			Catch ex As Exception
				Response.Write("<p>Error: " & HttpUtility.HtmlEncode(ex.Message) & "</p>")
			End Try
		End Sub

        Private Function RegisterUserInfo(ByVal username As String, ByVal password As String) As Integer
            Dim sqlUpdate As String = _
                "UPDATE CID_People " & _
                "SET WebUsername = @WebUsername, WebPassword = @WebPassword " & _
                "WHERE Firstname   = @Firstname " & _
                "  AND Lastname    = @Lastname  " & _
                "  AND StreetNo    = @StreetNo  " & _
                "  AND StreetName  = @StreetName;"

            L.SetConnection()
            L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
            L.dbConnectionSql.Open()
			Dim rowsAffected As Integer = 0

            Try
                Using cmd As New SqlCommand(sqlUpdate, L.dbConnectionSql)
                    ' 1) Add parameters for the UPDATE SET clause
                    cmd.Parameters.AddWithValue("@WebUsername", username.Trim())
                    cmd.Parameters.AddWithValue("@WebPassword", password.Trim())

                    ' 2) Add parameters for the WHERE clause (same values you used before)
                    cmd.Parameters.AddWithValue("@Firstname",  firstNameValue.Trim())
                    cmd.Parameters.AddWithValue("@Lastname",   lastNameValue.Trim())
                    cmd.Parameters.AddWithValue("@StreetNo",   streetNoValue.Trim())
                    cmd.Parameters.AddWithValue("@StreetName", streetAddrValue.Trim())

                    ' 3) ExecuteNonQuery returns the number of rows affected
                    rowsAffected = cmd.ExecuteNonQuery()

                    If rowsAffected > 0 Then
                        Response.Write($"<p>Successfully updated WebUsername/WebPassword for {rowsAffected} row(s).</p>")
                    Else
                        Response.Write("<p>No matching record found to update.</p>")
                    End If
					
                End Using
            Catch ex As Exception
                Response.Write("<p><strong>Error updating WebUsername/WebPassword:</strong> " & _
                            HttpUtility.HtmlEncode(ex.Message) & "</p>")
            Finally
                If  L.dbConnectionSql IsNot Nothing AndAlso _
                    L.dbConnectionSql.State = ConnectionState.Open Then

                    L.dbConnectionSql.Close()
                End If
            End Try 
			return rowsAffected			
        End Function

		''' <summary>
		''' Computes Adler-32 over a UTF-8 string and returns a 32-bit unsigned integer.
		''' Matches JavaScript's ADLER32.str(...) behavior.
		''' </summary>
		Private Function ComputeAdler32(text As String) As UInteger
			Const ModAdler As UInteger = 65521
			Dim a As UInteger = 1
			Dim b As UInteger = 0

			Dim bytes() As Byte = Encoding.UTF8.GetBytes(text)
			For Each by As Byte In bytes
				a = (a + by) Mod ModAdler
				b = (b + a) Mod ModAdler
			Next

			Return (b << 16) Or a
		End Function
		
		Private Function getUserNameAndPassword() As Integer
			Dim i As Integer = 0
		
			Dim streetno As Integer = 17388

			' 2) Build a query that selects just WebUsername and WebPassword
			Dim sqlQuery As String = "
				SELECT WebUsername, WebPassword
				FROM CID_People
				WHERE StreetNo = @streetno
			"

			' 3) Open your connection (using your L helper)
			L.SetConnection()
			L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
			L.dbConnectionSql.Open()

			Try
				' 4) Create a SqlCommand and add the @streetno parameter
				Dim cmd As New SqlCommand(sqlQuery, L.dbConnectionSql)
				cmd.Parameters.AddWithValue("@streetno", streetno)

				' 5) Execute the reader
				Dim reader As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult)

				If reader.HasRows Then
					' 6) Loop through matching rows (usually only one, unless the table allows duplicates)
					While reader.Read()
						' 7) Read just the two fields by name
						Dim webUsername As String = If(reader("WebUsername") Is DBNull.Value, "", reader("WebUsername").ToString())
						Dim webPassword As String = If(reader("WebPassword") Is DBNull.Value, "", reader("WebPassword").ToString())

						' 8) For debugging, write them out (HTML-encode to avoid injection in the browser)
						Response.Write("<p>")
						Response.Write("WebUsername: " & HttpUtility.HtmlEncode(webUsername) & "<br/>")
						Response.Write("WebPassword: " & HttpUtility.HtmlEncode(webPassword))
						Response.Write("</p>")
					End While
				Else
					Response.Write("<p>No records found for StreetNo = " & streetno.ToString() & ".</p>")
				End If

				reader.Close()

			Catch ex As Exception
				Response.Write("<p><strong>Error querying CID_People:</strong> " & HttpUtility.HtmlEncode(ex.Message) & "</p>")
			Finally
				' 9) Always close the connection when done
				If L.dbConnectionSql IsNot Nothing AndAlso L.dbConnectionSql.State = ConnectionState.Open Then
					L.dbConnectionSql.Close()
				End If
			End Try
		End Function
		
        Private Sub SetFFMasterList(ByVal DBName As String)
            Dim i As Integer = 0

            L.SetConnectionMaster()

            Dim sql As String = "SELECT WebCompany, WebFromName, WebFromSmtp, WebFromEmail, WebFromPassword, WebBidToName, " &
            "WebBidToEmail, WebInfoToName, WebInfoToEmail From MasterList " &
            "Where DBName = '" & DBName & "'"
            Try

                L.dbConnectionSql = New SqlConnection(L.dbConnectionStringMaster)

                L.cmdReaderSql = New SqlCommand(sql, L.dbConnectionSql)

                L.dbConnectionSql.Open()

                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)

                While L.dtbReaderSql.Read

                    Session("WebCompany") = L.NN(L.dtbReaderSql(0))
                    Session("WebFromName") = L.NN(L.dtbReaderSql(1))
                    Session("WebFromSmtp") = L.NN(L.dtbReaderSql(2))
                    Session("WebFromEmail") = L.NN(L.dtbReaderSql(3))
                    Session("WebFromPassword") = L.NN(L.dtbReaderSql(4))
                    Session("WebBidToName") = L.NN(L.dtbReaderSql(5))
                    Session("WebBidToEmail") = L.NN(L.dtbReaderSql(6))
                    Session("WebInfoToName") = L.NN(L.dtbReaderSql(7))
                    Session("WebInfoToEmail") = L.NN(L.dtbReaderSql(8))
                End While

                L.dtbReaderSql.Close()

                L.dbConnectionSql.Close()

            Catch ex As Exception
                If Trace.IsEnabled Then Trace.Write("SetFFMasterList" & vbCrLf & ex.Message & vbCrLf & ex.Source & vbCrLf & ex.StackTrace)
            End Try
        End Sub

        Private Sub ClearSessionVariables()
            Session("LoginUsername") = ""
            Session("LoginPassword") = ""
            Session("LoginName") = ""
            Session("LoginCIDID") = ""
            Session("LoginAssociationName") = ""
            Session("LoginStreetname") = ""
            Session("LoginStreetno") = ""
            Session("LoginUnitno") = ""
            Session("LoginEmail") = ""
            Session("LoginWebPrivledge") = ""
            Session("LoginWebAccess") = ""
            Session("LoginRole") = ""
            Session("MailAddress") = ""
            Session("AccountNo") = ""
            Session("LoggedIn") = "False"
            Session("RegistrationCIDID") = ""
            Session("RegistrationFirstName") = ""
            Session("RegistrationLastName") = ""
            Session("RegistrationStreetName") = ""
            Session("RegistrationStreetNo") = ""
            Session("RegistrationUnitNo") = ""
            Session("RegistrationAccountNo") = ""
            Session("EmailCheckOK") = ""
            Session("LoggerFile") = ""
            FormsAuthentication.SignOut()
        End Sub

        Protected Sub UserMessage(ByVal _header As String, ByVal _message As String)
            Dim pcWindow As PopupWindow
            pcWindow = New PopupWindow(ASPxMemo1.Text)
            pcWindow.Modal = True
            pcWindow.HeaderText = _header
            pcWindow.HeaderStyle.Font.Name = "Verdana"
            pcWindow.HeaderStyle.BackColor = Drawing.Color.Lavender
            pcWindow.HeaderStyle.ForeColor = Drawing.Color.Black
            pcWindow.HeaderStyle.Font.Size = 9
            pcWindow.ContentStyle.Font.Name = "Verdana"
            pcWindow.ContentStyle.ForeColor = Drawing.Color.Black
            pcWindow.ContentStyle.Font.Size = 9
            pcWindow.Text = _message
            pcWindow.ShowOnPageLoad = True
            pcWindow.CloseAction = WindowCloseAction.OuterMouseClick
            ASPxPopupControl1.Windows.Add(pcWindow)
        End Sub

        '----------------------------------------------------------------------------------------------------
        Private Sub getAdminCIDs()
            'RemoveHandler ASPxComboBoxAdmin.SelectedIndexChanged, AddressOf ASPxComboBoxAdmin_SelectedIndexChanged
            Dim i As Integer = 0
            L.SetConnection()
            Dim arrlstCIDID As New ArrayList
            sqlQuery = "SELECT * From CID"
            Try
                L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
                L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
                L.dbConnectionSql.Open()
                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                While L.dtbReaderSql.Read
                    arrlstCIDID.Add(L.dtbReaderSql("CIDID"))
                    'ASPxComboBoxAdmin.Items.Add(L.dtbReaderSql("CIDID"))
                    'i += 1
                End While
            Catch
            Finally
                L.dtbReaderSql.Close()
                L.dbConnectionSql.Close()
            End Try
            sqlQuery = "SELECT * From Office_PMCID Where Name = 'Archiver'"
            Try
                L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
                L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
                L.dbConnectionSql.Open()
                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                While L.dtbReaderSql.Read
                    Dim _cidid As String = L.dtbReaderSql("CIDID")
                    If arrlstCIDID.Contains(_cidid) Then
                        arrlstCIDID.Remove(_cidid)
                    End If
                    'ASPxComboBoxAdmin.Items.Remove(L.dtbReaderSql("CIDID")) Then
                    i += 1
                End While
            Catch
            Finally
                L.dtbReaderSql.Close()
                L.dbConnectionSql.Close()
            End Try
            
        End Sub


        Private Function chkAdminUser(ByVal _username As String, ByVal _password As String) As Integer
            Dim i As Integer = 0

            If L Is Nothing Then
                L = New LibraryRoutines()
            End If

            L.SetConnection()
            sqlQuery = "SELECT * From Office_PM Where Username = '" & _username & "' And Password = '" & _password & "'"
            Try
                L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
                L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)

                L.cmdReaderSql.Parameters.AddWithValue("@username", _username)
                L.cmdReaderSql.Parameters.AddWithValue("@password", _password)

                L.dbConnectionSql.Open()
                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                While L.dtbReaderSql.Read
                    Session("LoginUsername") = _username
                    Session("LoginPassword") = _password
                    Session("LoginName") = L.dtbReaderSql("Name")
                    Session("LoginCIDID") = ""
                    Session("LoginStreetname") = ""
                    Session("LoginStreetno") = ""
                    Session("LoginUnitno") = ""
                    Session("LoginEmail") = ""
                    Session("LoginWebPrivledge") = "Board Member"
                    Session("LoginRole") = ""
                    Session("MailAddress") = ""
                    Session("AccountNo") = ""
                    Session("WebAdmin") = "True"
                    Session("LoggedIn") = "True"
                    i += 1
                End While
            Catch ex As Exception
                ' Optional: log or rethrow the exception
                Throw New ApplicationException("Error checking admin user.", ex)

            Finally
                If L.dtbReaderSql IsNot Nothing AndAlso Not L.dtbReaderSql.IsClosed Then
                    L.dtbReaderSql.Close()
                End If
                If L.dbConnectionSql IsNot Nothing AndAlso L.dbConnectionSql.State = ConnectionState.Open Then
                    L.dbConnectionSql.Close()
                End If
            End Try

            Return i
        End Function

        Private Function chkResidentUser(ByVal _username As String, ByVal _password As String) As Integer
            Dim hashpassword As String = GetMD5HashData(_password)
            Dim WebPassword As String = ""
            Dim WebHashPassword As String = ""
            Dim i As Integer = 0
            L.SetConnection()
            sqlQuery = "SELECT Name, CIDID, StreetName, StreetNo, UnitNo, Email, WebPrivledge, Role, Street, AccountNo, WebAdmin, WebPassword From CID_People " &
               "Where WebUsername = '" & _username & "' And WebPassword = '" & _password & "'"
            'sqlQuery = "SELECT Name, CIDID, StreetName, StreetNo, UnitNo, Email, WebPrivledge, Role, Street, AccountNo, WebAdmin, WebPassword, WebHashPassword, WebNewLogin From CID_People " &
            '       "Where WebUsername = '" & _username & "' And (WebPassword = '" & _password & "' Or WebHashPassword = '" & hashpassword & "' And (DateClose is Null Or Len(DateClose) = 0))"
            Try
                L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
                L.dbConnectionSql.Open()
                L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                While L.dtbReaderSql.Read
                    Session("LoginUsername") = _username
                    Session("LoginPassword") = _password
                    'Session("LoginUsername") = username
                    'Session("LoginPassword") = password
                    Session("LoginName") = L.NN(L.dtbReaderSql(0))
                    Session("LoginCIDID") = L.NN(L.dtbReaderSql(1))
                    Session("LoginStreetname") = L.NN(L.dtbReaderSql(2))
                    Session("LoginStreetno") = L.NN(L.dtbReaderSql(3))
                    Session("LoginUnitno") = L.NN(L.dtbReaderSql(4))
                    Session("LoginEmail") = L.NN(L.dtbReaderSql(5))
                    Session("LoginWebPrivledge") = L.NN(L.dtbReaderSql(6))
                    Session("LoginRole") = L.NN(L.dtbReaderSql(7))
                    Session("MailAddress") = L.NN(L.dtbReaderSql(8))
                    Session("AccountNo") = L.NN(L.dtbReaderSql(9))
                    Session("WebAdmin") = L.NN(L.dtbReaderSql(10))
                    Session("WebPassword") = L.NN(L.dtbReaderSql(11))
                    'Session("WebHashPassword") = L.NN(L.dtbReaderSql(12))
                    'If Len(L.NN(L.dtbReaderSql(13))) = 0 Or L.NN(L.dtbReaderSql(13)) = "False" Then
                    '    Session("WebNewLogin") = "False"
                    'Else
                    '    Session("WebNewLogin") = "True"
                    'End If
                    If Len(L.NN(Session("WebPassword"))) > 0 Then
                        Session("WebPassword") = _password
                        'Else
                        '    Session("WebPassword") = Session("WebHashPassword")
                    End If
                    i += 1
                End While

            Catch ex As Exception
                Dim a As String = ex.Message
                Dim b As String = ""
            Finally
                L.dtbReaderSql.Close()
                L.dbConnectionSql.Close()
            End Try
            If i > 0 Then
                Return i
            Else
                Return 0
            End If

        End Function

        Private Function GetMD5HashData(ByVal password As String) As String
            Dim theMD5 As MD5 = MD5.Create()
            Dim hashData As Byte() = theMD5.ComputeHash(Encoding.Default.GetBytes(password))
            Dim returnValue As StringBuilder = New StringBuilder()
            For i As Int32 = 0 To hashData.Length - 1
                returnValue.Append(hashData(i).ToString())
            Next
            Return returnValue.ToString
        End Function

        '----------------------------------------------------------------------------------------------------

        Protected Sub SignIn(ByVal username As String, ByVal password As String)

            'Dim theMessage As String = ""
            'If Len(username) = 0 Or Len(password) = 0 Then
            '    UserMessage("Sign-In Problem", "Both a username and password must be entered")
            '    Exit Sub
            'End If
			'UserMessage("Sign-In Problem", username & "   " & password)
			'Exit Sub
            If chkAdminUser(username, password) > 0 Then
                Session("LoggedIn") = "True"
                FormsAuthentication.SetAuthCookie(username, True)
                If chkRememberMe.Checked Then
                    cookie = Request.Cookies(L.WebSiteName)
                    If cookie Is Nothing Then
                        cookie = New HttpCookie(L.WebSiteName)
                        cookie("Username") = username
                        cookie("Password") = password
                        cookie("WhenExpires") = CStr(DateTime.Now.AddMonths(6))
                        cookie.Expires = DateTime.Now.AddMonths(6)
                        'Response.Cookies.Add(cookie)
                    End If
                End If
                Response.Redirect("~/Default.aspx", False)
                Exit Sub
            End If
			
			Response.Write("After check Admin User : " & chkAdminUser(username, password))

            Dim numLogin As Int32 = chkResidentUser(username, password)
			
			Response.Write("After check Resident User : " & numLogin)
			
            If numLogin = 0 Then
                ClearSessionVariables()
            ElseIf numLogin = 1 Then
                L.SetConnection()
                sqlQuery = "SELECT Name FROM CID Where CIDID = '" & Session("LoginCIDID") & "'"
                L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
                L.dbConnectionSql.Open()
                L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                While L.dtbReaderSql.Read
                    Session("LoginAssociationName") = L.NN(L.dtbReaderSql(0))
                End While
                L.dtbReaderSql.Close()
                L.dbConnectionSql.Close()
                If checkIfArchived(Session("LoginCIDID")) Then
                    Response.Redirect("~/Public/NoAccess.aspx", True)
                    Exit Sub
                End If
                Session("LoggedIn") = "True"
                Session("HasHomePage") = "True"
                If Session("LoggerFile") <> "True" Then
                    Dim theProperty As String = Session("LoginStreetno") & " " & Session("LoginStreetname")
                    If Len(Session("LoginUnitno")) > 0 Then
                        theProperty += " #" & Session("LoginUnitno")
                    End If
                    L.LoggerFile(Session("LoginCIDID"), Session("LoginName"), theProperty)
                    Session("LoggerFile") = True
                End If
                'If Session("WebNewLogin") = "True" Then
                '    Response.Redirect("~/Private/ChangeUsernamePassword.aspx?WebNewLogin=True", True)
                'End If
                FormsAuthentication.SetAuthCookie(username, True)
                If chkRememberMe.Checked Then
                    cookie = Request.Cookies(L.WebSiteName)
                    If cookie Is Nothing Then
                        cookie = New HttpCookie(L.WebSiteName)
                        cookie("Username") = username
                        cookie("Password") = password
                        cookie("WhenExpires") = CStr(DateTime.Now.AddMonths(6))
                        cookie.Expires = DateTime.Now.AddMonths(6)
                        Response.Cookies.Add(cookie)
                    End If
                End If
				
                If Not IsNothing(Request.QueryString(QS_RETURN_URL)) Then
					Response.Write("After check Resident User : True")
					UserMessage("Sign-In Problem True", "True")
                    nextpage = Request.QueryString(QS_RETURN_URL)
                    Response.Redirect(nextpage, True)
                Else
                    L.SetConnection()
                    sqlQuery = "SELECT WebCustomHomePage From CID Where CIDID = '" & Session("LoginCIDID") & "'"
                    Try
                        L.dbConnectionSql = New SqlConnection(L.dbConnectionString)
                        L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
                        L.dbConnectionSql.Open()
                        L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
                        While L.dtbReaderSql.Read
                            If L.NNBoolean(L.dtbReaderSql(0)) = True Then
                                Response.Redirect("http://104.40.1.79/Private/ServiceRequest.aspx", False)
                            Else
                                Response.Redirect("~/Private/ServiceRequest.aspx", False)
                            End If
                        End While

                    Catch ex As Exception
                        Dim a As String = ex.Message
                    Finally
                        L.dtbReaderSql.Close()
                    End Try
                End If
            ElseIf numLogin > 1 Then
                ClearSessionVariables()
                L.dtbReaderSql.Close()
                L.dbConnectionSql.Close()
                UserMessage("Sign-In Problem", "Two or more login accounts were found with the same username and password. " &
                                "Please contact management for further assistance.")
            End If

        End Sub

        Private Function checkIfArchived(ByVal cidid As String) As Boolean
            L.SetConnection()
            sqlQuery = "SELECT * FROM Office_PMCID Where Name = 'Archiver' And CIDID = '" & cidid & "'"
            L.cmdReaderSql = New SqlCommand(sqlQuery, L.dbConnectionSql)
            L.dbConnectionSql.Open()
            L.dtbReaderSql = L.cmdReaderSql.ExecuteReader(CommandBehavior.SingleResult)
            Dim counter As Int32 = 0
            While L.dtbReaderSql.Read
                counter += 1
            End While
            L.dtbReaderSql.Close()
            L.dbConnectionSql.Close()
            If counter >= 1 Then
                Return True
            Else
                Return False
            End If
        End Function

        Private Sub btnSignIn_CallbackError(sender As Object, e As EventArgs) Handles btnSignIn.CallbackError

        End Sub
    End Class
End Namespace