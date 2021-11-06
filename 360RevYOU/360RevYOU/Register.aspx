<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_360RevYOU.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>360 RevYOU</title>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 173px;
        }
        .auto-style2 {
            width: 173px;
            height: 41px;
        }
        .auto-style3 {
            height: 41px;
        }
    </style>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: small">
    <form id="form1" runat="server">
        <div class="w3=container w3-2021-inkwell w3-margin">
            <h1 class="w3-margin-left">360 RevYOU</h1>
            <h3 class="w3-margin-left">Register a new user</h3>
        </div>
                  
        <hr />

        <div class="w3=container w3-light-gray w3-margin w3-padding-16">
            <p>
                <asp:Literal runat="server" ID="StatusMessage" />
            </p>

            <div class="w3-margin w3-cell-row" style="margin-bottom: 10px; width: 25%">
                <i class="fa fa-users" style="margin-left: 20px; font-size: xx-large; color:dimgray"></i>
            </div>

            <table class="w3-table">
                <tr>
                    <th style="width: 175px">
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="w3-margin-left" style="color: dimgray; font-weight: bold">Username</asp:Label>
                    </th>
                    <th>
                        <asp:TextBox runat="server" ID="UserName" Width="200" required="true"/>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="w3-margin-left" style="color: dimgray; font-weight: bold">Password</asp:Label>
                    </th>
                    <th>
                         <asp:TextBox runat="server" ID="Password" Width="200" TextMode="Password" required="true"/>
                    </th>
                </tr>
                <tr>
                    <th>
                         <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="w3-margin-left" style="color: dimgray; font-weight: bold">Confirm password</asp:Label>
                    </th>
                    <th>
                         <asp:TextBox runat="server" ID="ConfirmPassword" Width="200" TextMode="Password" required="true"/>
                        <asp:CompareValidator ID="ComparePassword" runat="server" ControlToValidate="Password" ControlToCompare="ConfirmPassword" Operator="Equal" ErrorMessage="The value in 'Password' and 'Confirm Passsword' must be the same" ValidationGroup="confirmPassword"></asp:CompareValidator>
                    </th>
                </tr>
                <tr>
                    <th class="auto-style1">
                        <asp:Button runat="server" CssClass="w3-2021-inkwell w3-container w3-hover-light-gray w3-margin-left" style="cursor: pointer" OnClick="CreateUser_Click" Text="Register" ValidationGroup="confirmPassword"/>
                    </th>
                </tr>
            </table>  
        </div>
    </form>
</body>
</html>
