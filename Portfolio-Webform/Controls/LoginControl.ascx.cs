using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace Portfolio_Webform.Controls
{
    public partial class LoginControl : UserControl
    {
        public event EventHandler LoginSuccess;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MessageLabel.Text = "";
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = UsernameTextBox.Text.Trim();
            string password = PasswordTextBox.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageLabel.Text = "Please fill all fields.";
                return;
            }

            string passwordHash = HashPassword(password);

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString))
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Username = @user AND PasswordHash = @pass";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@user", username);
                        cmd.Parameters.AddWithValue("@pass", passwordHash);
                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();

                        if (count > 0)
                        {
                            Session["AdminLoggedIn"] = true;
                            Session["Username"] = username;
                            LoginSuccess?.Invoke(this, EventArgs.Empty);
                        }
                        else
                        {
                            MessageLabel.Text = "Invalid username or password.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageLabel.Text = "Error: " + ex.Message;
            }
        }

        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}