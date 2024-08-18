using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Hospital_Management_System
{
    public partial class Priscriptions1 : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPrescriptions();
            }
        }

        private void BindPrescriptions()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[Prescriptions]", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPrescriptions.DataSource = dt;
                gvPrescriptions.DataBind();
            }
        }

        protected void gvPrescriptions_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPrescriptions.EditIndex = e.NewEditIndex;
            BindPrescriptions();
        }

        protected void gvPrescriptions_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prescriptionID = Convert.ToInt32(gvPrescriptions.DataKeys[e.RowIndex].Value);
            string patientID = (gvPrescriptions.Rows[e.RowIndex].FindControl("txtPatientID") as TextBox).Text;
            string doctorID = (gvPrescriptions.Rows[e.RowIndex].FindControl("txtDoctorID") as TextBox).Text;
            string medicineName = (gvPrescriptions.Rows[e.RowIndex].FindControl("txtMedicineName") as TextBox).Text;
            string dosage = (gvPrescriptions.Rows[e.RowIndex].FindControl("txtDosage") as TextBox).Text;
            DateTime startDate = Convert.ToDateTime((gvPrescriptions.Rows[e.RowIndex].FindControl("txtStartDate") as TextBox).Text);
            DateTime endDate = Convert.ToDateTime((gvPrescriptions.Rows[e.RowIndex].FindControl("txtEndDate") as TextBox).Text);
            string notes = (gvPrescriptions.Rows[e.RowIndex].FindControl("txtNotes") as TextBox).Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Prescriptions] SET PatientID = @PatientID, DoctorID = @DoctorID, MedicineName = @MedicineName, Dosage = @Dosage, StartDate = @StartDate, EndDate = @EndDate, Notes = @Notes WHERE PrescriptionID = @PrescriptionID", conn);
                cmd.Parameters.AddWithValue("@PatientID", patientID);
                cmd.Parameters.AddWithValue("@DoctorID", doctorID);
                cmd.Parameters.AddWithValue("@MedicineName", medicineName);
                cmd.Parameters.AddWithValue("@Dosage", dosage);
                cmd.Parameters.AddWithValue("@StartDate", startDate);
                cmd.Parameters.AddWithValue("@EndDate", endDate);
                cmd.Parameters.AddWithValue("@Notes", notes);
                cmd.Parameters.AddWithValue("@PrescriptionID", prescriptionID);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            gvPrescriptions.EditIndex = -1;
            BindPrescriptions();
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showAlert('Record updated successfully.');", true);
        }

        protected void gvPrescriptions_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPrescriptions.EditIndex = -1;
            BindPrescriptions();
        }

        protected void gvPrescriptions_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            // Check if there was an error during the update operation
            if (e.Exception != null)
            {
                // Log or display the error
                string errorMessage = "An error occurred while updating the record: " + e.Exception.Message;

                // Display error message (optional: use a label or JavaScript alert)
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", $"showAlert('{errorMessage}');", true);

                // Mark the exception as handled to prevent the default error message
                e.ExceptionHandled = true;
            }
            else
            {
                // Optionally provide feedback that the update was successful
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showAlert('Record updated successfully.');", true);
            }

            // Rebind the GridView to ensure it shows the latest data
            BindPrescriptions();
        }

    }
}
