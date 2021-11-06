using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _360RevYOU.Manager
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // call the mehtod to fill the ListView when there is no postback
                // the ListView will always be updated and visible 
                FillListView();
            }
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login");
        }

        protected void clear()
        {
            hfMessage_id.Value = "";
            txtBoxSubject.Text = "";
            txtBoxText.Text = "";
            
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            clear();
        }

        // create sql connector
        MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = 360revyou; password = myNew2021_pass");

        protected void PostMessage_Click(object sender, EventArgs e)
        {
           // open connector if closed
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            // create sql insert command  
            MySqlCommand sqlCmdInsert = new MySqlCommand("INSERT INTO message (message_id, subject, text, postedBy, datePosted) VALUES (@message_id, @subject, @text, @postedBy, @datePosted)", connection);
            // specify the values for the insert parameters 
            sqlCmdInsert.Parameters.AddWithValue("@message_id", hfMessage_id.Value == "" ? 0 : Convert.ToInt32(hfMessage_id.Value));
            sqlCmdInsert.Parameters.AddWithValue("@subject", txtBoxSubject.Text.Trim());
            sqlCmdInsert.Parameters.AddWithValue("@text", txtBoxText.Text.Trim());
            sqlCmdInsert.Parameters.AddWithValue("@postedBy", Context.User.Identity.Name);
            sqlCmdInsert.Parameters.AddWithValue("@datePosted", Convert.ToDateTime(DateTime.Now).ToString("yyyy-MM-dd HH:mm"));
            // execute insert query and close connection  
            sqlCmdInsert.ExecuteNonQuery();
            connection.Close();
            clear();
            FillListView();            
        }

        void FillListView()
        {
            // open connector if closed
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            // set the select sql statement
            MySqlDataAdapter sqlAdpt = new MySqlDataAdapter("SELECT message_id, subject, text, postedBy, datePosted FROM message", connection);
            // the DataTable class represents the message table in the database
            DataTable dtbl = new DataTable();
            // use MysqlDataAdapter to fill the DataTable object
            sqlAdpt.Fill(dtbl);
            connection.Close();
            // bind the ListView to the DataTable object
            ListView1.DataSource = dtbl;
            ListView1.DataBind();
        }
    }
}