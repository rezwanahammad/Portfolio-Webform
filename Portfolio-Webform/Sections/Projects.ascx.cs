using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_Webform.Sections
{
    public partial class ProjectsControl : UserControl  // Changed: Inherits UserControl, not Page
    {
        protected PlaceHolder ProjectsContainer; // This matches the server control in .ascx

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            string connString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            StringBuilder html = new StringBuilder();

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                        SELECT Title, Description, ImageUrl, SourceUrl, TechStack 
                        FROM Projects 
                        ORDER BY Id DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string imageUrl = !string.IsNullOrEmpty(reader["ImageUrl"].ToString())
                                    ? reader["ImageUrl"].ToString()
                                    : "/Images/default.png";

                                html.Append($@"
                                    <div class='project-card'>
                                        <img src='{imageUrl}' alt='{reader["Title"]}' class='project-image' />
                                        <h3>{reader["Title"]}</h3>
                                        <p class='tech-stack'><strong>Tech:</strong> {reader["TechStack"]}</p>
                                        <p>{reader["Description"]}</p>
                                        <div class='project-links'>
                                            {(Uri.IsWellFormedUriString(reader["SourceUrl"].ToString(), UriKind.Absolute)
                                                ? $"<a href='{reader["SourceUrl"]}' target='_blank' class='btn source'><i class='fab fa-github'></i> Source</a>"
                                                : "")}
                                        </div>
                                    </div>");
                            }
                        }
                    }
                }

                // Clear and inject HTML
                ProjectsContainer.Controls.Clear();
                ProjectsContainer.Controls.Add(new Literal { Text = html.ToString() });
            }
            catch (Exception ex)
            {
                // Log error (you can check this in debug)
                ProjectsContainer.Controls.Clear();
                ProjectsContainer.Controls.Add(new Literal { Text = $"<p style='color:red;'>Error loading projects: {ex.Message}</p>" });
            }
        }
    }
}