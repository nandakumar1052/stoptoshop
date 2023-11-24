﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sapproval.aspx.vb" Inherits="stoptoshop.sapproval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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
            <asp:GridView ID="GridView2" runat="server" CssClass="mydatagrid" HeaderStyle-CssClass="header" RowStyle-CssClass="rowes" AutoGenerateColumns="False" DataKeyNames="Email" DataSourceID="SqlDataSource1" AllowPaging="True" AutoGenerateEditButton="True">

                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Certificate" HeaderText="Certificate" SortExpression="Certificate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<RowStyle CssClass="rowes"></RowStyle>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\STS.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Email], [Name], [Address], [City], [State], [Country], [Phone], [Category], [Certificate], [Status] FROM [SRegistration] WHERE ([Status] = @Status)" UpdateCommand="UPDATE [SRegistration] Set [Status]=@Status Where [Email]=@Email ">
                <SelectParameters>
                    <asp:Parameter DefaultValue="unapproved" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
