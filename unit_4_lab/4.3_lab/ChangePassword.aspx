<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (txtNew.Text != txtConfirm.Text)
        { Msg("New password and confirm password do not match.", false); return; }

        string cs = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                // Step 1 : verify the old user id / password from database
                SqlCommand chk = new SqlCommand(
                    "SELECT COUNT(*) FROM tblUser WHERE UserId=@u AND Password=@p", con);
                chk.Parameters.AddWithValue("@u", txtUser.Text.Trim());
                chk.Parameters.AddWithValue("@p", txtOld.Text);

                if (Convert.ToInt32(chk.ExecuteScalar()) == 0)
                { Msg("Invalid User ID or Old Password.", false); return; }

                // Step 2 : update the new password
                SqlCommand upd = new SqlCommand(
                    "UPDATE tblUser SET Password=@np WHERE UserId=@u", con);
                upd.Parameters.AddWithValue("@np", txtNew.Text);
                upd.Parameters.AddWithValue("@u", txtUser.Text.Trim());
                upd.ExecuteNonQuery();

                Msg("Password changed successfully.", true);
            }
            catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        }
    }
    void Msg(string m, bool ok)
    { lblMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red; lblMsg.Text = m; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Change Password (Database)</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Change Password</h2>
<table>
 <tr><td>User ID</td><td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td></tr>
 <tr><td>Old Password</td><td><asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox></td></tr>
 <tr><td>New Password</td><td><asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox></td></tr>
 <tr><td>Confirm Password</td><td><asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox></td></tr>
 <tr><td></td><td><asp:Button ID="btnChange" runat="server" Text="Change Password" OnClick="btnChange_Click" /></td></tr>
</table>
<asp:Label ID="lblMsg" runat="server"></asp:Label>
</form>
</body>
</html>
