<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Homepage.aspx.vb" Inherits="stoptoshop.Homepage"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .header {
            background-color: rgb(232, 243, 243);
            box-shadow: 0px 10px 10px #888888;
            height:70px;
            margin-top: -0.7%;
            margin-left: -0.6%;
            margin-right:0%;
        }
        .logos {
            width: 60px;
            margin-top: 0.7%;
            margin-left:0.7%;
        }
        .name {
            margin-left:50px;
            font-family: 'Brush Script Std';
            font-size: 30px;
            font-weight: 400;
            color: rgb(39, 98, 189);
            text-shadow: 0px 5px 10px rgb(39, 98, 189);
        }
        .b1 {
            margin-top: -30px;
            margin-left: 75px;
        }
        .navi {
            margin-top: -30px;
            margin-left: 35%;
        }
        .la {
            width:249px;
            margin-left:-16px;
            height:45px;
            font-family:'Trajan Pro';
            font-weight: 300;
            font-size: 18px;
            background-color:none;
            color:mediumblue;
        }
        .la:hover{
            color:cornsilk;
            cursor:pointer;
            background-color:mediumblue;
        }
        .ca{
            float:right;
            margin-right:-120px;
            width:30px;
            height:30px;
            margin-top:-10px;
        }
        .pa {
   
            float: right;
            margin-right: -90px;
            width: 50px;
            height: 35px;
            margin-top: -12px;
        }
        .lit{
            
            height:530px;
            width:99%;
            margin-top:1%;
            margin-left:0.8%;
        }
        .txt{
            margin-left:40px;
            margin-bottom:10px;

        }
        .lbl{
            margin-left:25px;
           
        }
        .lin{
            margin-top:5px;
        }
        .lbln{
            float: right;
            margin-right: 80px;
            width: 50px;
            height: 35px;
            margin-top: 0px;
            padding-right:5px;
            font-size:larger;
            font-weight:600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <img alt="" src="images/Hamburger.png" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" style="margin-left:15px; margin-top:25px;" height="30" width="30" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Logo.PNG" CssClass="logos"  /> 
            <nav class="b1">    
                <asp:Label ID="Label1" runat="server" Text="StopToShop" CssClass="name"></asp:Label>
            </nav>
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="width:250px">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel"></h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div>
                        <img alt="" src="" id="Image2" runat="server" width="175" height="175" style="border-radius:200px; margin-top:-20px; margin-left:10px;" Visible="false"/>
                    </div>
                    <div class="dropdown mt-3">

                        <asp:Label ID="Lblname" runat="server" CssClass="lbln" Visible="false"></asp:Label>
                        <input id="Button1" runat="server" type="button" value="Login" class="la" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" /><br />
                        <asp:Button ID="LinkButton3" runat="server" Text="Home" CssClass="la" /><br />
                        <asp:Button ID="LinkButton4" runat="server" Text="Technology" CssClass="la" /><br />
                        <asp:Button ID="LinkButton5" runat="server" Text="Fashion" CssClass="la" /><br />
                        <asp:Button ID="LinkButton6" runat="server" Text="Sports" CssClass="la" /><br />
                        <asp:Button ID="Button4" runat="server" Text="Cart" CssClass="la" Visible="false" /><br />
                        <asp:Button ID="LinkButton8" runat="server" Text="Order" CssClass="la" Visible="false"/><br />
                        <asp:Button ID="Button2" runat="server" Text="Purchases" CssClass="la" Visible="false"/><br />
                        <asp:Button ID="Button3" runat="server" Text="Logout" CssClass="la" Visible="false"/><br />
                        
                    </div>
                </div>
            </div>
            <div>
                <iframe id="Myframe" runat="server" class="lit"></iframe>
            </div>

        <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">LOGIN</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="col-md-6">
              <asp:RadioButton ID="RadioButton1" runat="server" Text="Customer" GroupName="m1" />
          </div>
          <div class="col-md-6">
              <asp:RadioButton ID="RadioButton2" runat="server" Text="Seller" GroupName="m1" />
          </div>
          <div class="col-md-6">
              <asp:RadioButton ID="RadioButton3" runat="server" Text="Admin" GroupName="m1" />
          </div>
          <div class="col-12">
              <asp:Label ID="Label6" runat="server" Text="Email" class="form-label"></asp:Label>
              <asp:TextBox ID="Txtusername" runat="server" class="form-control"></asp:TextBox>
          </div>
          <div class="col-12" style="margin-top: 5px">
              <asp:Label ID="Label7" runat="server" Text="Password" class="form-label"></asp:Label>
              <asp:TextBox ID="Txtpass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
          </div>
          <div class="col-12" style="margin-top: 5px">
              <asp:LinkButton ID="LinkButton2" runat="server" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Forgot Password?</asp:LinkButton>
          </div>
          <div class="col-12" style="margin-top: 5px">
              <asp:LinkButton ID="LinkButton1" runat="server">Click To Register Customer </asp:LinkButton>
              
          </div>
          <div class="col-12" style="margin-top: 5px">
              <asp:LinkButton ID="LinkButton7" runat="server">Click To Register Seller</asp:LinkButton>
              
          </div>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-primary" id="btnsignin" runat="server">Sign in</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">FORGOT PASSWORD</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="col-12">
            <asp:Label ID="Label8" runat="server" Text="Email ID" class="form-label"></asp:Label>
            <asp:TextBox ID="Textmail" runat="server" class="form-control"></asp:TextBox>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="Btnotp" runat="server">Send Password</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Open first modal</a>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
