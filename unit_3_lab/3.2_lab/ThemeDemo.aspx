<%@ Page Language="C#" AutoEventWireup="true" Theme="BlueTheme" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>Theme and Skin Demo</title></head>
<body>
<form id="form1" runat="server">
 <h2>Theme &amp; Skin Demo in ASP.NET</h2>
 <p>The look of the controls below comes from the skin file
    App_Themes/BlueTheme/Blue.skin (no styles are written on the controls).</p>
 <asp:Label ID="lblName" runat="server" Text="Enter Name :"></asp:Label>
 <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
 <asp:Button ID="btnOk" runat="server" Text="Submit" />
</form>
</body>
</html>
