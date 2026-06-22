<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_from.aspx.cs" Inherits="Login_Page.Login_from" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="login-container">

            <div class="login-box">

                <h2>Login</h2>

                <asp:Label ID="lblUser" runat="server" Text="Username"></asp:Label>

                <asp:TextBox ID="txtUser" runat="server" CssClass="textbox"
                    placeholder="Enter Username"></asp:TextBox>

                <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label>

                <asp:TextBox ID="txtPass" runat="server" CssClass="textbox"
                    TextMode="Password" placeholder="Enter Password"></asp:TextBox>

                <asp:Button ID="btnLogin" runat="server"
                    Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" OnLoad="btnLogin_Load" />

                <p class="register-link">
                    Don't have an account?
                    <a href="#">Register Here</a>
                </p>

            </div>

        </div>

    </form>

</body>
</html>
