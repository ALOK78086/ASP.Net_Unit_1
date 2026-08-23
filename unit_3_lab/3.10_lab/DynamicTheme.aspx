<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    // Theme must be applied in the PreInit event of the page
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["MyTheme"] != null)
            Page.Theme = Session["MyTheme"].ToString();
        else
            Page.Theme = "BlueTheme";
    }

    protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["MyTheme"] = ddlTheme.SelectedValue;
        Response.Redirect(Request.Url.AbsolutePath);   // reload so PreInit runs again
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["MyTheme"] != null)
            ddlTheme.SelectedValue = Session["MyTheme"].ToString();
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Change Theme at Runtime</title></head>
<body>
<form id="form1" runat="server">
 <h2>Apply Theme as per User Selection</h2>
 <asp:Label ID="lblSelect" runat="server" Text="Select Theme :"></asp:Label>
 <asp:DropDownList ID="ddlTheme" runat="server" AutoPostBack="true"
      OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged">
   <asp:ListItem Value="BlueTheme">Blue Theme</asp:ListItem>
   <asp:ListItem Value="GreenTheme">Green Theme</asp:ListItem>
 </asp:DropDownList>
 <br /><br />
 <asp:Label ID="lblName" runat="server" Text="Your Name :"></asp:Label>
 <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
 <asp:Button ID="btnOk" runat="server" Text="Submit" />
</form>
</body>
</html>
