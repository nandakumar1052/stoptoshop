<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Sregisteration.aspx.vb" Inherits="stoptoshop.Sregisteration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
<script src="//geodata.solutions/includes/statecity.js"></script>
    <style>
        .container{
            height:150px;
            margin-top:50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row g-3">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" Text="Name" class="form-label"></asp:Label>
                    <asp:TextBox ID="Txtname" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label2" runat="server" Text="Email" class="form-label"></asp:Label>
                    <asp:TextBox ID="Txtemail" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label3" runat="server" Text="Address" class="form-label"></asp:Label>
                    <asp:TextBox ID="Txtaddress" runat="server" class="form-control" placeholder="1234 Main St" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" runat="server" Text="Country" class="form-label"></asp:Label><br />
                    <input type="text" name="country" id="countryId" runat="server" value="IN" class="form-control" readonly="true" style="background-color: #FFFFFF"/>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label5" runat="server" Text="State" class="form-label"></asp:Label><br />
                    <asp:DropDownList ID="stateId" runat="server" style="height: 40px; width: 100%; border-color: lightgrey; border-radius: 4px;" DataSourceID="SqlDataSource1" DataTextField="column1" DataValueField="column1"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:`stgwordpressConnectionString %>" SelectCommand="SELECT distinct([Statename]) AS column1 FROM [cities]"></asp:SqlDataSource>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label6" runat="server" Text="City" class="form-label"></asp:Label><br />
                    <asp:DropDownList ID="cityId" runat="server" style="height: 40px; width: 100%; border-color: lightgrey; border-radius: 4px;"></asp:DropDownList> <asp:Button ID="Button1" runat="server" Text="Refresh" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label11" runat="server" Text="Category" class="form-label"></asp:Label><br />
                    <asp:DropDownList ID="DropDownList1" runat="server" style="height: 40px; width: 100%; border-color: lightgrey; border-radius: 4px;">
                        <asp:ListItem>technology</asp:ListItem>
                        <asp:ListItem>fashion</asp:ListItem>
                        <asp:ListItem>sports</asp:ListItem>
                    </asp:DropDownList>                    
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label12" runat="server" Text="Certificate" class="form-label"></asp:Label><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label7" runat="server" Text="Phone" class="form-label"></asp:Label>
                    <asp:TextBox ID="Txtphone" runat="server" class="form-control" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label8" runat="server" Text="Password" class="form-label"></asp:Label>
                    <asp:TextBox ID="Txtpassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label13" runat="server" Text="Profile Image" class="form-label"></asp:Label><br />
                    <asp:FileUpload ID="FileUpload2" runat="server" />
                </div>
                <div class="col-12">
                    <asp:Button ID="Btnregi" runat="server" Text="Register" class="btn btn-primary" />
                </div>
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <div class="col-md-6">
                        <asp:Label ID="Label9" runat="server" Text="Email Otp" class="form-label" ></asp:Label>
                        <asp:TextBox ID="Txtemailotp" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="Label10" runat="server" Text="Phone Otp" class="form-label" ></asp:Label>
                        <asp:TextBox ID="Txtphoneotp" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" Enabled="false"></asp:Timer>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="lblcountdown" runat="server" ReadOnly="True" Text="05:00"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>


                    </div>
                    <div class="col-12">
                        <asp:Button ID="Btnotp" runat="server" Text="Verify" class="btn btn-primary" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
