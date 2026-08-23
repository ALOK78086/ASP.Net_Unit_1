<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Roll"] == null) { Response.Redirect("MarkSheetEntry.aspx"); return; }
        lblRoll.Text = Session["Roll"].ToString();
        lblName.Text = Session["Name"].ToString();
        lblTotal.Text = Session["Total"].ToString();
        lblPer.Text = Session["Per"].ToString() + " %";
        lblGrade.Text = Session["Grade"].ToString();
        lblResult.Text = Session["Result"].ToString();
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Mark Sheet Result</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Result</h2>
<table border="1" cellpadding="6" cellspacing="0">
 <tr><td>Roll No</td><td><asp:Label ID="lblRoll" runat="server"></asp:Label></td></tr>
 <tr><td>Name</td><td><asp:Label ID="lblName" runat="server"></asp:Label></td></tr>
 <tr><td>Total Marks</td><td><asp:Label ID="lblTotal" runat="server"></asp:Label></td></tr>
 <tr><td>Percentage</td><td><asp:Label ID="lblPer" runat="server"></asp:Label></td></tr>
 <tr><td>Grade</td><td><asp:Label ID="lblGrade" runat="server"></asp:Label></td></tr>
 <tr><td>Result</td><td><asp:Label ID="lblResult" runat="server"></asp:Label></td></tr>
</table>
<br />
<asp:HyperLink runat="server" NavigateUrl="MarkSheetEntry.aspx">Back</asp:HyperLink>
</form>
</body>
</html>
