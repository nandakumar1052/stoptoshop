Imports System.Data.SqlClient
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Configuration

Public Class Home
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim sp As String
    Dim dr As SqlDataReader
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DropDownList1.Visible = False
        If (IsPostBack) Then

            DropDownList1.Items.Clear()
            If con.State = ConnectionState.Open Then
                con.Close()

            End If
            Try

                con.Open()
                cmd.Connection = con
                cmd.CommandText = "SELECT * FROM Adv"
                dr = cmd.ExecuteReader
                Do While dr.Read
                    sp = dr("Adimg")
                    sp = "data:image/jpg;base64," + sp
                    DropDownList1.Items.Add(sp)
                Loop
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
            con.Close()
        End If

    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim p As Integer = DropDownList1.Items.Count.ToString()
        Dim i As Integer = r.Next(0, p)
        Randomize()
        Image1.ImageUrl = DropDownList1.Items.Item(i).ToString()
    End Sub

    Private Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("sports.aspx")
    End Sub

    Private Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("sports.aspx")
    End Sub

    Private Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        Response.Redirect("sports.aspx")
    End Sub

    Private Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        Response.Redirect("fashion.aspx")
    End Sub

    Private Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click
        Response.Redirect("fashion.aspx")
    End Sub

    Private Sub ImageButton6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton6.Click
        Response.Redirect("fashion.aspx")
    End Sub

    Private Sub ImageButton7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton7.Click
        Response.Redirect("Technology.aspx")
    End Sub

    Private Sub ImageButton8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton8.Click
        Response.Redirect("Technology.aspx")
    End Sub

    Private Sub ImageButton9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton9.Click
        Response.Redirect("Technology.aspx")
    End Sub
End Class