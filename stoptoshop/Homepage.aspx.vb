Imports System.Data.SqlClient
Imports System.Net.Mail

Public Class Homepage
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim qry As String
    Dim dr As SqlDataReader
    Dim i, p As String
    Dim n, s, a As String
    Dim em As New MailMessage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Myframe.Attributes("src") = "Home.aspx"
    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Myframe.Attributes("src") = "Registration.aspx"
    End Sub

    Private Sub btnsignin_ServerClick(sender As Object, e As EventArgs) Handles btnsignin.ServerClick
        If RadioButton1.Checked = True Then
            Try

                con.Open()
                cmd.Connection = con
                cmd.CommandText = "select * from Registration where Email= " & " (@Username)"
                Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
                ps.Direction = ParameterDirection.Input
                ps.Value = Txtusername.Text
                cmd.Parameters.Add(ps)
                dr = cmd.ExecuteReader
                Do While dr.Read
                    i = dr("Password")
                    n = dr("Name")
                    p = dr("imgs")
                    a = dr("Access")
                    If Txtpass.Text = i And a = "user" Then
                        Session("USER") = Txtusername.Text
                        MsgBox("Login Success")
                        Lblname.Text = n
                        Image2.Src = "data:image/jpg;base64," + p
                        Image2.Visible = True
                        Lblname.Visible = True
                        Button4.Visible = True
                        LinkButton8.Visible = True
                        Button2.Visible = True
                        Button3.Visible = True
                        Button1.Visible = False
                    Else
                        MsgBox("Invalid Username or password")
                        Exit Sub

                    End If
                Loop

            Catch ex As Exception

                MsgBox(ex.Message)

            End Try
        ElseIf RadioButton2.Checked = True Then
            Try

                con.Open()
                cmd.Connection = con
                cmd.CommandText = "select * from SRegistration where Email= " & " (@Username)"
                Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
                ps.Direction = ParameterDirection.Input
                ps.Value = Txtusername.Text
                cmd.Parameters.Add(ps)
                dr = cmd.ExecuteReader
                Do While dr.Read
                    i = dr("Password")
                    n = dr("Name")
                    Session("cat") = dr("Category")
                    s = dr("Status")
                    If Txtpass.Text = i And s = "Approved" Then
                        Session("Seller") = Txtusername.Text
                        MsgBox("Login seller")
                        Response.Redirect("Sellerhomepage.aspx")
                    Else
                        MsgBox("Invalid Username or password")
                        Exit Sub

                    End If
                Loop

            Catch ex As Exception

                MsgBox(ex.Message)

            End Try
        ElseIf RadioButton3.Checked = True Then
            Try

                con.Open()
                cmd.Connection = con
                cmd.CommandText = "select * from Registration where Email= " & " (@Username)"
                Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
                ps.Direction = ParameterDirection.Input
                ps.Value = Txtusername.Text
                cmd.Parameters.Add(ps)
                dr = cmd.ExecuteReader
                Do While dr.Read
                    i = dr("Password")
                    n = dr("Name")
                    p = dr("imgs")
                    a = dr("Access")
                    If Txtpass.Text = i And a = "admin" Then
                        Session("Admin") = Txtusername.Text
                        MsgBox("Login successful")
                        Response.Redirect("Adminhomepage.aspx")
                    Else

                        MsgBox("Invalid Username or password")
                        Exit Sub

                    End If
                Loop

            Catch ex As Exception

                MsgBox(ex.Message)

            End Try
        End If

    End Sub

    Private Sub Btnotp_ServerClick(sender As Object, e As EventArgs) Handles Btnotp.ServerClick
        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "select * from Registration where Email= " & " (@Username)"
            Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
            ps.Direction = ParameterDirection.Input
            ps.Value = Textmail.Text
            cmd.Parameters.Add(ps)
            dr = cmd.ExecuteReader
            Do While dr.Read
                i = dr("Password")
                Try
                    em.From = New MailAddress("stoptoshopmail@gmail.com")
                    em.To.Add(Textmail.Text)
                    em.Subject = "StopToShop Password"
                    em.Body = "Your Password is " + i
                    Dim z As New SmtpClient("smtp.gmail.com")
                    Dim q As Integer = "587"
                    z.Port = q
                    z.EnableSsl = True
                    z.Credentials = New System.Net.NetworkCredential("stoptoshopmail@gmail.com", "mail@stoptoshop.com")
                    z.Send(em)
                    MsgBox("Password sent to email id")
                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
            Loop

        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        Myframe.Attributes("src") = "Technology.aspx"
    End Sub

    Private Sub LinkButton7_Click(sender As Object, e As EventArgs) Handles LinkButton7.Click
        Myframe.Attributes("src") = "Sregisteration.aspx"
    End Sub

    Private Sub LinkButton8_Click(sender As Object, e As EventArgs) Handles LinkButton8.Click
        If Lblname.Text <> "" Then
            Myframe.Attributes("src") = "Purchase.aspx"
        Else
            MsgBox("You need to login to view orders")
        End If

    End Sub

    Private Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        Myframe.Attributes("src") = "Home.aspx"
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        If Lblname.Text <> "" Then
            Myframe.Attributes("src") = "Cart.aspx"
        Else
            MsgBox("You need to login to open cart")
        End If
    End Sub

    Private Sub LinkButton5_Click(sender As Object, e As EventArgs) Handles LinkButton5.Click
        Myframe.Attributes("src") = "fashion.aspx"
    End Sub

    Private Sub LinkButton6_Click(sender As Object, e As EventArgs) Handles LinkButton6.Click
        Myframe.Attributes("src") = "sports.aspx"
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Myframe.Attributes("src") = "cpurchase.aspx"
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Server.Transfer("Homepage.aspx")
    End Sub
End Class