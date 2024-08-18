using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Hospital_Management_System
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code if needed
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text; // Hash the password in practice
            string gender = rblGender.SelectedValue;
            string education = ddlEducation.SelectedValue;
            string experience = txtExperience.Text.Trim();
            string criminalRecord = rblCriminalRecord.SelectedValue;

            // Initialize experience if it's empty
            if (string.IsNullOrEmpty(experience))
            {
                experience = "Not provided"; // Or set it to a default value
            }

            // Connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;

            // SQL query to insert data into the database
            string query = "INSERT INTO Users1 (FirstName, LastName, Email, Password, Gender, Education, Experience, CriminalRecord) " +
                           "VALUES (@FirstName, @LastName, @Email, @Password, @Gender, @Education, @Experience, @CriminalRecord)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Adding parameters to avoid SQL injection and ensure correct data types
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); // Hash password before storing in practice
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@Education", education);
                        cmd.Parameters.AddWithValue("@Experience", experience);
                        cmd.Parameters.AddWithValue("@CriminalRecord", criminalRecord);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        // Use JavaScript to show an alert on the client side
                        string script = "alert('Registration successful!');";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", script, true);
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log the exception message and display an error alert
                string errorScript = $"alert('Database error: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", errorScript, true);
            }
            catch (Exception ex)
            {
                // Log the general exception message and display an error alert
                string errorScript = $"alert('An error occurred: {ex.Message}');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", errorScript, true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Handle the login button click event
            // For example, redirect to the login page:
            Response.Redirect("Login.aspx");
        }
    }
}
