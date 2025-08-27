using System;
using System.Net.Mail;
using System.Web.UI;

namespace YourNamespace
{
    public partial class Contact : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization code if needed
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Create email message
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress(txtEmail.Text, txtName.Text);
                    mail.To.Add("rezwanahammad68@gmail.com"); // Your email
                    mail.Subject = txtSubject.Text;
                    mail.Body = $"Name: {txtName.Text}\nEmail: {txtEmail.Text}\n\nMessage:\n{txtMessage.Text}";
                    mail.IsBodyHtml = false;

                    // Configure SMTP client
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com"; // Change to your SMTP server
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("your-email@gmail.com", "your-password");

                    // Send email
                    smtp.Send(mail);

                    // Show success message
                    lblMessage.CssClass = "text-green-500";
                    lblMessage.Text = "Thank you! Your message has been sent successfully.";

                    // Clear form
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtSubject.Text = "";
                    txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    // Show error message
                    lblMessage.CssClass = "text-red-500";
                    lblMessage.Text = "Sorry, there was an error sending your message. Please try again.";

                    // Log the error (optional)
                    // System.Diagnostics.Debug.WriteLine("Email Error: " + ex.Message);
                }
            }
        }
    }
}