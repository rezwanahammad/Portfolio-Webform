using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_Webform.Controls
{
    public partial class AdminPanel : UserControl
    {
        public bool IsLoggedIn => Session["AdminLoggedIn"] as bool? == true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsLoggedIn)
            {
                Parent.Controls.Clear();
                Parent.Controls.Add(new Literal { Text = "<p>You must be logged in.</p>" });
                return;
            }

            if (!IsPostBack)
            {
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            string connString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Id, Title, TechStack FROM Projects ORDER BY Id DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ProjectsGrid.DataSource = dt;
                ProjectsGrid.DataBind();
            }
        }

        protected void ProjectsGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)ProjectsGrid.DataKeys[e.RowIndex].Value;
            string connString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "DELETE FROM Projects WHERE Id = @id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            LoadProjects();
        }

        protected void ProjectsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ProjectsGrid.EditIndex = e.NewEditIndex;
            LoadProjects();
        }

        protected void ProjectsGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (int)ProjectsGrid.DataKeys[e.RowIndex].Value;

            TextBox titleBox = (TextBox)ProjectsGrid.Rows[e.RowIndex].FindControl("TitleTextBox");
            TextBox techBox = (TextBox)ProjectsGrid.Rows[e.RowIndex].FindControl("TechTextBox");

            string title = titleBox.Text.Trim();
            string techStack = techBox.Text.Trim();

            if (string.IsNullOrEmpty(title))
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Title is required.');", true);
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "UPDATE Projects SET Title = @title, TechStack = @tech WHERE Id = @id";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@tech", techStack);
                        cmd.Parameters.AddWithValue("@id", id);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ProjectsGrid.EditIndex = -1;
                LoadProjects();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void ProjectsGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ProjectsGrid.EditIndex = -1;
            LoadProjects();
        }

        protected void AddProjectButton_Click(object sender, EventArgs e)
        {
            string title = NewTitleTextBox.Text.Trim();
            string description = NewDescriptionTextBox.Text.Trim();
            string imageUrl = NewImageUrlTextBox.Text.Trim();
            string sourceUrl = NewSourceUrlTextBox.Text.Trim();
            string techStack = NewTechStackTextBox.Text.Trim();

            if (string.IsNullOrEmpty(title))
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Project title is required.');", true);
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"INSERT INTO Projects (Title, Description, ImageUrl, SourceUrl, TechStack) 
                                     VALUES (@title, @desc, @img, @source, @tech)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@desc", description);
                        cmd.Parameters.AddWithValue("@img", string.IsNullOrEmpty(imageUrl) ? "/Images/default.png" : imageUrl);
                        cmd.Parameters.AddWithValue("@source", string.IsNullOrEmpty(sourceUrl) ? "" : sourceUrl);
                        cmd.Parameters.AddWithValue("@tech", string.IsNullOrEmpty(techStack) ? "" : techStack);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                NewTitleTextBox.Text = "";
                NewDescriptionTextBox.Text = "";
                NewImageUrlTextBox.Text = "";
                NewSourceUrlTextBox.Text = "";
                NewTechStackTextBox.Text = "";

                LoadProjects();

                Page.ClientScript.RegisterStartupScript(GetType(), "success", "alert('Project added successfully!');", true);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}