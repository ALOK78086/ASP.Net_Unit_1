<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // 1. Cookie
        HttpCookie ck = new HttpCookie("UserInfo");
        ck["Name"] = txtName.Text;
        ck.Expires = DateTime.Now.AddDays(1);
        Response.Cookies.Add(ck);

        // 2. Session (per user)
        Session["UserName"] = txtName.Text;

        lblMsg.Text = "Data stored in Cookie and Session.";
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        lblCookie.Text = (Request.Cookies["UserInfo"] != null)
            ? "Cookie Value : " + Request.Cookies["UserInfo"]["Name"] : "No cookie found.";

        lblSession.Text = (Session["UserName"] != null)
            ? "Session Value : " + Session["UserName"].ToString() : "No session found.";

        lblApp.Text = "Total Visitors (Application) : " + Application["VisitorCount"];
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Cookie, Session &amp; Application</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>State Management : Cookie, Session and Application</h2>
 Name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
 <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
 <asp:Button ID="btnShow" runat="server" Text="Show Values" OnClick="btnShow_Click" />
 <br /><br />
 <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label><br />
 <asp:Label ID="lblCookie" runat="server"></asp:Label><br />
 <asp:Label ID="lblSession" runat="server"></asp:Label><br />
 <asp:Label ID="lblApp" runat="server"></asp:Label>
</form>
</body>
</html>
