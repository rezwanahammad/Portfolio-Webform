using System;
using System.Web.UI;

namespace Portfolio_Webform
{
    public partial class LoginPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] as bool? == true)
            {
                Response.Redirect("AdminPage.aspx");
            }

            LoginControl1.LoginSuccess += (s, ev) => Response.Redirect("AdminPage.aspx");
            SignupControl1.SignupSuccess += (s, ev) =>
            {
                ClientScript.RegisterStartupScript(GetType(), "showLogin", "showLogin();", true);
            };
        }
    }
}