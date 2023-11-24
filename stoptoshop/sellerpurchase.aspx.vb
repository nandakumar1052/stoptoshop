Imports System.Data.SqlClient

Public Class sellerpurchase
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry, p, t As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        p = GridView2.SelectedRow.Cells(2).Text
        Session("grid") = GridView2.SelectedRow.Cells(5).Text
        If con.State = ConnectionState.Open Then
            con.Close()

        End If
        Try
            con.Open()
            cmd.Parameters.Clear()
            cmd.Connection = con
            cmd.CommandText = "select * from Purchase where PurId= " & " (@U)"
            Dim pt As New SqlParameter("@U", SqlDbType.NVarChar)
            pt.Direction = ParameterDirection.Input
            pt.Value = GridView2.SelectedRow.Cells(5).Text
            cmd.Parameters.Add(pt)
            dr = cmd.ExecuteReader
            Do While dr.Read
                t = dr("Deliever").ToString()
                If t <> "success" Then
                    Button1.Visible = True
                Else
                    Button1.Visible = False
                End If

            Loop
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
        Try

            con.Open()
            cmd.Parameters.Clear()
            cmd.Connection = con
            cmd.CommandText = "select * from Registration where Email= " & " (@User)"
            Dim ps As New SqlParameter("@User", SqlDbType.NVarChar)
            ps.Direction = ParameterDirection.Input
            ps.Value = p
            cmd.Parameters.Add(ps)
            dr = cmd.ExecuteReader
            Do While dr.Read
                Txtname.Text = dr("Name").ToString()
                txtaddress.Text = dr("Address").ToString()
                Txtcity.Text = dr("City").ToString()
                Txtstate.Text = dr("State").ToString()
                Txtcountry.Text = dr("Country").ToString()
                Txtphone.Text = dr("Phone").ToString()
                Txtemail.Text = p
            Loop

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

            Dim query As String = "update Purchase set Deliever=@P,Received=@E where PurId=@O"
            Using con
                Using command As SqlCommand = New SqlCommand(query, con)
                    command.Parameters.AddWithValue("@O", Session("grid").ToString())
                    command.Parameters.AddWithValue("@P", "success")
                    command.Parameters.AddWithValue("@E", "failure")

                    command.ExecuteNonQuery()
                    MsgBox("success")
                    Response.Redirect("sellerpurchase.aspx")
                End Using
            End Using

            con.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub
End Class