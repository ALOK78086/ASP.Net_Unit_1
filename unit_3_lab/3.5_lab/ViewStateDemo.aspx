<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnCount_Click(object sender, EventArgs e)
    {
        // ViewState keeps the value between postbacks of the SAME page
        int count = (ViewState["Count"] == null) ? 0 : (int)ViewState["Count"];
        count++;
        ViewState["Count"] = count;
        lblCount.Text = "Button clicked " + count + " time(s).";
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        // QueryString passes the values to another page through the URL
        Response.Redirect("QueryStringDemo.aspx?name=" + Server.UrlEncode(txtName.Text)
                          + "&city=" + Server.UrlEncode(txtCity.Text));
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>ViewState &amp; QueryString</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>State Management : ViewState and QueryString</h2>
 <h3>ViewState</h3>
 <asp:Button ID="btnCount" runat="server" Text="Click Me" OnClick="btnCount_Click" />
 <asp:Label ID="lblCount" runat="server" ForeColor="Blue"></asp:Label>
 <h3>QueryString</h3>
 Name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
 City : <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
 <asp:Button ID="btnSend" runat="server" Text="Send to next page" OnClick="btnSend_Click" />
</form>
</body>
</html>
