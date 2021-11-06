using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _360RevYOU.Manager
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                DropDownPastReview.DataBind();
        }

        // create sql connector
        MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = 360revyou; password = myNew2021_pass");

        MySqlCommand sqlCmd;

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login");
        }

        public void clear()
        {
            TxtBxEmpName.Text = "";
            DropDownDept.ClearSelection();
            DropDownPeriod.ClearSelection();
            TxtBxRewDate.Text = "";
            TxtBxGoalsAchieved.Text = "";
            TxtBxCoreValues.Text = "";
            TxtBxImprovements.Text = "";
            TxtBxOverallPerformance.Text = "";
        }

        protected void ButnCancel_Click(object sender, EventArgs e)
        {
            clear();
            Calendar1.Visible = false;
        }

        protected void ButnInsert_Click(object sender, EventArgs e)
        {
            // open connector if closed
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            // create sql insert command  
            sqlCmd = new MySqlCommand("INSERT INTO performance_review (emp_name, department, review_period, review_date, goals_achieved, core_values, improvements, overall_performance) VALUES (@emp_name, @department, @review_period, @review_date, @goals_achieved, @core_values, @improvements, @overall_performance)", connection);
            // specify the values for the insert parameters 
            sqlCmd.Parameters.AddWithValue("@emp_name", TxtBxEmpName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@department", DropDownDept.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@review_period", DropDownPeriod.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@review_date", TxtBxRewDate.Text);
            sqlCmd.Parameters.AddWithValue("@goals_achieved", TxtBxGoalsAchieved.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@core_values", TxtBxCoreValues.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@improvements", TxtBxImprovements.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@overall_performance", TxtBxOverallPerformance.Text.Trim());
            // execute insert query and close connection  
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            clear();
            FormView1.DataBind();
            DropDownPastReview.DataBind();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // format the value of date selected in calendar
            this.TxtBxRewDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;
        }

        protected void BtnCalendar_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            DropDownPastReview.DataBind();
        }
    }
}