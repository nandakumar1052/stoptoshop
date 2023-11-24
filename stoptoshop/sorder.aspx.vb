Imports System.Data.SqlClient

Public Class sorder
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry As String
    Dim p, pn, pr, pi As String
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label3.Text = Session("Seller").ToString()
        Label3.Visible = False
    End Sub

    Private Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        p = GridView1.SelectedRow.Cells(2).Text
        Session("pprod") = GridView1.SelectedRow.Cells(2).Text
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
                pr = dr("Price").ToString()
                pi = dr("Prodimgs").ToString()
            Loop
            Image1.ImageUrl = "data:image/jpg;base64," + pi
            Label1.Text = pn
            Label2.Text = "Rs. " + pr
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If con.State = ConnectionState.Open Then
            con.Close()
        End If

        Try
            con.Open()

            Dim query As String = "INSERT INTO ORD(OrdId,OrderId, ProdId, CEmail,SEmail, Price) VALUES (@Or,@O, @P, @CE,@SE,@Pr)"
            Using con
                Using command As SqlCommand = New SqlCommand(query, con)
                    command.Parameters.AddWithValue("@Or", Convert.ToString(r.Next(100000, 999999)))
                    command.Parameters.AddWithValue("@O", GridView1.SelectedRow.Cells(1).Text)
                    command.Parameters.AddWithValue("@P", GridView1.SelectedRow.Cells(2).Text)
                    command.Parameters.AddWithValue("@CE", GridView1.SelectedRow.Cells(3).Text)
                    command.Parameters.AddWithValue("@SE", Label3.Text)
                    command.Parameters.AddWithValue("@Pr", TextBox1.Text)
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

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Try
            con.Open()
            Dim cmd As SqlCommand = New SqlCommand("Select Price FROM ORD where ProdId= '" & Session("pprod").ToString() & "'", con)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            GridView2.DataSource = dr
            GridView2.DataBind()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub
End Class