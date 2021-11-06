<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerPerformanceReview.aspx.cs" Inherits="_360RevYOU.Manager.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="w3-margin-top w3-margin-bottom" style="font-family: sans-serif">
        <style>
            th {
                text-align: left; 
            }

            td {
                border: solid;
                border-collapse:collapse;
                border-color: dimgrey;
                background-color: gainsboro; box-shadow: 0px 0px 15px;
            }

            th, td {
                padding: 15px;
            }

            .dropdown {
                height: 35px;
                width: 180px;
                border-collapse: collapse;
                border: solid;
                border-width: 2px;
                border-radius: 5px;
            }
        </style>

        <div class="w3-panel" style="margin-left: 20%">
            <p style="color: dimgray; font-size: x-large; font-weight: bold;"><i class="fa fa-hourglass-2 w3-margin-right"></i>Performance Review & Appraisal</p>
        
            <asp:PlaceHolder runat="server" ID="panel1"> 
                    <div class="w3-bar-item">
                        <asp:Button runat="server" class="w3-right w3-2021-inkwell w3-margin-right w3-hover-light-gray" OnClick="SignOut" Text="LogOut" style="cursor: pointer; Width: 95px" />
                        <a runat="server" class="w3-right w3-margin-right" style="color: dimgray">Hello, <%: Context.User.Identity.Name  %> !</a> 
                    </div>
            </asp:PlaceHolder>

            <br />
            <br />
            <br />

            <div class="w3-container w3-light-grey" >
                <table class="w3-margin-top w3-margin-bottom" style="width: 100%">
                    <tr>
                        <th class="w3-2021-cerulean" colspan="4" style="border:solid; border-color:dimgrey; border-collapse:collapse; text-align:center; padding: 10px; font-size: 35px; font-weight: bold; color: dimgrey">PERFORMANCE REVIEW FORM</th>
                    </tr>
                    <tr>
                         <th colspan="4"></th>
                    </tr>
                    <tr>
                        <th class="w3-2020-navy-blazer">
                            Employee Name 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBxEmpName" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>
                        </th>
                        <th class="w3-2020-navy-blazer">Department</th>
                        <th class="w3-2020-navy-blazer">Review Period</th>
                        <th class="w3-2020-navy-blazer">
                            Review Date
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="TxtBxRewDate" ForeColor="Red" ValidationGroup="insertValue"></asp:RequiredFieldValidator>      
                        </th>
                    </tr>
                    <tr>   
                        <td>
                            <asp:TextBox ID="TxtBxEmpName" runat="server" Width="100%" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownDept" runat="server" Width="100%" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue">
                                <asp:ListItem>- Select a value -</asp:ListItem>
                                <asp:ListItem>Human Resources</asp:ListItem>
                                <asp:ListItem>IT 1</asp:ListItem>
                                <asp:ListItem>IT 2</asp:ListItem>
                                <asp:ListItem>IT 3</asp:ListItem>
                                <asp:ListItem>IT 4</asp:ListItem>
                                <asp:ListItem>Research & Development 1</asp:ListItem>
                                <asp:ListItem>Research & Development 2</asp:ListItem>
                                <asp:ListItem>Research & Development 3</asp:ListItem>
                                <asp:ListItem>Sales 1</asp:ListItem>
                                <asp:ListItem>Sales 2</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownPeriod" runat="server" Width="100%" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue">
                                <asp:ListItem>- Select a value -</asp:ListItem>
                                <asp:ListItem>Quarter 1</asp:ListItem>
                                <asp:ListItem>Quarter 2</asp:ListItem>
                                <asp:ListItem>Quarter 3</asp:ListItem>
                                <asp:ListItem>Quarter 4</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            
                            <div class="w3-bar-item">
                                <asp:TextBox ID="TxtBxRewDate" runat="server" Width="85%" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>
                                <asp:LinkButton ID="BtnCalendar" runat="server" Width="10%"  OnClick="BtnCalendar_Click" CssClass="w3-right"><i class="fa fa-calendar"></i></asp:LinkButton>
                            </div>
                            <div style="position:absolute; right: 100px; margin-top: -50px">
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
                        </td>
                    </tr>

                    <tr>
                        <th colspan="4"></th>
                    </tr>
                    <tr>
                        <th class="w3-2020-navy-blazer">Goals Achieved</th>
                        <th class="w3-2020-navy-blazer">Core Values</th>
                        <th class="w3-2020-navy-blazer">Improvements</th>
                        <th class="w3-2020-navy-blazer">Overall Performance</th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TxtBxGoalsAchieved" runat="server" TextMode="MultiLine" Width="100%" Height="200px" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtBxCoreValues" runat="server" TextMode="MultiLine" Width="100%" Height="200px" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtBxImprovements" runat="server" TextMode="MultiLine" Width="100%" Height="200px" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>    
                        </td>
                        <td>
                            <asp:TextBox ID="TxtBxOverallPerformance" runat="server" TextMode="MultiLine" Width="100%" Height="200px" BackColor="gainsboro" BorderStyle="None" ForeColor="DarkBlue"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <br />

                <div class="w3-bar-item">
                    <asp:Button ID="ButnInsert" runat="server" Text="Insert" class="w3-right w3-2021-inkwell w3-hover-light-gray" style="cursor: pointer; Width: 85px" OnClick="ButnInsert_Click" ValidationGroup="insertValue"/>
                    <asp:Button ID="ButnCancel" runat="server" Text="Cancel" class="w3-right w3-margin-right w3-2021-inkwell w3-hover-light-gray" style="cursor: pointer; Width: 85px" OnClick="ButnCancel_Click" />
                </div>

                <br />
                <br />
            </div>

            <br />
            <br />
            <br />

            <div>
                <asp:Label ID="Label1" runat="server" Text="PAST REVIEWS" Width="100%" style="text-align:center; padding: 10px; font-size: 35px; font-weight: bold; color: dimgrey"></asp:Label>
            </div>

            <asp:DropDownList ID="DropDownPastReview" runat="server" CssClass="dropdown w3-2020-navy-blazer" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="emp_name" DataValueField="emp_name" Font-Bold="true"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="server=localhost;user id=root;password=myNew2021_pass;database=360revyou;persistsecurityinfo=True;allowuservariables=True" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT emp_name FROM performance_review"></asp:SqlDataSource>

            <br />
            <br />

            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="review_id" DataSourceID="SqlDataSource1" Width="100%" OnItemDeleted="FormView1_ItemDeleted">
                <EditItemTemplate>
                    review_id:
                    <asp:Label ID="review_idLabel1" runat="server" Text='<%# Eval("review_id") %>' />
                    <br />
                    emp_name:
                    <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>'  />
                    <br />
                    department:
                    <asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' />
                    <br />
                    review_period:
                    <asp:TextBox ID="review_periodTextBox" runat="server" Text='<%# Bind("review_period") %>' />
                    <br />
                    review_date:
                    <asp:TextBox ID="review_dateTextBox" runat="server" Text='<%# Bind("review_date") %>' />
                    <br />
                    goals_achieved:
                    <asp:TextBox ID="goals_achievedTextBox" runat="server" Text='<%# Bind("goals_achieved") %>' />
                    <br />
                    core_values:
                    <asp:TextBox ID="core_valuesTextBox" runat="server" Text='<%# Bind("core_values") %>' />
                    <br />
                    improvements:
                    <asp:TextBox ID="improvementsTextBox" runat="server" Text='<%# Bind("improvements") %>' />
                    <br />
                    overall_performance:
                    <asp:TextBox ID="overall_performanceTextBox" runat="server" Text='<%# Bind("overall_performance") %>' />
                    <br />
                    Self Review:
                    <asp:TextBox ID="Self_ReviewTextBox" runat="server" Text='<%# Bind("[Self Review]") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    emp_name:
                    <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>' />
                    <br />
                    department:
                    <asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' />
                    <br />
                    review_period:
                    <asp:TextBox ID="review_periodTextBox" runat="server" Text='<%# Bind("review_period") %>' />
                    <br />
                    review_date:
                    <asp:TextBox ID="review_dateTextBox" runat="server" Text='<%# Bind("review_date") %>' />
                    <br />
                    goals_achieved:
                    <asp:TextBox ID="goals_achievedTextBox" runat="server" Text='<%# Bind("goals_achieved") %>' />
                    <br />
                    core_values:
                    <asp:TextBox ID="core_valuesTextBox" runat="server" Text='<%# Bind("core_values") %>' />
                    <br />
                    improvements:
                    <asp:TextBox ID="improvementsTextBox" runat="server" Text='<%# Bind("improvements") %>' />
                    <br />
                    overall_performance:
                    <asp:TextBox ID="overall_performanceTextBox" runat="server" Text='<%# Bind("overall_performance") %>' />
                    <br />
                    Self Review:
                    <asp:TextBox ID="Self_ReviewTextBox" runat="server" Text='<%# Bind("[Self Review]") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="color: darkblue">
                        <tr>
                            <th>
                                Review Item no.:
                            </th>
                            <td>
                                <asp:Label ID="review_idLabel" runat="server" Width="800" Text='<%# Eval("review_id") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Employee Name:
                            </th>
                            <td>
                                <asp:Label ID="emp_nameLabel" runat="server" Text='<%# Bind("emp_name") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Department:
                            </th>
                            <td>
                                <asp:Label ID="departmentLabel" runat="server" Text='<%# Bind("department") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Review period:
                            </th>
                            <td>
                                <asp:Label ID="review_periodLabel" runat="server" Text='<%# Bind("review_period") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Review Date:
                            </th>
                            <td>
                                <asp:Label ID="review_dateLabel" runat="server" Text='<%# Bind("review_date") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Goals Achieved:
                            </th>
                            <td>
                                <asp:Label ID="goals_achievedLabel" runat="server" Text='<%# Bind("goals_achieved") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Core Values:
                            </th>
                            <td>
                                <asp:Label ID="core_valuesLabel" runat="server" Text='<%# Bind("core_values") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Improvements:
                            </th>
                            <td>
                                <asp:Label ID="improvementsLabel" runat="server" Text='<%# Bind("improvements") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Overall Performance:
                            </th>
                            <td>
                                <asp:Label ID="overall_performanceLabel" runat="server" Text='<%# Bind("overall_performance") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Self Review:
                            </th>
                            <td>
                                <asp:Label ID="Self_ReviewLabel" runat="server" Text='<%# Bind("[Self Review]") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/> 
                            </th>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="server=localhost;user id=root;password=myNew2021_pass;database=360revyou;persistsecurityinfo=True;allowuservariables=True" DeleteCommand="DELETE FROM performance_review  WHERE review_id = @review_id" ProviderName="MySql.Data.MySqlClient" SelectCommand="SELECT review_id, emp_name, department, review_period, review_date, goals_achieved, core_values, improvements, overall_performance, concat(&quot;Date: &quot;, self_review_date, &quot;. Self Review: &quot;, self_review_comments)  as &quot;Self Review&quot; FROM performance_review WHERE emp_name = @emp_name">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="FormView1" Name="review_id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownPastReview" Name="emp_name" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
