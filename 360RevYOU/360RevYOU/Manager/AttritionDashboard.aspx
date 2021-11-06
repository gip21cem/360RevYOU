<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterManager.Master" AutoEventWireup="true" CodeBehind="AttritionDashboard.aspx.cs" Inherits="_360RevYOU.Manager.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
         <div class="w3-panel" style="margin-left: 20%"> 
              <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="material-icons w3-margin-right">dashboard</i>Attrition Dashboard</p>

              <asp:PlaceHolder runat="server" ID="panel1"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" CausesValidation="False"/>
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>

            <br />
            <br />
            <br />

             <div class="w3-container w3-center">
                 <img class="w3=w3-margin-left" src="dashboard/Dashboard.PNG" />
             </div>
         </div>
     </form>
</asp:Content>
