<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerGoal.aspx.cs" Inherits="_360RevYOU.Manager.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="w3-panel" style="margin-left: 20%"> 

            <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="fa fa-clock-o w3-margin-right"></i>Goal</p>

            <asp:PlaceHolder runat="server" ID="panel1"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" />
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>
                        
            <br />
            <br />
            <br />

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <div class="w3-container" >
                <div class="w3-card-4 w3-left w3-margin-right" style="width:22%; margin-left: 35px">
                    <header class="w3-container w3-2021-cerulean" >
                        <h1 class="w3-center" style="color: dimgray">GOALS</h1>
                    </header>
                    <div class="w3-container w3-light-gray" style="height: 100px">
                        <p>Total number of NEW goals set</p>
                    </div>
                    <footer class="w3-container w3-2020-navy-blazer" >
                        <h1 class="w3-center" style="font:bold">14</h1>
                    </footer>
                </div>
                <div class="w3-card-4 w3-left w3-margin-right" style="width:22%;">
                    <header class="w3-container w3-2021-cerulean">
                        <h1 class="w3-center" style="color: dimgray">ON TARGET</h1>
                    </header>
                    <div class="w3-container w3-light-gray" style="height: 100px">
                        <p>Number of goals AHEAD of schedule</p>
                    </div>
                    <footer class="w3-container w3-2020-navy-blazer" >
                        <h1 class="w3-center" style="font:bold">8</h1>
                    </footer>
                </div>
                <div class="w3-card-4 w3-left w3-margin-right" style="width:22%;">
                    <header class="w3-container w3-2021-cerulean">
                        <h1 class="w3-center" style="color: dimgray">BEHIND</h1>
                    </header>
                    <div class="w3-container w3-light-gray"  style="height: 100px">
                        <p>Number of goals BEHIND schedule</p>
                    </div>
                    <footer class="w3-container w3-2020-navy-blazer">
                        <h1 class="w3-center" style="font:bold">5</h1>
                    </footer>
                </div>
                <div class="w3-card-4 w3-left" style="width:22%;">
                    <header class="w3-container w3-2021-cerulean">
                        <h1 class="w3-center" style="color: dimgray">MISSED</h1>
                    </header>
                    <div class="w3-container w3-light-gray"  style="height: 100px">
                        <p>Number of goals NOT achieved / to be reschedule</p>
                    </div>
                    <footer class="w3-container w3-2020-navy-blazer" >
                        <h1 class="w3-center" style="font:bold">1</h1>
                    </footer>
                </div>
            </div>
           
            <br />
            
            <div class="w3-bar-item">
               <asp:LinkButton ID="AddGoal" runat="server" class="w3-right w3-margin-right" style="cursor: pointer; color: dimgray" OnClick="AddGoal_Click"><i class="fa fa-plus-circle w3-margin-right"></i>New Goal</asp:LinkButton>
               <h4 class="w3-margin-left" style="color: dimgray">New Goals</h4>
                <hr  class="line" />
            </div>

            <asp:Panel id="Panel2" runat="server" Visible="false">
                <div class="w3-margin-right" style="display: inline-block">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxEmployee" ForeColor="Red" ValidationGroup="newGoalAddition"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblEmployee" runat="server" Text="Employee Name" style="display: block; color: dimgray"></asp:Label>
                    <asp:TextBox ID="TxtBoxEmployee" runat="server"></asp:TextBox>
                </div>
                <div class="w3-margin-right" style="display: inline-block">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBoxGoal" ForeColor="Red" ValidationGroup="newGoalAddition"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblGoal" runat="server" Text="Goal Description" style="display: block; color: dimgray"></asp:Label>
                    <asp:TextBox ID="TxtBoxGoal" runat="server" Width="400px"></asp:TextBox>
                </div>
                <div class="w3-margin-right" style="display: inline-block">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="TexBoxDueDate" ForeColor="Red" ValidationGroup="newGoalAddition"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblDueDate" runat="server" Text="Due Date" style="display: block; color: dimgray"></asp:Label>
                    <asp:TextBox ID="TexBoxDueDate" runat="server"></asp:TextBox>
                    <asp:Button ID="BtnCalendar1" runat="server" Text="Pick a Date" class="w3-2021-inkwell w3-hover-light-gray" style="cursor: pointer; Width: 95px" OnClick="BtnCalendar1_Click" />
                    <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </div>
                <div class="w3-margin-right" style="display: inline-block">
                    <asp:Label ID="LblPriority" runat="server" Text="Set Priority" style="display: block; color: dimgray"></asp:Label>
                    <asp:DropDownList ID="DropDownPriority" runat="server" Width="80px" Height="25px">
                        <asp:ListItem>Low</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>High</asp:ListItem>
                    </asp:DropDownList>
                </div >
                <div style="display: inline-block">
                    <asp:LinkButton ID="newGoal" runat="server" style="display: inline-block" OnClick="newGoal_Click" ToolTip="Add New Goal" ValidationGroup="newGoalAddition"><i class="material-icons" style="font-size: 25px">add_circle</i></asp:LinkButton>
                    <asp:LinkButton ID="cancelGoal" runat="server" OnClick="cancelGoal_Click" ToolTip="Cancel"><i class="material-icons" style="font-size: 25px">cancel</i></asp:LinkButton>
                </div>
            </asp:Panel>

            <br />
           
            <div>
                <asp:HiddenField ID="hfgoal_id" runat="server" />
                <asp:GridView ID="goalGridView" runat="server" cssClass="w3-table-all" AutoGenerateColumns="False" HeaderStyle-BorderStyle="None" AlternatingRowStyle-BackColor="#9BB7D4" >
                    <Columns>
                        <asp:BoundField DataField="employee_name" HeaderText="Employee" />
                        <asp:BoundField DataField="goal_description" HeaderText="Goal Description" />
                        <asp:BoundField DataField="due_date" HeaderText="Due Date" />
                        <asp:BoundField DataField="priority" HeaderText="Priority" />
                        <asp:TemplateField HeaderText="Progress">
                            <ItemTemplate>
                                <div class="slidecontainer">
                                    <input type="range" id="myRange" min="1" max="100" value="50" step="5" class="slider" onchange="updateSlider(this.value)" >
                                    <p class="w3-left w3-margin-right" >0 %</p>
                                    <p class="w3-right">100 %</p> 
                                </div>
                                <script>   
                                    var slider = document.getElementById("myRange");
                                    var output = document.getElementById("demo");
                                    output.innerHTML = slider.value;

                                    slider.oninput = function() {
                                    output.innerHTML = this.value;
                                </script>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("goal_id") %>' OnClick="lnk_OnclickDelete" >Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                    <HeaderStyle BorderStyle="None" />
                </asp:GridView>
            </div>
                    
                </ContentTemplate>
              </asp:UpdatePanel>
                

        </div>

    </form>
    
</asp:Content>
