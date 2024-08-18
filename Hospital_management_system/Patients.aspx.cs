/*using Hospital_Management_System;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class PatientForm : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PatientDBConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Patients (FirstName, LastName, DateOfBirth, Address, PhoneNumber) VALUES (@FirstName, @LastName, @DateOfBirth, @Address, @PhoneNumber)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                command.Parameters.AddWithValue("@DateOfBirth", DateTime.Parse(txtDateOfBirth.Text));
                command.Parameters.AddWithValue("@Address", txtAddress.Text);
                command.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        // Clear form fields
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDateOfBirth.Text = "";
        txtAddress.Text = "";
        txtPhoneNumber.Text = "";

        BindGrid();
    }

    private void BindGrid()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["PatientDBConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Patients";
            using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvPatients.DataSource = dt;
                gvPatients.DataBind();
            }
        }
    }
}*/
