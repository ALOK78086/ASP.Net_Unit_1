<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
 <title>CSS Demo in ASP.NET</title>
 <!-- External style sheet -->
 <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
 <!-- Internal (embedded) style sheet -->
 <style type="text/css">
   .note { color: #8e44ad; font-style: italic; }
 </style>
</head>
<body>
<form id="form1" runat="server">
 <div class="header"><h1>Cascading Style Sheet Demo</h1></div>
 <div class="content">
   <h2>Types of CSS</h2>
   <p class="note">1. Inline CSS &nbsp; 2. Internal CSS &nbsp; 3. External CSS</p>
   <!-- Inline style -->
   <p style="color:#e67e22; font-weight:bold;">This paragraph uses INLINE css.</p>
   <asp:TextBox ID="txtName" runat="server" CssClass="mytext" placeholder="Enter your name"></asp:TextBox>
   <asp:Button ID="btnOk" runat="server" Text="Submit" CssClass="mybutton" />
 </div>
</form>
</body>
</html>
