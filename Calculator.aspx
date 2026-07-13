<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="Calculator.Calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div style="width:400px;margin:100px auto;text-align:center;border:1px solid black;padding:20px;">

            <h2>Simple Calculator</h2>

            Enter First Number:
            <br />
            <asp:TextBox ID="txtNum1" runat="server"></asp:TextBox>

            <br /><br />

            Enter Second Number:
            <br />
            <asp:TextBox ID="txtNum2" runat="server"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnAdd" runat="server"
                Text="Addition"
                OnClick="btnAdd_Click" />

            <asp:Button ID="btnSub" runat="server"
                Text="Subtraction"
                OnClick="btnSub_Click" />

            <br /><br />

            <asp:Button ID="btnMul" runat="server"
                Text="Multiply"
                OnClick="btnMul_Click" />

            <asp:Button ID="btnDiv" runat="server"
                Text="Division"
                OnClick="btnDiv_Click" />

            <br /><br />

            <asp:Label ID="lblResult" runat="server"
                Font-Size="Large"
                ForeColor="Blue"></asp:Label>

        </div>

    </form>
</body>
</html>
