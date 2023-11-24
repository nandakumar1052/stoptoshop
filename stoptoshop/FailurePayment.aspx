<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FailurePayment.aspx.vb" Inherits="stoptoshop.FailurePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Transaction Failed" Font-Size="XX-Large"></asp:Label><br />
            
            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="javascript:window.close()">click here </asp:LinkButton>
            <asp:Label ID="Label2" runat="server" Text=" to return"></asp:Label>
        </div>
    </form>
</body>
</html>
