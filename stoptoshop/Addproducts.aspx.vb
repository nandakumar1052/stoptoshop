Imports System.Data.SqlClient
Imports System.Drawing.Image
Imports System.Drawing
Public Class Addproducts
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry, imgd As String
    Dim r As New Random
    Dim dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Txtprodid.Text = Convert.ToString(r.Next(10000, 99999))
    End Sub

    Private Sub Btnregi_Click(sender As Object, e As EventArgs) Handles Btnregi.Click
        If Txtprodid.Text <> "" And Txtprodname.Text <> "" And Txtprice.Text <> "" And Txtdescription.Text <> "" Then
            Dim obj As New ImageConverter()
            Dim imgdata As Byte() = Nothing
            Dim file As HttpPostedFile = FileUpload1.PostedFile
            imgdata = New Byte(file.ContentLength - 1) {}
            file.InputStream.Read(imgdata, 0, file.ContentLength)
            imgd = Convert.ToBase64String(imgdata)
            If con.State = ConnectionState.Open Then

                con.Close()

            End If

            Try
                qry = " insert into Product values(@ProdId,@Prodname,@Price,@Description,@Category,@Prodimgs)"

                Dim cmd As SqlCommand = New SqlCommand(qry, con)
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@ProdId", Txtprodid.Text)
                cmd.Parameters.AddWithValue("@Prodname", Txtprodname.Text)
                cmd.Parameters.AddWithValue("@Price", Txtprice.Text)
                cmd.Parameters.AddWithValue("@Description", Txtdescription.Text)
                cmd.Parameters.AddWithValue("@Category", DropDownList1.SelectedItem.ToString())
                cmd.Parameters.AddWithValue("@Prodimgs", imgd)
                con.Open()
                cmd.ExecuteNonQuery()
                MsgBox("Product Added successfully", MsgBoxStyle.Information)
                Txtprodid.Text = ""
                Txtprodname.Text = ""
                Txtprice.Text = ""
                Txtdescription.Text = ""
            Catch ex As Exception

                MsgBox(ex.Message)

            End Try
        Else
            MsgBox("Please fill all the columns!!!")
        End If
    End Sub
End Class