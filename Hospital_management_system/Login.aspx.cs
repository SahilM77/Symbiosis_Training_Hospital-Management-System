using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Hospital_Management_System
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code if needed
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Connection string to your SQL Server database
            string connectionString = WebConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users1 WHERE Email = @Email AND Password = @Password";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                int userCount = (int)command.ExecuteScalar();
                connection.Close();

                if (userCount > 0)
                {
                    // Redirect to another page upon successful login
                    Response.Redirect("Priscriptions1.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}
