<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["name"] != null)
        {
            lblOut.Text = "Name : " + Request.QueryString["name"] +
                          "<br/>City : " + Request.QueryString["city"];
        }
        else lblOut.Text = "No data received in query string.";
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>QueryString Receiver</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Data received through QueryString</h2>
 <asp:Label ID="lblOut" runat="server"></asp:Label><br /><br />
 <asp:HyperLink runat="server" NavigateUrl="ViewStateDemo.aspx">Back</asp:HyperLink>
</form>
</body>
</html>
