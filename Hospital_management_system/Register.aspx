<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hospital_Management_System.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #form1 {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group input[type="radio"] {
            margin-right: 5px;
        }

        .form-group .radio-container {
            display: flex;
            align-items: center;
            gap: 20px; /* Adjust spacing between radio buttons */
        }

        .form-group .radio-container label {
            margin: 0;
        }

        .form-group .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .form-group input[type="submit"],
        .form-group input[type="button"] {
            background: #5cb85c;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 10px;
            transition: background 0.3s ease;
        }

        .form-group input[type="submit"]:hover,
        .form-group input[type="button"]:hover {
            background: #4cae4c;
        }

        .form-group input[type="button"] {
            background: #0275d8; /* Blue color for the login button */
        }

        .form-group input[type="button"]:hover {
            background: #025aa5;
        }

        .validation-error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Registration Form</h2>

            <div class="form-group">
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:" AssociatedControlID="txtFirstName"></asp:Label>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" 
                    ErrorMessage="First Name is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:" AssociatedControlID="txtLastName"></asp:Label>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" 
                    ErrorMessage="Last Name is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Email is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Invalid email format." CssClass="validation-error" Display="Dynamic"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="txtPassword"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                    ErrorMessage="Password is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblGender" runat="server" Text="Gender:" AssociatedControlID="rblGender"></asp:Label>
                <div class="radio-container">
                    <asp:RadioButtonList ID="rblGender" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender" 
                        ErrorMessage="Gender is required." CssClass="validation-error" Display="Dynamic"
                        InitialValue="-1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEducation" runat="server" Text="Education:" AssociatedControlID="ddlEducation"></asp:Label>
                <asp:DropDownList ID="ddlEducation" runat="server">
                    <asp:ListItem Value="" Text="Select"></asp:ListItem>
                    <asp:ListItem Value="">High School</asp:ListItem>
                    <asp:ListItem Value="Associate Degree">Associate Degree</asp:ListItem>
                    <asp:ListItem Value="Bachelor's Degree">Bachelor's Degree</asp:ListItem>
                    <asp:ListItem Value="Master's Degree">Master's Degree</asp:ListItem>
                    <asp:ListItem Value="Doctorate">Doctorate</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvEducation" runat="server" ControlToValidate="ddlEducation" 
                    ErrorMessage="Education is required." CssClass="validation-error" Display="Dynamic"
                    InitialValue="-1"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblExperience" runat="server" Text="Experience (in years):" AssociatedControlID="txtExperience"></asp:Label>
                <asp:TextBox ID="txtExperience" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblCriminalRecord" runat="server" Text="Do you have a criminal record?" AssociatedControlID="rblCriminalRecord"></asp:Label>
                <div class="radio-container">
                    <asp:RadioButtonList ID="rblCriminalRecord" runat="server">
                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="form-group button-container">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login" />
            </div>
        </div>
    </form>
</body>
</html>
