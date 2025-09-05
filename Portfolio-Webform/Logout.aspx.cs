﻿using System;
using System.Web.UI;

namespace Portfolio_Webform
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}