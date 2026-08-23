<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>Registration Form</title>
<style>
 body{font-family:Segoe UI;background:#f4f6f9;}
 .card{width:520px;margin:40px auto;background:#fff;padding:25px;border-radius:8px;box-shadow:0 2px 10px #ccc;}
 table td{padding:6px;}
 .btn{background:#28a745;color:#fff;border:0;padding:8px 18px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="card">
<h2>Registration Form</h2>
<table>
 <tr><td>First Name</td><td><asp:TextBox ID="txtFirst" runat="server"></asp:TextBox></td></tr>
 <tr><td>Last Name</td><td><asp:TextBox ID="txtLast" runat="server"></asp:TextBox></td></tr>
 <tr><td>Email ID</td><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox></td></tr>
 <tr><td>Password</td><td><asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox></td></tr>
 <tr><td>Confirm Password</td><td><asp:TextBox ID="txtCPwd" runat="server" TextMode="Password"></asp:TextBox></td></tr>
 <tr><td>Gender</td><td>
   <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
     <asp:ListItem Text="Male" Value="M" />
     <asp:ListItem Text="Female" Value="F" />
   </asp:RadioButtonList></td></tr>
 <tr><td>Date of Birth</td><td><asp:TextBox ID="txtDob" runat="server" TextMode="Date"></asp:TextBox></td></tr>
 <tr><td>Country</td><td>
   <asp:DropDownList ID="ddlCountry" runat="server">
     <asp:ListItem>--Select--</asp:ListItem>
     <asp:ListItem>India</asp:ListItem>
     <asp:ListItem>USA</asp:ListItem>
     <asp:ListItem>UK</asp:ListItem>
   </asp:DropDownList></td></tr>
 <tr><td>Hobbies</td><td>
   <asp:CheckBoxList ID="cblHobby" runat="server" RepeatDirection="Horizontal">
     <asp:ListItem>Reading</asp:ListItem>
     <asp:ListItem>Music</asp:ListItem>
     <asp:ListItem>Sports</asp:ListItem>
   </asp:CheckBoxList></td></tr>
 <tr><td>Address</td><td><asp:TextBox ID="txtAddr" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox></td></tr>
 <tr><td></td><td>
   <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn" />
   <asp:Button ID="btnReset" runat="server" Text="Reset" /></td></tr>
</table>
</div>
</form>
</body>
</html>
