<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Report.aspx.vb" Inherits="stoptoshop.Report" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .auto-style1 {
            width: 100%;
        }
        .mydatagrid {
            width: 800px;
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
            margin-top:50px;
        }
        .g2{
            margin-top:-235px;
            margin-left:650px;
            width:400px;
        }
        .g3{
            margin-top:-530px;
            margin-left:1100px;
        }
      </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rowes" AutoGenerateColumns="False" DataKeyNames="PurId" DataSourceID="SqlDataSource1" AllowPaging="True">

                <Columns>
                    <asp:BoundField DataField="PurId" HeaderText="PurId" ReadOnly="True" SortExpression="PurId" />
                    <asp:BoundField DataField="ProdId" HeaderText="ProdId" SortExpression="ProdId" />
                    <asp:BoundField DataField="CEmail" HeaderText="CEmail" SortExpression="CEmail" />
                    <asp:BoundField DataField="SEmail" HeaderText="SEmail" SortExpression="SEmail" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rowes"></RowStyle>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [date], [Price], [SEmail], [CEmail], [ProdId], [PurId] FROM [Purchase] WHERE (([Deliever] = @Deliever) AND ([Received] = @Received))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="success" Name="Deliever" Type="String" />
                    <asp:Parameter DefaultValue="success" Name="Received" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="800" Height="300">
                <Series>
                    <asp:Series Name="Series1" XValueMember="date" YValueMembers="Price"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </form>
</body>
</html>
