<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    // After adding the web reference, Visual Studio creates the proxy class.
    // Here the service is used through the generated proxy "MathService".
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        try
        {
            localhost.MathService svc = new localhost.MathService();   // proxy object
            double a = double.Parse(txtA.Text), b = double.Parse(txtB.Text);
            double res = 0;
            switch (ddlOp.SelectedValue)
            {
                case "Add": res = svc.Add(a, b); break;
                case "Sub": res = svc.Sub(a, b); break;
                case "Mul": res = svc.Mul(a, b); break;
                case "Div": res = svc.Div(a, b); break;
            }
            lblRes.ForeColor = System.Drawing.Color.Green;
            lblRes.Text = "Result from Web Service = " + res;
        }
        catch (Exception ex)
        { lblRes.ForeColor = System.Drawing.Color.Red; lblRes.Text = "Error : " + ex.Message; }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Consume Web Service</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Web Service Demo (MathService.asmx)</h2>
 <p>Steps : Right click project &rarr; Add Service Reference / Web Reference &rarr;
    give the url <b>http://localhost/MathService.asmx</b> &rarr; name it <b>localhost</b>.</p>
 <asp:TextBox ID="txtA" runat="server"></asp:TextBox>
 <asp:DropDownList ID="ddlOp" runat="server">
   <asp:ListItem>Add</asp:ListItem><asp:ListItem>Sub</asp:ListItem>
   <asp:ListItem>Mul</asp:ListItem><asp:ListItem>Div</asp:ListItem>
 </asp:DropDownList>
 <asp:TextBox ID="txtB" runat="server"></asp:TextBox>
 <asp:Button ID="btnCalc" runat="server" Text="Call Service" OnClick="btnCalc_Click" />
 <br /><br /><asp:Label ID="lblRes" runat="server" Font-Bold="true"></asp:Label>
</form>
</body>
</html>
