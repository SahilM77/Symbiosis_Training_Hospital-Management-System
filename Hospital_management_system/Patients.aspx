<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientForm.aspx.cs" Inherits="PatientForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Patient Form</h2>

            <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblDateOfBirth" runat="server" Text="Date of Birth:"></asp:Label>
            <asp:TextBox ID="txtDateOfBirth" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" 
                ControlToValidate="txtDateOfBirth" ErrorMessage="Date of Birth is required." 
                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            
            <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="PatientId" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
