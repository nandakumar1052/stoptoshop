<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="stoptoshop.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .img{
            width:100%;
            height:260px;
            margin-top:0px;
            
        }
        .llb{
            font-size:30px;
            font-weight:500;
            margin-left:150px;
            font-family:sans-serif;
        }
        .iip{
            border-radius:4px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ViewStateMode="Enabled">
                <ContentTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="" CssClass="img" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Timer ID="Timer1" runat="server" Interval="3000"></asp:Timer>
        </div>
        <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
        <div class="pro" style="margin-top:20px;">
            <div>
                <asp:Label ID="Label1" runat="server" Text="Technology" CssClass="llb"></asp:Label>
            </div>
            <div class="card-group" style="width:70%; margin-left:200px; margin-top:5px;">
                <div class="card" >
                    <img src="images/samsung.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Mobiles</h5>
                        <p class="card-text">Samsung Galaxy S22 Ultra 5G (Phantom Black, 12GB, 256GB Storage)</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/images/follow.png" Width="90" Height="30"  CssClass="iip" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/headphones.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Headphones</h5>
                        <p class="card-text">WeCool Moonwalk Mini Earbuds IPX5 Wireless Earphones with Digital Battery Indicator(Yellow)</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton8" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/keyboard.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Keyboard & Mouse</h5>
                        <p class="card-text">Logitech MK240 Nano Wireless Keyboard and Mouse Combo,2.4GHz Wireless, 1000DPI,Spill-Resistant Design, PC/Mac-Black</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton7" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
            </div>
        </div>
        <div class="prog" style="margin-top:20px;">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Fashion" CssClass="llb"></asp:Label>
            </div>
            <div class="card-group" style="width:70%; margin-left:200px; margin-top:5px;">
                <div class="card" >
                    <img src="images/1-SBC-womens_04.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Tops & T-Shirts</h5>
                        <p class="card-text">Urbane Elegant Women Tshirts and Tops, Cotton, Casual Wear</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton6" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/1-SBC-womens_05.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Kurtis</h5>
                        <p class="card-text">Trendy Women Kurtis, rayon, printed, comfy and stylish</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton5" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/1-SBC-womens_07.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Sarees</h5>
                        <p class="card-text">Fashionable Saree, Banarasi silk, simplistic design, light weight</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton4" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
            </div>
        </div>
        <div class="prog1" style="margin-top:20px;">
            <div>
                <asp:Label ID="Label3" runat="server" Text="Sports" CssClass="llb"></asp:Label>
            </div>
            <div class="card-group" style="width:70%; margin-left:200px; margin-top:5px;">
                <div class="card" >
                    <img src="images/spo1.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Shakers</h5>
                        <p class="card-text">Boldfit Compact Gym Shaker Bottle, Bpa Free Material, 500ml</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/smartwatch.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Fitness Trackers</h5>
                        <p class="card-text">Fitness Tracker with Heart Rate Monitor/Pedometer/IP68 Waterproof/Sleep Monitor/Step Counter</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
                <div class="card">
                    <img src="images/spo3.jpg" class="card-img-top" alt="..." style="height:200px; width:200px; align-self:center;">
                    <div class="card-body">
                        <h5 class="card-title">Dumbles</h5>
                        <p class="card-text">Kore PVC DM 1-5 Kg (Set of Two) Combo Dumbbells Set for Workout</p>
                    </div>
                    <div class="card-footer">
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="iip" ImageUrl="~/images/follow.png" Width="90" Height="30" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>