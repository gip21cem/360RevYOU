<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterEmployee.Master" AutoEventWireup="true" CodeBehind="EmployeeNotes.aspx.cs" Inherits="_360RevYOU.Employee.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
        <div class="w3-panel" style="margin-left: 20%"> 
             <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="material-icons w3-margin-right">&#xe8cd;</i>Notes</p>
             
             <asp:PlaceHolder runat="server" ID="panel1"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" CausesValidation="False"/>
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>

            <br />
            <br />
            <br />

            <div id="controlBar">
                 <div>
                     <asp:DataPager ID="DataPager1" PagedControlID=ListView1 runat="server" PageSize="5" QueryStringField="start" style="color: dimgray">
                         <Fields>
                             <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowPreviousPageButton="False" />
                             <asp:NumericPagerField />
                             <asp:NextPreviousPagerField ShowLastPageButton="True" ShowNextPageButton="False" />
                         </Fields>
                     </asp:DataPager>
                 </div>
                 <br />
                 <a id="newMessageLink" href="#newMessageBookmark" style="color: dimgray">New Message</a>
             </div>

            <div>
                 <asp:HiddenField ID="hfMessage_id" runat="server" />
                 <asp:ListView ID="ListView1" runat="server"  >
                    <LayoutTemplate>
                        <div id="messageList">
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </div>
                        <hr  class="line" />
                     </LayoutTemplate>
                     <ItemTemplate>
                         <hr  class="line" />
                        <div class="subject">
                            <h3 style="color: dimgray"><%# Eval("subject") %></h3>
                        </div>
                        <div class="postedBy">
                            <b style="color: dimgray">Posted By:&nbsp;</b><%# Eval("postedBy") %></div>
                        <div class="datePosted">
                            <b style="color: dimgray">Date Posted:&nbsp</b><%# Eval("datePosted") %></div>
                        <div class="text">
                            <b style="color: dimgray">Text:&nbsp</b><%# Eval("text") %></div>
                     </ItemTemplate>
                 </asp:ListView>
                    <div id="newMessagePanel">
                        <a id="newMessageBookmark"></a>
                        <h2 style="color: dimgray">Post a Message</h2>
                        <div id="subjectPanel">
                            <asp:Label CssClass="subjectLabel" runat="server" AccessKey="S" Text="Subject:" />
                            <br />
                            <asp:TextBox ID="txtBoxSubject" CssClass="subjectTextBox" runat="server" Columns="60" Rows="1" />
                        </div>
                        <div id="subjectValidationPanel">
                            <asp:RequiredFieldValidator runat="server" ID="validateSubjectRequired" ControlToValidate="txtBoxSubject"
                                ErrorMessage="Please enter a subject" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                        <div id="textPanel">
                            <asp:Label CssClass="textLabel" runat="server" AccessKey="T" Text="Text:" />
                            <br />
                            <asp:TextBox ID="txtBoxText" CssClass="textTextBox" runat="server" TextMode="MultiLine" Rows="10" Columns="60" />
                        </div>
                        <div id="textValidationPanel">
                            <asp:RequiredFieldValidator runat="server" ID="validateTextRequired" ControlToValidate="txtBoxText"
                                ErrorMessage="Please enter some text" SetFocusOnError="True" Display="Dynamic" />
                        </div>
                        <div id="buttonPanel">
                            <asp:Button ID="PostMessage" class="w3-2021-inkwell w3-margin-right w3-hover-light-gray" CommandName="Insert" runat="server" Text="Post Message" style="cursor: pointer" OnClick="PostMessage_Click"/>
                            <asp:Button ID="Cancel" class="w3-2021-inkwell w3-hover-light-gray" runat="server" CommandName="Cancel" Text="Cancel" style="cursor: pointer" CausesValidation="False" OnClick="Cancel_Click"  />
                        </div>
                    </div>
                </div>
        </div>
    </form>
</asp:Content>
