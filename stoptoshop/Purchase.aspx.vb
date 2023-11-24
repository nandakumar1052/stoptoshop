Imports System.Data.SqlClient
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports paytm

Public Class Purchase
    Inherits System.Web.UI.Page
    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry As String
    Dim p, pn, pr, pi As String
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label3.Text = Session("USER").ToString()
        con.Open()
        Dim cmd As SqlCommand = New SqlCommand("Select * FROM ORD where CEmail='" + Label3.Text + "'", con)
        Dim dr As SqlDataReader = cmd.ExecuteReader()
        GridView2.DataSource = dr
        GridView2.DataBind()
        con.Close()
    End Sub

    Private Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged

        p = GridView2.SelectedRow.Cells(3).Text
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
            Lb2.Text = "Rs. " + GridView2.SelectedRow.Cells(6).Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Try
            Session("prid") = GridView2.SelectedRow.Cells(3).Text
            Session("ce") = GridView2.SelectedRow.Cells(4).Text
            Session("se") = GridView2.SelectedRow.Cells(5).Text
            Session("pri") = GridView2.SelectedRow.Cells(6).Text
            Session("orde") = GridView2.SelectedRow.Cells(2).Text
            If con.State = ConnectionState.Open Then
                con.Close()
            End If

            Try
                con.Open()

                Dim query As String = "INSERT INTO Purchase(PurId, ProdId, CEmail, SEmail, Price,date,Deliever,Received) VALUES (@O, @P, @E,@S,@Pr,@D,@dr,@rv)"
                Using con
                    Using command As SqlCommand = New SqlCommand(query, con)
                        command.Parameters.AddWithValue("@O", Convert.ToString(r.Next(100000, 999999)))
                        command.Parameters.AddWithValue("@P", Session("prid").ToString())
                        command.Parameters.AddWithValue("@E", Session("ce").ToString())
                        command.Parameters.AddWithValue("@S", Session("se").ToString())
                        command.Parameters.AddWithValue("@Pr", Session("pri").ToString())
                        command.Parameters.AddWithValue("@D", (DateTime.Now.ToString("dd-MM-yyyy")))
                        command.Parameters.AddWithValue("@dr", "failure")
                        command.Parameters.AddWithValue("@rv", "failure")
                        command.ExecuteNonQuery()
                        If con.State = ConnectionState.Open Then
                            con.Close()
                        End If
                        Try
                            con.Open()
                            qry = "Delete from ORD where OrderId = '" & Session("orde").ToString() & "'"
                            cmd = New SqlCommand(qry, con)
                            cmd.ExecuteNonQuery()
                            ClientScript.RegisterStartupScript(Me.Page.[GetType](), "", "window.open('WebForm2.aspx');", True)
                        Catch ex As Exception
                            MsgBox(ex.Message)
                        End Try
                    End Using
                End Using

                con.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            con.Close()
        Catch ex As Exception
            MsgBox("Select the product to purchase")
        End Try
    End Sub

End Class