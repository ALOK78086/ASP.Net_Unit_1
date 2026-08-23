<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        int m1 = int.Parse(txtM1.Text), m2 = int.Parse(txtM2.Text), m3 = int.Parse(txtM3.Text);
        int m4 = int.Parse(txtM4.Text), m5 = int.Parse(txtM5.Text);
        int total = m1 + m2 + m3 + m4 + m5;
        double per = total / 5.0;

        string result = (m1 >= 33 && m2 >= 33 && m3 >= 33 && m4 >= 33 && m5 >= 33) ? "Pass" : "Fail";
        string grade;
        if (result == "Fail") grade = "F";
        else if (per >= 75) grade = "A+";
        else if (per >= 60) grade = "A";
        else if (per >= 50) grade = "B";
        else grade = "C";

        // Values are passed to the next page using Session
        Session["Roll"] = txtRoll.Text;
        Session["Name"] = txtName.Text;
        Session["Course"] = ddlCourse.SelectedValue;
        Session["Sem"] = ddlSem.SelectedValue;
        Session["Total"] = total;
        Session["Per"] = per.ToString("0.00");
        Session["Grade"] = grade;
        Session["Result"] = result;

        Response.Redirect("MarkSheetResult.aspx");
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Student Mark Sheet Entry</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Mark Sheet</h2>
<table>
 <tr><td>Roll No</td><td><asp:TextBox ID="txtRoll" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtRoll" ErrorMessage="Roll no required" ForeColor="Red" /></td></tr>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Name required" ForeColor="Red" /></td></tr>
 <tr><td>Course</td><td><asp:DropDownList ID="ddlCourse" runat="server">
    <asp:ListItem Value="0">--Select--</asp:ListItem><asp:ListItem>BCA</asp:ListItem><asp:ListItem>MCA</asp:ListItem>
   </asp:DropDownList></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCourse" InitialValue="0" ErrorMessage="Select course" ForeColor="Red" /></td></tr>
 <tr><td>Semester</td><td><asp:DropDownList ID="ddlSem" runat="server">
    <asp:ListItem Value="0">--Select--</asp:ListItem><asp:ListItem>I</asp:ListItem><asp:ListItem>II</asp:ListItem>
    <asp:ListItem>III</asp:ListItem><asp:ListItem>IV</asp:ListItem>
   </asp:DropDownList></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="ddlSem" InitialValue="0" ErrorMessage="Select semester" ForeColor="Red" /></td></tr>
 <tr><td>Email ID</td><td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
  <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email" ForeColor="Red" /></td></tr>
 <tr><td>Mobile No</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
  <td><asp:RegularExpressionValidator runat="server" ControlToValidate="txtMobile" ValidationExpression="[0-9]{10}"
        ErrorMessage="10 digit mobile no" ForeColor="Red" /></td></tr>
 <tr><td>Subject 1</td><td><asp:TextBox ID="txtM1" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtM1" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0-100" ForeColor="Red" /></td></tr>
 <tr><td>Subject 2</td><td><asp:TextBox ID="txtM2" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtM2" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0-100" ForeColor="Red" /></td></tr>
 <tr><td>Subject 3</td><td><asp:TextBox ID="txtM3" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtM3" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0-100" ForeColor="Red" /></td></tr>
 <tr><td>Subject 4</td><td><asp:TextBox ID="txtM4" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtM4" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0-100" ForeColor="Red" /></td></tr>
 <tr><td>Subject 5</td><td><asp:TextBox ID="txtM5" runat="server"></asp:TextBox></td>
  <td><asp:RangeValidator runat="server" ControlToValidate="txtM5" MinimumValue="0" MaximumValue="100" Type="Integer" ErrorMessage="0-100" ForeColor="Red" /></td></tr>
 <tr><td></td><td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td></tr>
</table>
</form>
</body>
</html>
