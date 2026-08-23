<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        lblCollege.Text = ConfigurationManager.AppSettings["CollegeName"];
        lblSize.Text = ConfigurationManager.AppSettings["PageSize"];
        lblConn.Text = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Web.config Demo</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Reading values from Web.config</h2>
 College Name : <asp:Label ID="lblCollege" runat="server"></asp:Label><br />
 Page Size : <asp:Label ID="lblSize" runat="server"></asp:Label><br />
 Connection String : <asp:Label ID="lblConn" runat="server"></asp:Label>
</form>
</body>
</html>
