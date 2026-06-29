<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowText.aspx.cs" Inherits="ShowText.ShowText" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">

        <div style="width:400px;margin:100px auto;border:1px solid gray;padding:20px;text-align:center;">

            <h2>Login Form</h2>

            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <br /><br />

            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnLogin" runat="server"
                Text="Login"
                OnClick="btnLogin_Click" />

            <br /><br />

            <asp:Label ID="lblResult" runat="server"
                Font-Bold="true"
                ForeColor="Blue"></asp:Label>

        </div>

    </form>
</body>
</html>
