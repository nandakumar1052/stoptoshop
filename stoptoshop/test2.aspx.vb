Imports Twilio
Imports Twilio.Rest.Api.V2010
Imports Twilio.Rest.Api.V2010.Account
Imports Twilio.Types

Public Class test2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ' Find your Account Sid and Auth Token at twilio.com/console
        Const accountSid = "ACcfcead233b0a0644ea6d26d0ea06db8c"
        Const authToken = "c01181aee025386ead9952ce4a1226e2"
        TwilioClient.Init(accountSid, authToken)

        Dim toNumber = New PhoneNumber("+919206257512")
        Dim message = MessageResource.Create(
            toNumber, from:=New PhoneNumber("+447360543549"),
            body:="This is the ship that made the Kessel Run in fourteen parsecs?")
        Label4.Text = message.Status.ToString()
        Console.WriteLine(message.Status)
    End Sub
End Class