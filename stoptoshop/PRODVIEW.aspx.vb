Imports System.Data.SqlClient

Public Class PRODVIEW
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\project\stoptoshop\stoptoshop\App_Data\STS.mdf;Integrated Security=True")
    Dim cmd As New SqlCommand
    Dim dr As SqlDataReader
    Dim i As String
    Dim ll As String
    Dim lp As String
    Dim ld As String
    Dim pn, de, ca, pimg As String
    Dim pr As Integer
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Lbliid.Text = Session("IID").ToString()
        Lbliid.Visible = False
        If con.State = ConnectionState.Open Then
            con.Close()

        End If
        Try

            con.Open()
            cmd.Connection = con
            cmd.CommandText = "select * from Product where ProdId= " & " (@Username)"
            Dim ps As New SqlParameter("@Username", SqlDbType.NVarChar)
            ps.Direction = ParameterDirection.Input
            ps.Value = Lbliid.Text
            cmd.Parameters.Add(ps)
            dr = cmd.ExecuteReader
            Do While dr.Read
                i = dr("Prodimgs")
                ll = dr("Prodname")
                lp = dr("Price")
                ld = dr("Description")
            Loop
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
        ImageButton1.ImageUrl = "data:image/jpg;base64," + i
        Image1.ImageUrl = "data:image/jpg;base64," + i
        Label1.Text = ll
        Label2.Text = "Rs." + lp
        TextBox1.Text = ld
    End Sub

    Private Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Image1.ImageUrl = ImageButton1.ImageUrl
    End Sub

    Private Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        Image1.ImageUrl = "data:image/jpg;base64," + e.CommandArgument.ToString()
    End Sub

    Private Sub btn1_ServerClick(sender As Object, e As EventArgs) Handles btn1.ServerClick
        Try
            If Session("USER").ToString <> "" Then
                If con.State = ConnectionState.Open Then
                    con.Close()

                End If
                Try

                    con.Open()
                    cmd.Connection = con
                    cmd.CommandText = "select * from Product where ProdId= " & " (@User)"
                    Dim ps As New SqlParameter("@User", SqlDbType.NVarChar)
                    ps.Direction = ParameterDirection.Input
                    ps.Value = Lbliid.Text
                    cmd.Parameters.Add(ps)
                    dr = cmd.ExecuteReader
                    Do While dr.Read
                        pimg = dr("Prodimgs")
                        pn = dr("Prodname")
                        pr = dr("Price")
                        de = dr("Description")
                        ca = dr("Category")
                    Loop
                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
                con.Close()
                Try

                    Dim pp As New Integer
                    pp = Convert.ToString(r.Next(100000, 999999))
                    If con.State = ConnectionState.Open Then
                        con.Close()

                    End If
                    Try
                        con.Open()
                        Dim query As String = "insert into Cart values(@CartId,@ProdId,@Email,@Prodname,@Price,@Description,@Category,@Prodimgs)"
                        Dim cmd As SqlCommand = New SqlCommand(query, con)
                        cmd.Parameters.AddWithValue("@CartId", pp)
                        cmd.Parameters.AddWithValue("@ProdId", Lbliid.Text)
                        cmd.Parameters.AddWithValue("@Email", Session("USER").ToString())
                        cmd.Parameters.AddWithValue("@Prodname", pn)
                        cmd.Parameters.AddWithValue("@Price", pr)
                        cmd.Parameters.AddWithValue("@Description", de)
                        cmd.Parameters.AddWithValue("@Category", ca)
                        cmd.Parameters.AddWithValue("@Prodimgs", pimg)
                        cmd.ExecuteNonQuery()
                        MsgBox("success")

                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try
                    con.Close()

                Catch ex As Exception
                    MsgBox("You need to login to add to cart")
                End Try
            Else
                MsgBox("You need to login to add to cart")
            End If
        Catch ex As Exception
            MsgBox("You need to login to add to cart")
        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            If Session("USER").ToString <> "" And TextBox2.Text <> "" Then
                Dim pp As New Integer
                pp = Convert.ToString(r.Next(100000, 999999))
                If con.State = ConnectionState.Open Then
                    con.Close()

                End If
                Try
                    con.Open()
                    Dim query As String = "insert into Que values(@QId,@ProdId,@Quest,@Ans)"
                    Dim cmd As SqlCommand = New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@QId", pp)
                    cmd.Parameters.AddWithValue("@ProdId", Lbliid.Text)
                    cmd.Parameters.AddWithValue("@Quest", TextBox2.Text)
                    cmd.Parameters.AddWithValue("@Ans", "none")
                    cmd.ExecuteNonQuery()
                    MsgBox("success")
                    con.Close()
                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
                con.Close()
            Else
                MsgBox("You need to login to ask questions")
            End If
        Catch ex As Exception
            MsgBox("You need to login to ask questions")
        End Try
        con.Close()
    End Sub

    Private Sub DataList3_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList3.ItemCommand
        Session("IID") = e.CommandArgument.ToString()
        Response.Redirect("PRODVIEW.aspx")
    End Sub
End Class