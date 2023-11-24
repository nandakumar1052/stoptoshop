<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Technology.aspx.vb" Inherits="stoptoshop.Technology" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 300px;
            height: 330px;
            border:thin;
            border-style:solid;
            margin-left:25px;
        }
        .auto-style2 {
            height: 123px;
            
        }
        .imgs{
            width:160px;
            height:200px;
            margin-left:25%;
        }
        .spp{
            margin-top:10px;
        }
        .mm{
            margin-left:10px;
            margin-top:20px;
        }
        .lilb{
            align-self:center;
        }
        .dd{
            margin-left:350px;
        }
        .pq {
            border-radius: 5px;
            border: none;
            background-color:rgb(52, 67, 230)
        }
        .pq:hover{
            background-color:rgb(14, 25, 146);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="550px" CssClass="dd"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" ForeColor="White" Height="30px" Width="100px" CssClass="pq" />
        </div>
        <div class="mm">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Eval("Prodimgs") %>' CssClass="imgs" />
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prodname") %>' Font-Size="Larger" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# "Rs. " + Eval("Price").ToString() %>' Font-Size="Large"></asp:Label>
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="lilb" CommandArgument='<%# Eval("ProdId") %>' CommandName="Openrs">DETAILS</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ProdId], [Prodname], [Price], [Prodimgs] FROM [Product] WHERE (([Category] = @Category) AND ([Prodname] LIKE '%' + @Prodname + '%'))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="technology" Name="Category" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="Prodname" PropertyName="Text" Type="String" DefaultValue=" " />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
