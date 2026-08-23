<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server"><title>My Blog</title>
<style>
 body{font-family:Segoe UI;margin:0;background:#f0f2f5;}
 .header{background:#34495e;color:#fff;padding:18px;text-align:center;}
 .container{width:900px;margin:20px auto;display:flex;gap:20px;}
 .posts{flex:3;}
 .side{flex:1;background:#fff;padding:15px;height:fit-content;}
 .post{background:#fff;padding:18px;margin-bottom:18px;border-left:4px solid #34495e;}
 .meta{color:#888;font-size:12px;}
</style>
</head>
<body>
<form id="form1" runat="server">
 <div class="header"><h1>My Technical Blog</h1></div>
 <div class="container">
  <div class="posts">
    <div class="post">
      <h3>Introduction to ASP.NET</h3>
      <div class="meta">Posted by Admin | 01-Jan-2025 | 5 Comments</div>
      <p>ASP.NET is a web application framework developed by Microsoft to build dynamic web sites...</p>
      <asp:LinkButton ID="lnkRead1" runat="server">Read More</asp:LinkButton>
    </div>
    <div class="post">
      <h3>Understanding Web Forms</h3>
      <div class="meta">Posted by Admin | 10-Jan-2025 | 2 Comments</div>
      <p>Web Forms provide an event driven programming model for building web pages...</p>
      <asp:LinkButton ID="lnkRead2" runat="server">Read More</asp:LinkButton>
    </div>
  </div>
  <div class="side">
    <h4>Search</h4>
    <asp:TextBox ID="txtSearch" runat="server" Width="100%"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Go" />
    <h4>Categories</h4>
    <asp:BulletedList ID="blCat" runat="server">
      <asp:ListItem>ASP.NET</asp:ListItem>
      <asp:ListItem>C#</asp:ListItem>
      <asp:ListItem>Database</asp:ListItem>
    </asp:BulletedList>
    <h4>Subscribe</h4>
    <asp:TextBox ID="txtMail" runat="server" Width="100%" TextMode="Email"></asp:TextBox>
    <asp:Button ID="btnSub" runat="server" Text="Subscribe" />
  </div>
 </div>
</form>
</body>
</html>
