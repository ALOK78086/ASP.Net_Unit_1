<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    // Generates a random 8 character password
    string GeneratePassword()
    {
        string chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";
        Random r = new Random();
        char[] p = new char[8];
        for (int i = 0; i < 8; i++) p[i] = chars[r.Next(chars.Length)];
        return new string(p);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string userId = txtEmail.Text.Trim();      // User Id is same as email
        string password = GeneratePassword();

        string cs = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                  "INSERT INTO tblStudent(Name,Course,DOB,Mobile,Address,UserId,Password) " +
                  "VALUES(@n,@c,@d,@m,@a,@u,@p)", con);
                cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@c", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("@d", txtDob.Text);
                cmd.Parameters.AddWithValue("@m", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@a", txtAddr.Text.Trim());
                cmd.Parameters.AddWithValue("@u", userId);
                cmd.Parameters.AddWithValue("@p", password);
                cmd.ExecuteNonQuery();

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Registration Successful !<br/>Your User Id : <b>" + userId +
                              "</b><br/>Your Password : <b>" + password + "</b>";
            }
            catch (Exception ex)
            { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = "Error : " + ex.Message; }
        }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Student Registration</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Registration</h2>
<table>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
   <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red" /></td></tr>
 <tr><td>Course</td><td><asp:DropDownList ID="ddlCourse" runat="server">
     <asp:ListItem Value="0">--Select--</asp:ListItem><asp:ListItem>BCA</asp:ListItem><asp:ListItem>MCA</asp:ListItem>
   </asp:DropDownList></td>
   <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCourse" InitialValue="0" ErrorMessage="*" ForeColor="Red" /></td></tr>
 <tr><td>Date of Birth</td><td><asp:TextBox ID="txtDob" runat="server" TextMode="Date"></asp:TextBox></td><td></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox></td>
   <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red" /></td></tr>
 <tr><td>Mobile</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
   <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}" ErrorMessage="10 digits" ForeColor="Red" /></td></tr>
 <tr><td>Address</td><td><asp:TextBox ID="txtAddr" runat="server" TextMode="MultiLine"></asp:TextBox></td><td></td></tr>
 <tr><td></td><td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td></tr>
</table>
<asp:Label ID="lblMsg" runat="server"></asp:Label>
</form>
</body>
</html>
