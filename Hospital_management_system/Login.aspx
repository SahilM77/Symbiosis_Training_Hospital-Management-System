<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hospital_Management_System.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .form-label {
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }

        .form-input {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-left:30px;
        }

        .form-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-button:hover {
            background-color: #45a049;
        }

        .form-message {
            margin-top: 10px;
            font-size: 14px;
            color: red; /* Keep it red for error messages */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
            <asp:Label ID="lblEmail" runat="server" CssClass="form-label" Text="Email:" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" />
            <asp:Label ID="lblPassword" runat="server" CssClass="form-label" Text="Password:" />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" />
            <asp:Button ID="btnLogin" runat="server" CssClass="form-button" Text="Login" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="form-message" />
        </div>
    </form>
</body>
</html>
