<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (txtPwd.Text != txtCPwd.Text)
        { Msg("Password and Confirm password do not match.", false); return; }

        string cs = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO tblUser(UserId,Name,Email,Mobile,Password) VALUES(@u,@n,@e,@m,@p)", con);
                cmd.Parameters.AddWithValue("@u", txtUser.Text.Trim());
                cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@m", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtPwd.Text);
                cmd.ExecuteNonQuery();
                Msg("Sign Up Successful. You can login now.", true);
            }
            catch (SqlException ex) { Msg("Database Error : " + ex.Message, false); }
            catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        }
    }
    void Msg(string m, bool ok)
    { lblMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red; lblMsg.Text = m; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Sign Up</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>User Sign Up</h2>
<table>
 <tr><td>User ID</td><td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser" ErrorMessage="*" ForeColor="Red" /></td></tr>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td><td></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox></td><td></td></tr>
 <tr><td>Mobile</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
  <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" ErrorMessage="10 digits" ForeColor="Red" /></td></tr>
 <tr><td>Password</td><td><asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox></td><td></td></tr>
 <tr><td>Confirm Password</td><td><asp:TextBox ID="txtCPwd" runat="server" TextMode="Password"></asp:TextBox></td><td></td></tr>
 <tr><td></td><td><asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" /></td></tr>
</table>
<asp:Label ID="lblMsg" runat="server"></asp:Label><br />
<asp:HyperLink runat="server" NavigateUrl="Login.aspx">Already registered ? Login</asp:HyperLink>
</form>
</body>
</html>
