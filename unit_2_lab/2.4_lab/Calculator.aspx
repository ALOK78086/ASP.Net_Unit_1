<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        lblResult.ForeColor = System.Drawing.Color.Red;
        double n1, n2;
        if (!double.TryParse(txtN1.Text, out n1) || !double.TryParse(txtN2.Text, out n2))
        { lblResult.Text = "Please enter valid numeric values."; return; }

        double res = 0;
        switch (ddlOp.SelectedValue)
        {
            case "+": res = n1 + n2; break;
            case "-": res = n1 - n2; break;
            case "*": res = n1 * n2; break;
            case "/":
                if (n2 == 0) { lblResult.Text = "Division by zero is not allowed."; return; }
                res = n1 / n2; break;
            case "%":
                if (n2 == 0) { lblResult.Text = "Modulus by zero is not allowed."; return; }
                res = n1 % n2; break;
        }
        lblResult.ForeColor = System.Drawing.Color.Green;
        lblResult.Text = "Result = " + res.ToString();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    { txtN1.Text = ""; txtN2.Text = ""; lblResult.Text = ""; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Simple Calculator</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Simple Calculator</h2>
<table>
 <tr><td>First Number</td><td><asp:TextBox ID="txtN1" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtN1" ErrorMessage="Required" ForeColor="Red" /></td></tr>
 <tr><td>Operation</td><td><asp:DropDownList ID="ddlOp" runat="server">
    <asp:ListItem>+</asp:ListItem><asp:ListItem>-</asp:ListItem><asp:ListItem>*</asp:ListItem>
    <asp:ListItem>/</asp:ListItem><asp:ListItem>%</asp:ListItem></asp:DropDownList></td><td></td></tr>
 <tr><td>Second Number</td><td><asp:TextBox ID="txtN2" runat="server"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txtN2" ErrorMessage="Required" ForeColor="Red" /></td></tr>
 <tr><td></td><td><asp:Button ID="btnCalc" runat="server" Text="Calculate" OnClick="btnCalc_Click" />
  <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" /></td></tr>
</table>
<h3><asp:Label ID="lblResult" runat="server"></asp:Label></h3>
</form>
</body>
</html>
