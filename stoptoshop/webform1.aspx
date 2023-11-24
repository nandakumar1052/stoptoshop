<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="webform1.aspx.vb" Inherits="stoptoshop.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="//geodata.solutions/includes/countrystatecity.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Country</h3>
      <select name="country" class="countries form-control" id="countryId">
    <option value="">Select Country</option>
</select>

    </div>
    <div class="col-sm-4">
      <h3>State</h3>
        <asp:DropDownList ID="stateId" runat="server" class="states form-control"></asp:DropDownList>
    </div>
    <div class="col-sm-4">
      <h3>City</h3>        
      <select name="city" class="cities form-control" id="cityId">
    <option value="">Select City</option>
</select>
    </div>
  </div>
</div>
    </form>
</body>
</html>
