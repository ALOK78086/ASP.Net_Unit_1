<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    // Static data used for validating the user
    string validUser = "admin";
    string validPass = "admin123";

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUser.Text.Trim() == "" || txtPass.Text.Trim() == "")
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please enter User ID and Password.";
            return;
        }
        if (txtUser.Text.Trim() == validUser && txtPass.Text == validPass)
        {
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Login Successful. Welcome " + txtUser.Text + " !";
        }
        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Invalid User ID or Password !";
        }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Login with Static Data</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Login</h2>
 <table>
  <tr><td>User ID</td><td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td></tr>
  <tr><td>Password</td><td><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></td></tr>
  <tr><td></td><td><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td></tr>
 </table>
 <asp:Label ID="lblMsg" runat="server"></asp:Label>
</form>
</body>
</html>
