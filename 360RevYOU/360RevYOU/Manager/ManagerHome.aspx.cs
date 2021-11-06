using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _360RevYOU
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = 360revyou; password = myNew2021_pass");

        MySqlCommand sqlCmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login");
        }

        public void clear()
        {
            TxtBoxType.Text = "";
            TxtBoxDescription.Text = "";
            TxtBoxDate.Text = "";
        }

        protected void LinkBtnInsert_Click(object sender, EventArgs e)
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();  
            sqlCmd = new MySqlCommand("INSERT INTO activity (activity_type, description, due_date) VALUES (@activity_type, @description, @due_date)", connection);
            sqlCmd.Parameters.AddWithValue("@activity_type", TxtBoxType.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@description", TxtBoxDescription.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@due_date", TxtBoxDate.Text.Trim());
            sqlCmd.ExecuteNonQuery();
            connection.Close();
            clear();
            GridView1.DataBind();
        }

        protected void LinkBtnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}

