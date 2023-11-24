<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Cart.aspx.vb" Inherits="stoptoshop.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .m11{
            margin-left:-85px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <div>

            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="CartId">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td rowspan="3">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Eval("Prodimgs") %>' Width="200px" Height="200px" />
                            </td>
                            <td class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text='<%# Eval("Prodname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text='<%# "Rs. " + Eval("Price").ToString() %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Quantity " Font-Size="Large"></asp:Label><asp:TextBox ID="Qty" runat="server"></asp:TextBox>
                                </td>
                            <td><asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Large" CssClass="m11"  CommandName="lnk1" CommandArgument='<%# Eval("CartId") %>'>Remove</asp:LinkButton> &nbsp &nbsp <asp:Button ID="btn1" runat="server" class="btn btn-primary" Text="Place the order" style="width: 125px" CommandName="btn11" CommandArgument='<%# Eval("CartId") %>' /></td></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Cart] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="Email" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
        <div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
