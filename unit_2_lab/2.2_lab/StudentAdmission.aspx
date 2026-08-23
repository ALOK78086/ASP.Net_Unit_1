<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Registration Successful ! Welcome " + txtName.Text + ".";
        }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Student Admission Form</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Admission Form</h2>
<table>
 <tr><td>Student Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Name required" ForeColor="Red" /></td></tr>
 <tr><td>Father Name</td><td><asp:TextBox ID="txtFather" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtFather" ErrorMessage="Father name required" ForeColor="Red" /></td></tr>
 <tr><td>Date of Birth</td><td><asp:TextBox ID="txtDob" runat="server" TextMode="Date"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtDob" ErrorMessage="DOB required" ForeColor="Red" /></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
  <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        ErrorMessage="Invalid email" ForeColor="Red" /></td></tr>
 <tr><td>Mobile No</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
  <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtMobile"
        ValidationExpression="[0-9]{10}" ErrorMessage="10 digit mobile no" ForeColor="Red" /></td></tr>
 <tr><td>Course</td><td>
   <asp:DropDownList ID="ddlCourse" runat="server">
     <asp:ListItem Value="0">--Select--</asp:ListItem>
     <asp:ListItem>BCA</asp:ListItem><asp:ListItem>MCA</asp:ListItem><asp:ListItem>B.Sc IT</asp:ListItem>
   </asp:DropDownList></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCourse" InitialValue="0"
        ErrorMessage="Select course" ForeColor="Red" /></td></tr>
 <tr><td>Percentage (12th)</td><td><asp:TextBox ID="txtPer" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtPer" MinimumValue="0" MaximumValue="100"
        Type="Double" ErrorMessage="0 to 100 only" ForeColor="Red" /></td></tr>
 <tr><td>Gender</td><td>
   <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
     <asp:ListItem>Male</asp:ListItem><asp:ListItem>Female</asp:ListItem>
   </asp:RadioButtonList></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="rblGender" ErrorMessage="Select gender" ForeColor="Red" /></td></tr>
 <tr><td>Address</td><td><asp:TextBox ID="txtAddr" runat="server" TextMode="MultiLine"></asp:TextBox></td><td></td></tr>
 <tr><td></td><td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
   <asp:Button ID="btnReset" runat="server" Text="Reset" CausesValidation="false" /></td></tr>
</table>
<h3><asp:Label ID="lblMsg" runat="server"></asp:Label></h3>
</form>
</body>
</html>
