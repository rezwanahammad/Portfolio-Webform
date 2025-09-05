using System;
using System.Web.UI;

namespace Portfolio_Webform
{
    public partial class AdminPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] as bool? != true)
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}