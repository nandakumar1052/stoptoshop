Imports System.Data.SqlClient

Public Class cpurchase
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry, qry1, pp, pt As String
    Dim p, pn, pr, pi As String
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label3.Text = Session("USER").ToString()
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand("Select PurId,ProdId,SEmail,Price,date FROM Purchase where CEmail='" + Label3.Text + "' and Deliever='" + "success" + "' and Received='" + "failure" + "'", con)
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        GridView2.DataSource = dr
        GridView2.DataBind()
        con.Close()
    End Sub

    Private Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        p = GridView2.SelectedRow.Cells(2).Text
        Session("gst") = GridView2.SelectedRow.Cells(1).Text
        If con.State = ConnectionState.Open Then
            con.Close()

        End If
        Try

            con.Open()
            cmd.Parameters.Clear()
            cmd.Connection = con
            cmd.CommandText = "select * from Product where ProdId= " & " (@User)"
            Dim ps As New SqlParameter("@User", SqlDbType.NVarChar)
            ps.Direction = ParameterDirection.Input
            ps.Value = p
            cmd.Parameters.Add(ps)
            dr = cmd.ExecuteReader
            Do While dr.Read
                pn = dr("Prodname").ToString()
                pi = dr("Prodimgs").ToString()
            Loop
            Im1.ImageUrl = "data:image/jpg;base64," + pi
            Lb1.Text = pn
            Lb2.Text = "Rs. " + GridView2.SelectedRow.Cells(4).Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If con.State = ConnectionState.Open Then
            con.Close()

        End If
        Try
            con.Open()
            Dim query As String = "update Purchase set Deliever=@P,Received=@E where PurId=@O"
            Using con
                Using command As SqlCommand = New SqlCommand(query, con)
                    command.Parameters.AddWithValue("@O", Session("gst").ToString())
                    command.Parameters.AddWithValue("@P", "success")
                    command.Parameters.AddWithValue("@E", "success")
                    command.ExecuteNonQuery()
                    MsgBox("success")
                    con.Close()
                    Response.Redirect("cpurchase.aspx")
                End Using
            End Using
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class