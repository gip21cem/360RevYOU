using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI.WebControls;

namespace WebFormsIdentity
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
        }

        protected void SignIn(object sender, EventArgs e)
        {
            // look for registered users
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(UserName.Text, Password.Text);

            if (user != null)
            {
                // registered user found, authenticated and signed in
                // a cookie is created to store the user's identity
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                // based on their registration role
                // users are redirected to different pages
                if (Context.User.IsInRole("Manager"))
                    Response.Redirect("~/Manager/ManagerHome.aspx");
                if (Context.User.IsInRole("Employee"))
                    Response.Redirect("~/Employee/EmployeeNotes");
            }
            else
            {
                // registered user NOT found
                StatusText.Text = "Invalid username or password.";
                LoginStatus.Visible = true;
            }
        }

        
    }
}