Imports System.Data.SqlClient

Public Class Sellerhomepage
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim qry, i As String
    Dim dr As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
        Try

            con.Open()
            cmd.Connection = con
            cmd.CommandText = "select * from SRegistration where Email= " & " (@Username)"
            Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
            ps.Direction = ParameterDirection.Input
            ps.Value = Session("Seller").ToString()
            cmd.Parameters.Add(ps)
            dr = cmd.ExecuteReader
            Do While dr.Read
                Lblname.Text = dr("Name").ToString()
                i = dr("imgs").ToString()
            Loop
            Image2.Src = "data:image/jpg;base64," + i
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Myframe.Attributes("src") = "sorder.aspx"
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Myframe.Attributes("src") = "sellerpurchase.aspx"
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Homepage.aspx")
    End Sub
End Class