Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing.Image
Imports System.Drawing

Public Class Addprodimg
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim imgd As String
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        Label3.Text = GridView2.SelectedRow.Cells(1).Text
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim pp As New Integer
        pp = Convert.ToString(r.Next(10000, 999999))


        Dim obj As New ImageConverter()


        Dim imgdata As Byte() = Nothing
        Dim file As HttpPostedFile = FileUpload1.PostedFile
        imgdata = New Byte(file.ContentLength - 1) {}
        file.InputStream.Read(imgdata, 0, file.ContentLength)
        imgd = Convert.ToBase64String(imgdata)

        Dim query As String = "insert into Prodimgs values(@imgId,@ProdId,@Prodimg)"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        cmd.Parameters.AddWithValue("@imgId", pp)
        cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(Label3.Text))
        cmd.Parameters.AddWithValue("@Prodimg", imgd)
        con.Open()
        cmd.ExecuteNonQuery()
        MsgBox("success")
        con.Close()
    End Sub
End Class