<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUser.Text.Trim().Length == 0)
                throw new ArgumentException("User ID cannot be blank.");
            if (txtPass.Text.Trim().Length == 0)
                throw new ArgumentException("Password cannot be blank.");

            if (txtUser.Text.Trim() == "admin" && txtPass.Text == "admin123")
            {
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Login Successful.";
            }
            else
            {
                throw new UnauthorizedAccessException("Invalid User ID or Password.");
            }
        }
        catch (ArgumentException ax)          // specific exception
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Input Error : " + ax.Message;
        }
        catch (UnauthorizedAccessException ux)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Security Error : " + ux.Message;
        }
        catch (Exception ex)                  // general exception
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Unexpected Error : " + ex.Message;
        }
        finally
        {
            txtPass.Text = "";                // always executed
        }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Login with Exception Handling</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Login (Exception Handling)</h2>
 User ID : <asp:TextBox ID="txtUser" runat="server"></asp:TextBox><br /><br />
 Password : <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox><br /><br />
 <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
 <br /><br /><asp:Label ID="lblMsg" runat="server"></asp:Label>
</form>
</body>
</html>
