using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _360RevYOU.Employee
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Date"] = DateTime.Now.Date.ToString("dd/MM/yyyy");
            if (Session["Date"] != null)
            {
                LblDate.Text = Session["Date"].ToString(); 
            }
        }

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
            DropDownEmployee.ClearSelection();
            DropDownPeriod.ClearSelection();
            TxtBoxGoals.Text = "";
            TxtBoxComments.Text = "";
        }

        protected void ButnCancel_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void ButnInsert_Click(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            sqlCmd = new MySqlCommand("UPDATE performance_review  SET self_review_date = @self_review_date, self_review_goals = @self_review_goals, self_review_comments = @self_review_comments WHERE emp_name = @emp_name AND review_period = @review_period", connection);
            sqlCmd.Parameters.AddWithValue("@emp_name", DropDownEmployee.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@review_period", DropDownPeriod.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@self_review_date", LblDate.Text);
            sqlCmd.Parameters.AddWithValue("@self_review_goals", TxtBoxGoals.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@self_review_comments", TxtBoxComments.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            System.Threading.Thread.Sleep(3000);
            clear();             
        }


    }
}