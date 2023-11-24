<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PRODVIEW.aspx.vb" Inherits="stoptoshop.PRODVIEW" EnableSessionState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .tt1{
            margin-top:25px;
            margin-bottom:15px;
        }
        .h1{
            margin-top:0%;
            margin-left:10%;
        }
        .auto-style1 {
            width: 100%;
            margin-top:75px;
        }
        .auto-style2 {
            height: 38px;
            
        }
        .l1{
            margin-top:-20px;
            margin-left:10%;
            overflow:auto;
        }
        .auto-style3 {
            height: 62px;
        }
        .auto-style4 {
            height: 90px;
        }
        .auto-style5 {
            width: 78px;
        }
        .auto-style6 {
            width: 445px;
        }
        .auto-style7 {
            height: 55px;
        }
        .auto-style8 {
            height: 61px;
        }
        .ss{
            overflow:auto;
            width:100%;
            margin-top:20px;
        }
        .auto-style11 {
            width: 200px;
            height: 230px;
            border:thin;
            border-style:solid;
            margin-left:25px;
        }
        .auto-style12 {
            height: 123px;
            
        }
        .spp{
            margin-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Lbliid" runat="server" Text="Label"></asp:Label>
        <table class="w-100">
            <tr>
                <td class="auto-style5">
                    <div class="tt1">
                        <asp:ImageButton ID="ImageButton1" runat="server" Width="60px" Height="60px" />
                    </div>
                    <div>
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="imgId" DataSourceID="SqlDataSource1" RepeatColumns="1">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Eval("Prodimg") %>' Width="60px" Height="60px" CommandArgument='<%# Eval("Prodimg") %>' CommandName="proim" />
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Prodimgs] WHERE ([ProdId] = @ProdId)">
                            <SelectParameters>
                                <asp:SessionParameter Name="ProdId" SessionField="IID" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </td>
                <td class="auto-style6">
                    <div class="h1">
                        <asp:Image ID="Image1" runat="server" Height="400" Width="400" />
                    </div>

                </td>
                <td>
                    <div class="l1">

                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="X-Large"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <button type="button" runat="server" class="btn btn-primary" id="btn1" style="width: 115px">Add To Cart</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Description" Font-Size="X-Large" Font-Bold="True" Font-Underline="True"></asp:Label></td>
                            </tr>
                            <tr>    
                                    <td>
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="500px" Height="200px" ReadOnly="True"></asp:TextBox></td>
                            </tr><br />
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label6" runat="server" Text="Question and Answer" Font-Size="X-Large" Font-Bold="True" Font-Underline="True"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="600px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" /><br />
                            <asp:DataList ID="DataList2" runat="server" DataKeyField="QId" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <table class="w-100">
                                        <tr>
                                            <td class="auto-style7">
                                                <asp:Label ID="Label7" runat="server" Text="Question: " Font-Size="Large" Font-Bold="True"></asp:Label>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Quest") %>' Font-Size="Large"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label8" runat="server" Text="Answer: : " Font-Size="Large" Font-Bold="True"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Ans") %>' Font-Size="Large"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Que] WHERE (([ProdId] = @ProdId) AND ([Ans] <> @Ans))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Lbliid" Name="ProdId" PropertyName="Text" Type="Int64" />
                                    <asp:Parameter Name="Ans" Type="String" DefaultValue="none" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                </td>
                            </tr>
                            
                        </table>

                    </div>
                </td>
            </tr>
            
        </table>
        <div class="ss">
            <asp:DataList ID="DataList3" runat="server" DataKeyField="ProdId" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="auto-style11">
                        <tr>
                            <td class="auto-style12">
                                <asp:Image ID="Img1" runat="server" ImageUrl='<%# "data:image/jpg;base64," + Eval("Prodimgs") %>' CssClass="imgs" Width="120px" Height="120px" />
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>
                                <asp:Label ID="Lbl1" runat="server" Text='<%# Eval("Prodname") %>' Font-Size="Larger" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>
                                <asp:Label ID="Lbl2" runat="server" Text='<%# "Rs. " + Eval("Price").ToString() %>' Font-Size="Large"></asp:Label>
                            </td>
                        </tr>
                        <tr class="spp">
                            <td>

                                <asp:LinkButton ID="LinkB1" runat="server" CssClass="lilb" CommandArgument='<%# Eval("ProdId") %>' CommandName="Openrs">DETAILS</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Product] WHERE ([Category] = @Category)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="Category" SessionField="iot" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
