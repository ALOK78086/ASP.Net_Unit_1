<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowText.aspx.cs" Inherits="ShowTextboxToLable.ShowText" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">

        <div style="width:400px;margin:100px auto;text-align:center;">

            <asp:Label ID="lblDisplay" runat="server"
                Text="Enter Username"
                Font-Size="Large"
                ForeColor="Blue">
            </asp:Label>

            <br /><br />

            <asp:TextBox ID="txtUsername" runat="server"
                Width="250px"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnShow" runat="server"
                Text="Show Username"
                OnClick="btnShow_Click" />

        </div>

    </form>
</body>
</html>
