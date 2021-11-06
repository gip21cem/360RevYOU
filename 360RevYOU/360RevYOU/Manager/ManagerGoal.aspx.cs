using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace _360RevYOU.Manager
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // create sql connector
        MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = 360revyou; password = myNew2021_pass");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // call the mehtod to fill the GridView when there is no postback
                // the GridView will always be updated and visible 
                FillGridView(); 
            }
            
        }
        
        // method to insert records in  the goal table in database
        protected void newGoal_Click(object sender, EventArgs e)
        {
            // open connector if closed
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            // create sql insert command  
            MySqlCommand sqlCmd = new MySqlCommand("INSERT INTO goal (goal_id, employee_name, goal_description, due_date, priority) VALUES (@goal_id, @employee_name, @goal_description, @due_date, @priority)", connection);
            // specify the values for the insert parameters 
            sqlCmd.Parameters.AddWithValue("@goal_id", hfgoal_id.Value==""?0:Convert.ToInt32(hfgoal_id.Value));
            sqlCmd.Parameters.AddWithValue("@employee_name", TxtBoxEmployee.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@goal_description", TxtBoxGoal.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@due_date", TexBoxDueDate.Text);
            sqlCmd.Parameters.AddWithValue("@priority", DropDownPriority.SelectedValue);
            // execute insert query and close connection  
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            clear();
            Panel2.Visible = false;
            FillGridView();            
        }

        // method to populate the gridview with records from goal table
        void FillGridView()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            // set the select sql statement
            MySqlDataAdapter sqlAdpt = new MySqlDataAdapter("SELECT * FROM goal", connection);
            // the DataTable class represents the goal table in the database
            DataTable dtbl = new DataTable();
            // use MysqlDataAdapter to fill the DataTable object
            sqlAdpt.Fill(dtbl);
            connection.Close();
            // bind the GridView to the DataTable object
            goalGridView.DataSource = dtbl;
            goalGridView.DataBind();
        }

        protected void cancelGoal_Click(object sender, EventArgs e)
        {
            clear();
            Calendar1.Visible = false;
            Panel2.Visible = false;
        }

        public void clear()
        {
            hfgoal_id.Value = "";
            TxtBoxEmployee.Text = "";
            TxtBoxGoal.Text = "";
            TexBoxDueDate.Text = "";
        }

        // method to delete records from the goal table in database
        protected void lnk_OnclickDelete(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            MySqlCommand sqlCmd = new MySqlCommand("DELETE FROM goal WHERE goal_id = @goal_id", connection);
            // specify the value for the delete parameter as the CommandArgument of the delete linkbutton
            int goalID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            sqlCmd.Parameters.AddWithValue("@goal_id", goalID);
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            FillGridView();
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login");
        }

        protected void BtnCalendar1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // format the value of date selected in calendar
            this.TexBoxDueDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;
        }

        protected void AddGoal_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }
    }
}