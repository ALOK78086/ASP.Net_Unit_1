<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataFetch.aspx.cs" Inherits="DataFetch.DataFetch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
   <form id="form1" runat="server">

        <div style="width:400px;margin:100px auto;border:1px solid gray;padding:20px;text-align:center;">

            <h2>Login Page</h2>

            Username:
            <br />
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <br /><br />

            Password:
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnLogin" runat="server"
                Text="Login"
                OnClick="btnLogin_Click" />

            <br /><br />

            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>

        </div>

    

    </form>
</body>
</html>
