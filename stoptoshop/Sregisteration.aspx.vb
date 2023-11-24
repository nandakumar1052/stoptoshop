Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.IO
Imports System.Collections.Specialized
Imports System.Net
Imports System.Drawing.Image
Imports System.Drawing
Imports Twilio
Imports Twilio.Rest.Api.V2010
Imports Twilio.Rest.Api.V2010.Account
Imports Twilio.Types

Public Class Sregisteration
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection("Data Source=DESKTOP-FR1MDS4;Initial Catalog=`stgwordpress;Integrated Security=True")
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim cmmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim em As New MailMessage
    Dim qry, imgd As String
    Dim r As New Random
    Dim dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            Panel1.Visible = False
        End If
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim timer, timer_arr() As String
        timer = lblcountdown.Text
        timer_arr = timer.Split(":")
        Dim seconds = Integer.Parse(timer_arr(1))
        Dim minutes = Integer.Parse(timer_arr(0))
        If seconds = 0 And minutes = 0 Then
            Timer1.Enabled = False
            lblcountdown_TextChanged()
        Else
            seconds = seconds - 1
        End If
        If (seconds < 0) Then
            seconds = 59
            minutes = minutes - 1
        End If

        lblcountdown.Text = minutes & ":" & seconds
    End Sub
    Private Sub Btnotp_Click(sender As Object, e As EventArgs) Handles Btnotp.Click
        Txtpassword.Text = Session("pass").ToString()

        If Txtemailotp.Text = Session("Emailotp").ToString And Txtphoneotp.Text = Session("Phoneotp").ToString() Then

            If con.State = ConnectionState.Open Then

                con.Close()

            End If

            Try
                qry = " insert into SRegistration values(@Email,@Name,@Address,@City,@State,@Country,@Phone,@Password,@Category,@Certificate,@Status,@imgs)"

                Dim cmd As SqlCommand = New SqlCommand(qry, con)
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@Email", Session("email").ToString())
                cmd.Parameters.AddWithValue("@Name", Txtname.Text)
                cmd.Parameters.AddWithValue("@Address", Txtaddress.Text)
                cmd.Parameters.AddWithValue("@City", Session("city").ToString())
                cmd.Parameters.AddWithValue("@State", Session("state").ToString())
                cmd.Parameters.AddWithValue("@Country", "India")
                cmd.Parameters.AddWithValue("@Phone", Txtphone.Text)
                cmd.Parameters.AddWithValue("@Password", Txtpassword.Text)
                cmd.Parameters.AddWithValue("@Category", DropDownList1.SelectedItem.ToString())
                cmd.Parameters.AddWithValue("@Certificate", Server.MapPath(FileUpload1.FileName) + "\" + FileUpload1.FileName)
                cmd.Parameters.AddWithValue("@Status", "unapproved")
                cmd.Parameters.AddWithValue("@imgs", Session("iim").ToString())
                con.Open()

                cmd.ExecuteNonQuery()
                MsgBox("Seller registered successfully", MsgBoxStyle.Information)
                Dim email As String = Session("email").ToString()
                Dim pass As String = Txtpassword.Text
                Try
                    em.From = New MailAddress("stoptoshopmail@gmail.com")
                    em.To.Add(email)
                    em.Subject = "Registration Successful"
                    em.Body = "Thankyou for registering in StopToShop website. We hope you have a wonderful experience. You Username is " + email + " and Password is " + pass + ""
                    Dim z As New SmtpClient("smtp.gmail.com")
                    Dim q As Integer = "587"
                    z.Port = q
                    z.EnableSsl = True
                    z.Credentials = New System.Net.NetworkCredential("stoptoshopmail@gmail.com", "mail@stoptoshop.com")
                    z.Send(em)
                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
                Panel1.Visible = False
                Txtname.Text = ""
                Txtemail.Text = ""
                Txtaddress.Text = ""
                Txtphone.Text = ""
                Txtpassword.Text = ""
            Catch ex As Exception

                MsgBox(ex.Message)

            End Try
        Else
            MsgBox("Wrong OTP. Please Try Again")
        End If

    End Sub

    Private Sub Btnregi_Click(sender As Object, e As EventArgs) Handles Btnregi.Click
        If Txtname.Text = "" Or Txtemail.Text = "" Or Txtaddress.Text = "" Or Txtpassword.Text = "" Or Txtphone.Text = "" Then
            MsgBox("Please fill all the columns!!!")
        Else
            Dim ap As String = Microsoft.VisualBasic.Right(Txtemail.Text, 10)
            If ap = "@gmail.com" Then
                If IsNumeric(Txtphone.Text) = True And Txtphone.Text.Length = 10 Then
                    Session("state") = stateId.SelectedItem.ToString()
                    Session("city") = cityId.SelectedItem.ToString()
                    Session("pass") = Txtpassword.Text
                    Dim obj As New ImageConverter()
                    Dim imgdata As Byte() = Nothing
                    Dim file As HttpPostedFile = FileUpload2.PostedFile
                    imgdata = New Byte(file.ContentLength - 1) {}
                    file.InputStream.Read(imgdata, 0, file.ContentLength)
                    imgd = Convert.ToBase64String(imgdata)
                    Session("iim") = imgd
                    Timer1.Enabled = True
                    Panel1.Visible = True
                    emailmessage()
                    phonemessage()
                Else
                    MsgBox("Invalid mobile number")
                End If
            Else
                    MsgBox("Invalid mail Id")
            End If
        End If
    End Sub

    Private Sub lblcountdown_TextChanged()
        If lblcountdown.Text = "0:0" Then
            Response.Redirect("Registration.aspx")
        End If
    End Sub

    Private Sub phonemessage()
        Try
            Dim Number As String = "+91" + Txtphone.Text
            Session("Phoneotp") = Convert.ToString(r.Next(10000, 99999))
            Const accountSid = "ACcfcead233b0a0644ea6d26d0ea06db8c"
            Const authToken = "c01181aee025386ead9952ce4a1226e2"
            TwilioClient.Init(accountSid, authToken)

            Dim toNumber = New PhoneNumber(Number)
            Dim message = MessageResource.Create(
            toNumber, from:=New PhoneNumber("+447360543549"),
            body:=Session("Phoneotp").ToString())


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub emailmessage()
        Try
            em.From = New MailAddress("stoptoshopmail@gmail.com")
            em.To.Add(Txtemail.Text)
            Session("email") = Txtemail.Text
            em.Subject = "StopToShop OTP"
            Session("Emailotp") = Convert.ToString(r.Next(10000, 99999))
            em.Body = Session("Emailotp")
            Dim z As New SmtpClient("smtp.gmail.com")
            Dim q As Integer = "587"
            z.Port = q
            z.EnableSsl = True
            z.Credentials = New System.Net.NetworkCredential("stoptoshopmail@gmail.com", "mail@stoptoshop.com")
            z.Send(em)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub stateId_SelectedIndexChanged(sender As Object, e As EventArgs) Handles stateId.SelectedIndexChanged
        cmmd = New SqlCommand("SELECT Cityname FROM cities where Statename='" + stateId.SelectedValue.ToString() + "'", conn)
        conn.Open()
        cityId.DataSource = cmmd.ExecuteReader()
        cityId.DataTextField = "Cityname"
        cityId.DataValueField = "Cityname"
        cityId.DataBind()
        conn.Close()
    End Sub

End Class