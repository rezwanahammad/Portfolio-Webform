using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace Portfolio_Webform.Controls
{
    public partial class SignupControl : UserControl
    {
        public event EventHandler SignupSuccess;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MessageLabel.Text = "";
            }
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
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
                    string query = "INSERT INTO Users (Username, PasswordHash) VALUES (@user, @pass)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@user", username);
                        cmd.Parameters.AddWithValue("@pass", passwordHash);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                SignupSuccess?.Invoke(this, EventArgs.Empty);
            }
            catch (Exception ex) when (ex.Message.Contains("duplicate"))
            {
                MessageLabel.Text = "Username already taken.";
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