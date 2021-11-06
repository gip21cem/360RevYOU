<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFormsIdentity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>360 RevYOU</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: small">
   <form id="form1" runat="server">
        <div class="w3=container w3-2021-inkwell w3-margin">
            <h1 class="w3-margin-left">360 RevYOU - Log In</h1>
            <h3 class="w3-margin-left">Please log in to access functions specific to your role</h3>
        </div>
         
         <hr />

       <div class="w3=container w3-light-gray w3-margin w3-padding-16">

         <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText"/>
            </p>
         </asp:PlaceHolder>

         <asp:PlaceHolder runat="server" ID="LoginForm" >
            <div class="w3-margin w3-cell-row" style="margin-bottom: 10px; width: 25%">
                <i class="fa fa-user" style="margin-left: 20px; font-size: xx-large; color:dimgray"></i>
            </div>  

             <table class="w3-table">
                <tr>
                    <th style="width: 175px">
                         <asp:Label runat="server" AssociatedControlID="UserName" CssClass="w3-container w3-cell" style="margin-right: 5px; color: dimgray; font-weight: bold" >Username</asp:Label>
                    </th>
                    <th>
                       <asp:TextBox runat="server" ID="UserName" CssClass="w3-container w3-cell" Width="200" required="true"/>  
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="w3-container w3-cell" style="margin-right: 5px; color: dimgray; font-weight: bold">Password</asp:Label>
                    </th>
                    <th>
                        <asp:TextBox runat="server" ID="Password" CssClass="w3-container w3-cell"  Width="200" TextMode="Password" required="true"/>
                    </th>
                </tr>
             </table>
         
            <div class="w3-margin" style="margin-bottom: 10px">
               <div class="w3-margin-left">
                  <asp:Button runat="server" CssClass="w3-2021-inkwell w3-container w3-hover-light-gray" style="cursor: pointer" OnClick="SignIn" Text="Log in" />
               </div>
            </div>

            <p class="w3-margin">
                <asp:HyperLink runat="server" ID="RegisterHyperLink" class="w3-margin-left" style="color: dimgray; font-weight: bold" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
            </p>
         </asp:PlaceHolder>
       </div>
         
   </form>
</body>
</html>
