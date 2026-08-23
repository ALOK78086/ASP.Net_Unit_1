<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>Login Screen</title>
<style>
 body{font-family:Segoe UI;background:#eef2f7;}
 .box{width:340px;margin:80px auto;background:#fff;padding:25px;border-radius:8px;box-shadow:0 2px 10px #ccc;}
 .box h2{text-align:center;color:#2c3e50;}
 .box input[type=text],.box input[type=password]{width:100%;padding:8px;margin:6px 0 12px 0;}
 .btn{background:#2c7be5;color:#fff;border:0;padding:8px 18px;cursor:pointer;}
</style>
</head>
<body>
<form id="form1" runat="server">
 <div class="box">
  <h2>User Login</h2>
  <asp:Label ID="lblUser" runat="server" Text="User ID :"></asp:Label>
  <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
  <asp:Label ID="lblPass" runat="server" Text="Password :"></asp:Label>
  <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
  <asp:CheckBox ID="chkRemember" runat="server" Text=" Remember me" /><br /><br />
  <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" />
  <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" />
  <br /><br />
  <asp:HyperLink ID="lnkForgot" runat="server" NavigateUrl="#">Forgot Password ?</asp:HyperLink>
  <br />
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
 </div>
</form>
</body>
</html>
