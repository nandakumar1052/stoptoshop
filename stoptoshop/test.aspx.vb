Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing.Image
Imports System.Drawing

Public Class test
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Public sp As String
    Dim imgd As String
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim obj As New ImageConverter()


        Dim imgdata As Byte() = Nothing
        Dim file As HttpPostedFile = FileUpload1.PostedFile
        imgdata = New Byte(file.ContentLength - 1) {}
        file.InputStream.Read(imgdata, 0, file.ContentLength)
        imgd = Convert.ToBase64String(imgdata)

        Dim query As String = "insert into Product values(@ProdId,@Prodname,@Price,@Description,@Category,@Prodimgs)"
        Dim cmd As SqlCommand = New SqlCommand(query, con)
        cmd.Parameters.AddWithValue("@ProdId", Session("ttx").ToString())
        cmd.Parameters.AddWithValue("@Prodname", "")
        cmd.Parameters.AddWithValue("@Price", "")
        cmd.Parameters.AddWithValue("@Description", "")
        cmd.Parameters.AddWithValue("@Category", "")
        cmd.Parameters.AddWithValue("@Prodimgs", imgd)
        con.Open()
        cmd.ExecuteNonQuery()
        MsgBox("success")
        con.Close()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
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
        cmd.Parameters.AddWithValue("@ProdId", Convert.ToInt32(TextBox1.Text))
        cmd.Parameters.AddWithValue("@Prodimg", imgd)
        con.Open()
        cmd.ExecuteNonQuery()
        MsgBox("success")
        con.Close()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Try
            con.Open()

            Dim query As String = "INSERT INTO Ordername(OrderId, ProdId, Email, Category,date) VALUES (@O, @P, @E, @C,@d)"
            Using con
                Using command As SqlCommand = New SqlCommand(query, con)
                    command.Parameters.AddWithValue("@O", Convert.ToString(r.Next(100000, 999999)))
                    command.Parameters.AddWithValue("@P", 1)
                    command.Parameters.AddWithValue("@E", "jhj")
                    command.Parameters.AddWithValue("@C", "jvhgv")
                    command.Parameters.AddWithValue("@d", (DateTime.Now.ToString("dd-MM-yyyy")))

                    command.ExecuteNonQuery()
                    MsgBox("success")
                End Using
            End Using

            con.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub
End Class