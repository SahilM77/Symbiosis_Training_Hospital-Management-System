<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Priscriptions1.aspx.cs" Inherits="Hospital_Management_System.Priscriptions1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prescriptions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #form1 {
            padding: 20px;
        }

        .grid-container {
            width: 100%;
            max-width: 1200px;
            margin: auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .scrollable-table {
            max-height: 500px; /* Adjust height as needed */
            overflow-y: auto;
            display: block;
        }

        .scrollable-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .scrollable-table th, .scrollable-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .scrollable-table th {
            background-color: #f5f5f5;
        }

        .scrollable-table tr:hover {
            background-color: #f1f1f1;
        }

        .edit-button, .update-button, .cancel-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        .update-button {
            background-color: #008CBA;
        }

        .cancel-button {
            background-color: #f44336;
        }

        .edit-button:hover, .update-button:hover, .cancel-button:hover {
            opacity: 0.8;
        }
    </style>
    <script type="text/javascript">
        function showAlert(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid-container">
            <div class="scrollable-table">
                <asp:GridView ID="gvPrescriptions" runat="server" AutoGenerateColumns="False" OnRowEditing="gvPrescriptions_RowEditing" OnRowUpdating="gvPrescriptions_RowUpdating" OnRowCancelingEdit="gvPrescriptions_RowCancelingEdit" OnRowUpdated="gvPrescriptions_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="PrescriptionID" HeaderText="Prescription ID" ReadOnly="True" />
                        <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                        <asp:BoundField DataField="DoctorID" HeaderText="Doctor ID" />
                        <asp:BoundField DataField="MedicineName" HeaderText="Medicine Name" />
                        <asp:BoundField DataField="Dosage" HeaderText="Dosage" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="edit-button" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPatientID" runat="server" Text='<%# Bind("PatientID") %>' />
                                <asp:TextBox ID="txtDoctorID" runat="server" Text='<%# Bind("DoctorID") %>' />
                                <asp:TextBox ID="txtMedicineName" runat="server" Text='<%# Bind("MedicineName") %>' />
                                <asp:TextBox ID="txtDosage" runat="server" Text='<%# Bind("Dosage") %>' />
                                <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("StartDate", "{0:yyyy-MM-dd}") %>' />
                                <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("EndDate", "{0:yyyy-MM-dd}") %>' />
                                <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>' />
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="update-button" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="cancel-button" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:HiddenField ID="hfAlertMessage" runat="server" />
        </div>
    </form>
</body>
</html>
