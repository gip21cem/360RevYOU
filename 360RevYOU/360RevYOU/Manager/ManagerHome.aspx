<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerHome.aspx.cs" Inherits="_360RevYOU.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
        <style>
           
            #t01 th {
                text-align: left;
                color:dimgrey;
                padding: 10px;
            }
            #t01 td {
                padding: 10px;
            }

            .textbox {
                border-width: unset;
                height: 40px;
                width: 100%;
            }
        </style>

        <div class="w3-panel" style="margin-left: 20%">    
            <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="fa fa-home w3-margin-right"></i>Home</p>
            
            <asp:PlaceHolder runat="server"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" />
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>
                        
            <br />
            <br />

            <h4 class="w3-margin-left" style="color: dimgray">Current activities</h4>
            <hr  class="line" />

            <div>
                <asp:GridView ID="GridView1" runat="server" cssClass="w3-table-all" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="activity_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="activity_id" HeaderText="Activity no." InsertVisible="False" ReadOnly="True" SortExpression="activity_id" />
                        <asp:BoundField DataField="activity_type" HeaderText="Activity Type" SortExpression="activity_type" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#9BB7D4" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:360revyouConnectionString %>" DeleteCommand="DELETE FROM activity WHERE activity_id = @activity_id" ProviderName="<%$ ConnectionStrings:360revyouConnectionString.ProviderName %>" SelectCommand="SELECT activity_id, activity_type, description, due_date FROM activity" UpdateCommand="UPDATE activity SET activity_type = @activity_type, description = @description, due_date = @due_date
WHERE activity_id = @activity_id">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="activity_id" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="activity_type" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="description" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="due_date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="GridView1" Name="activity_id" PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <br />
            <br />

            <table id="t01" style="width: 100%">
                <tr>
                    <th colspan="3" style="border-top-style:solid; border-top-width: 5px; border-top-color: lightsteelblue; border-bottom-style:solid; border-bottom-width:5px; border-bottom-color:lightsteelblue; padding:unset">
                        <h3><i class="fa fa-plus-circle"></i> Add a new activity</h3>
                    </th>
                </tr>
                <tr>
                    <th>
                        Activity Type:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxType" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                    </th>
                    <th>
                        Activity Description:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxDescription" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                    </th>
                    <th>
                        Acivity Due Date:
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxDate" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TxtBoxType" runat="server" class="textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtBoxDescription" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtBoxDate" runat="server" CssClass="textbox" ToolTip="Date must be in the format &quot;DD/MM/YYYY&quot;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th colspan="3" style="border-bottom-style:solid; border-bottom-width:5px; border-bottom-color:lightsteelblue;">
                        <asp:LinkButton ID="LinkBtnInsert" runat="server" CssClass="w3-right w3-margin-right" Font-Size="Medium" OnClick="LinkBtnInsert_Click" ValidationGroup="insertValue">Add</asp:LinkButton>
                        <asp:LinkButton ID="LinkBtnClear" runat="server" CssClass="w3-right w3-margin-right" Font-Size="Medium" OnClick="LinkBtnClear_Click">Clear</asp:LinkButton>
                    </th>
                </tr>
            </table>

            <br />
            <br />
            
            <h4 class="w3-margin-left" style="color: dimgray">My Employees</h4>
            <hr  class="line" />

            <div>
                <asp:GridView ID="GridView2" runat="server" cssClass="w3-table-all" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="employee_id" HeaderText="Employee ID" SortExpression="employee_id" />
                        <asp:BoundField DataField="name" HeaderText="Employee Name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="Employee Email" SortExpression="email" />
                        <asp:BoundField DataField="department_name" HeaderText="Employee Department" SortExpression="department_name" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#9BB7D4" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:360revyouConnectionString %>" ProviderName="<%$ ConnectionStrings:360revyouConnectionString.ProviderName %>" SelectCommand="select e.employee_id, e.name, e.email, d.department_name from 360revyou.employee_details e left join 360revyou.employee_department d using (employee_id) where d.department_name like &quot;IT%&quot;;                         
"></asp:SqlDataSource>
            </div>
        
        </div>

    </form>
</asp:Content>
