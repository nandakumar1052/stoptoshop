<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test.aspx.vb" Inherits="stoptoshop.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Prodid"></asp:TextBox>
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Button ID="Button2" runat="server" Text="Button" style="height: 26px" />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <img alt="....<%=sp %>" src="data:image/jpg;base64,<%=sp %>" />
        <asp:Button ID="Button3" runat="server" Text="B3" />
    </form>
</body>
</html>
