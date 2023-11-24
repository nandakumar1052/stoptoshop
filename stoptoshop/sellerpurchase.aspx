<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sellerpurchase.aspx.vb" Inherits="stoptoshop.sellerpurchase" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
    .auto-style1 {
            width: 100%;
        }

        .mydatagrid {
            width: 200px;
            border: solid 2px black;
            
        }

        .header {
            background-color: #000;
            font-family: Arial;
            color: White;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
        }

            .rows:hover {
                background-color: #5badff;
                color: #fff;
            }
        .rowes {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            height: 50px;
            text-align: left;
        }

            .rowes:hover {
                background-color: #5badff;
                color: #fff;
            }

        .mydatagrid a /** FOR THE PAGING ICONS **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS HOVER STYLES**/ {
                background-color: #000;
                color: #fff;
            }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #fff;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .pager {
            background-color: #5badff;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }
        .auto-style2 {
            width: 262px;
            
        }
        .auto-style3 {
            height: 68px;
        }
        .auto-style4 {
            height: 44px;
        }
        .auto-style5 {
            height: 47px;
        }
        .auto-style6 {
            width: 192px;
        }
        .auto-style7 {
            width: 100%;
            margin-right: 1px;
        }
        .g1{
            margin-top:20px;
        }
        .g2{
            margin-top:-100px;
            margin-left:700px;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="g1">
                    <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rowes" AutoGenerateSelectButton="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="PurId">
                        <Columns>
                            <asp:BoundField DataField="ProdId" HeaderText="ProdId" SortExpression="ProdId" />
                            <asp:BoundField DataField="CEmail" HeaderText="CEmail" SortExpression="CEmail" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            <asp:BoundField DataField="PurId" HeaderText="PurId" ReadOnly="True" SortExpression="PurId" />
                        </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rowes"></RowStyle>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ProdId], [CEmail], [Price], [date], [PurId] FROM [Purchase] WHERE (([SEmail] = @SEmail) AND ([Received] = @Received) AND ([Deliever] = @Deliever))">
                        <SelectParameters>
                            <asp:SessionParameter Name="SEmail" SessionField="Seller" Type="String" />
                            <asp:Parameter DefaultValue="failure" Name="Received" Type="String" />
                            <asp:Parameter DefaultValue="failure" Name="Deliever" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>
        <div class="g2">
            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Email" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtemail" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label2" runat="server" Text="Name" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtname" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-12">
                <asp:Label ID="Label4" runat="server" Text="Address" class="form-label"></asp:Label>
                <asp:TextBox ID="txtaddress" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label5" runat="server" Text="City" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtcity" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label6" runat="server" Text="State" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtstate" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label7" runat="server" Text="Country" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtcountry" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Label ID="Label8" runat="server" Text="Phone" class="form-label"></asp:Label>
                <asp:TextBox ID="Txtphone" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Button ID="Button1" runat="server" Text="Deliver" class="btn btn-primary" />
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
