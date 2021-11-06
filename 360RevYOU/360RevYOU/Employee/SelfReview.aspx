<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterEmployee.Master" AutoEventWireup="true" CodeBehind="SelfReview.aspx.cs" Inherits="_360RevYOU.Employee.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <style>
            th, td {
                padding: 15px;
                text-align: left;
                color: darkblue;
            }

            .textbox {
                width: 900px;
                background-color: lightsteelblue;
                color: darkslategrey;
                border-radius: 5px; 
            }

            .dropdown {
                height: 40px;
                width: 900px;
                border-collapse: collapse;
                border: solid;
                border-width: 2px;
                background-color: lightsteelblue;
                color: darkslategrey;
                border-radius: 5px;
            } 
            
            .loader {
                border: 16px solid #f3f3f3;
                border-radius: 50%;
                border-top: 16px solid blue;
                border-right: 16px solid green;
                border-bottom: 16px solid red;
                width: 60px;
                height: 60px;
                -webkit-animation: spin 2s linear infinite;
                animation: spin 2s linear infinite;
        }

            @-webkit-keyframes spin {
              0% { -webkit-transform: rotate(0deg); }
              100% { -webkit-transform: rotate(360deg); }
            }

            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }

            #d01 {
                box-shadow: 0px 0px 15px;
                padding: 10px;
                background-color:lightsteelblue;
                color: darkslategrey;
                border-radius: 5px;
            }
            
        </style>


        <div class="w3-panel" style="margin-left: 20%">
            <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="fa fa-hourglass-2 w3-margin-right"></i>Self Review</p>

            <asp:PlaceHolder runat="server" ID="panel1"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" />
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>

            <br />
            <br />
            <br />
            
            <div class="w3-container w3-light-grey">
                <div>
                    <h4 style="color:darkslategrey" class="w3-center" id="d01"><i class="fa fa-pencil"></i> The self-review must be sent before the end of the applicable review period to be accepted by your manager!</h4>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="w3-margin-top w3-margin-bottom" style="width: 100%"> 
                            <tr>
                                <th>
                                    Employee Name:
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownEmployee" runat="server" CssClass="dropdown" DataTextField="name" DataValueField="name" AutoPostBack="True" DataSourceID="SqlDataSource1"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:360revyouConnectionString2 %>" ProviderName="<%$ ConnectionStrings:360revyouConnectionString2.ProviderName %>" SelectCommand="SELECT name FROM employee_details ORDER BY name"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Review Period:
                                </th>
                                <td>
                                    <asp:DropDownList ID="DropDownPeriod" runat="server" CssClass="dropdown">
                                        <asp:ListItem>- Select a value -</asp:ListItem>
                                        <asp:ListItem>Quarter 1</asp:ListItem>
                                        <asp:ListItem>Quarter 2</asp:ListItem>
                                        <asp:ListItem>Quarter 3</asp:ListItem>
                                        <asp:ListItem>Quarter 4</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Review Date:
                                </th>
                                <td>
                                    <asp:Label ID="LblDate" runat="server" Text="" style="color: darkslategrey"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Goals Achieved:
                                </th>
                                <td>
                                    <asp:TextBox ID="TxtBoxGoals" runat="server" CssClass="textbox" Height="40px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxGoals" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Add Comments:
                                </th>
                                <td>
                                    <asp:TextBox ID="TxtBoxComments" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxComments" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                    </table>
              
                    <div class="w3-bar-item w3-margin-right">
                        <asp:Button ID="ButnInsert" runat="server" Text="Send to Manager" class="w3-right w3-2021-inkwell w3-hover-light-gray w3-margin-bottom" style="cursor: pointer; Width: 130px" ValidationGroup="insertValue" OnClick="ButnInsert_Click"/>
                        <asp:Button ID="ButnCancel" runat="server" Text="Cancel" class="w3-right w3-margin-right w3-2021-inkwell w3-hover-light-gray" style="cursor: pointer; Width: 85px" OnClick="ButnCancel_Click"/>
                    </div>

                    <hr />
                
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="loader"></div>
                            <h5>Sending your review ...</h5>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </ContentTemplate>
              </asp:UpdatePanel>
            </div>
        </div>
    </form>
</asp:Content>
