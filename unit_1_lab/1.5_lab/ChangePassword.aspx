<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>Change Password</title>
<style>
 body{font-family:Segoe UI;background:#eef2f7;}
 .box{width:380px;margin:70px auto;background:#fff;padding:25px;border-radius:8px;box-shadow:0 2px 10px #ccc;}
 table td{padding:6px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="box">
 <h2>Change Password</h2>
 <table>
  <tr><td>User ID</td><td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td></tr>
  <tr><td>Old Password</td><td><asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox></td></tr>
  <tr><td>New Password</td><td><asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox></td></tr>
  <tr><td>Confirm Password</td><td><asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox></td></tr>
  <tr><td></td><td>
    <asp:Button ID="btnChange" runat="server" Text="Change" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /></td></tr>
 </table>
 <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>
</div>
</form>
</body>
</html>
