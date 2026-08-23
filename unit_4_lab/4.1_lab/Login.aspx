<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM tblUser WHERE UserId=@u AND Password=@p", con);
                cmd.Parameters.AddWithValue("@u", txtUser.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtPass.Text);
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count > 0)
                {
                    Session["User"] = txtUser.Text.Trim();
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    lblMsg.Text = "Login Successful. Welcome " + txtUser.Text + " !";
                }
                else
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Invalid User ID or Password.";
                }
            }
            catch (Exception ex)
            { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = "Error : " + ex.Message; }
        }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Login (Database)</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Login</h2>
 User ID : <asp:TextBox ID="txtUser" runat="server"></asp:TextBox><br /><br />
 Password : <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox><br /><br />
 <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
 <br /><br /><asp:Label ID="lblMsg" runat="server"></asp:Label>
</form>
</body>
</html>
