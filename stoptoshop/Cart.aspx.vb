Imports System.Data.SqlClient

Public Class Cart
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim cmd1 As New SqlCommand
    Dim dr As SqlDataReader
    Dim qry, qry1 As String
    Dim ls, ca, s As String
    Dim pi As Integer
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label1.Text = Session("USER").ToString()
    End Sub

    Protected Sub DataList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DataList1.SelectedIndexChanged

    End Sub

    Private Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        Dim qtytxtbox As TextBox = CType((e.Item.FindControl("Qty")), TextBox)

        If e.CommandName.ToString = "lnk1" Then
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Try
                con.Open()
                ls = e.CommandArgument.ToString()
                qry = "Delete from Cart where CartId = '" & ls & "'"
                cmd = New SqlCommand(qry, con)
                cmd.ExecuteNonQuery()
                MsgBox("success")
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        ElseIf e.CommandName.ToString = "btn11" Then
            Try
                If qtytxtbox.Text > 0 And qtytxtbox.Text <= 10 Then
                    If con.State = ConnectionState.Open Then
                        con.Close()

                    End If
                    Try

                        con.Open()
                        cmd.Parameters.Clear()
                        cmd.Connection = con
                        cmd.CommandText = "select * from Cart where CartId= " & " (@User)"
                        Dim ps As New SqlParameter("@User", SqlDbType.NVarChar)
                        ps.Direction = ParameterDirection.Input
                        s = e.CommandArgument.ToString()
                        ps.Value = e.CommandArgument.ToString()
                        cmd.Parameters.Add(ps)
                        dr = cmd.ExecuteReader
                        Do While dr.Read
                            pi = dr("ProdId")
                            ca = dr("Category")
                        Loop
                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try
                    con.Close()
                    Try
                        con.Open()

                        Dim query As String = "INSERT INTO Ordername(OrderId, ProdId, Email, Category,date, quantity) VALUES (@O, @P, @E, @C,@d, @Q)"
                        Using con
                            Using command As SqlCommand = New SqlCommand(query, con)
                                command.Parameters.AddWithValue("@O", Convert.ToString(r.Next(100000, 999999)))
                                command.Parameters.AddWithValue("@P", pi.ToString())
                                command.Parameters.AddWithValue("@E", Label1.Text)
                                command.Parameters.AddWithValue("@C", ca)
                                command.Parameters.AddWithValue("@d", (DateTime.Now.ToString("dd-MM-yyyy")))
                                command.Parameters.AddWithValue("@Q", qtytxtbox.Text)
                                command.ExecuteNonQuery()
                                MsgBox("success")
                            End Using
                        End Using

                        con.Close()
                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try
                    con.Close()
                Else
                    MsgBox("Atleast 1 item must be ordered and maximum 10 item can be ordered")
                End If
            Catch ex As Exception
                MsgBox("Invalid Quantity")
            End Try
        End If
        Response.Redirect("Cart.aspx")
    End Sub
End Class