<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>Contact Us</title>
<style>
 body{font-family:Segoe UI;background:#fafafa;}
 .wrap{width:600px;margin:30px auto;background:#fff;padding:25px;border:1px solid #ddd;}
 h2{color:#c0392b;}
 table td{padding:6px;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="wrap">
<h2>Contact Us</h2>
<p>We would love to hear from you. Please fill the form below.</p>
<table>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server" Width="250"></asp:TextBox></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server" Width="250" TextMode="Email"></asp:TextBox></td></tr>
 <tr><td>Mobile No</td><td><asp:TextBox ID="txtMobile" runat="server" Width="250"></asp:TextBox></td></tr>
 <tr><td>Subject</td><td>
   <asp:DropDownList ID="ddlSubject" runat="server">
     <asp:ListItem>General Enquiry</asp:ListItem>
     <asp:ListItem>Feedback</asp:ListItem>
     <asp:ListItem>Complaint</asp:ListItem>
   </asp:DropDownList></td></tr>
 <tr><td>Message</td><td><asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="5" Width="250"></asp:TextBox></td></tr>
 <tr><td></td><td><asp:Button ID="btnSend" runat="server" Text="Send Message" />
   <asp:Button ID="btnClear" runat="server" Text="Clear" /></td></tr>
</table>
<hr />
<b>Address :</b> ABC College, Main Road, City - 000000<br />
<b>Phone :</b> +91-0000000000 &nbsp; <b>Email :</b> info@example.com
</div>
</form>
</body>
</html>
