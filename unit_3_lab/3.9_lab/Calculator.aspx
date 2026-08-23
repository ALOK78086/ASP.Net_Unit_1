<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        try
        {
            double n1 = Convert.ToDouble(txtN1.Text);   // FormatException
            double n2 = Convert.ToDouble(txtN2.Text);
            double res = 0;

            switch (ddlOp.SelectedValue)
            {
                case "+": res = n1 + n2; break;
                case "-": res = n1 - n2; break;
                case "*": res = n1 * n2; break;
                case "/":
                    if (n2 == 0) throw new DivideByZeroException();
                    res = n1 / n2; break;
                case "%":
                    if (n2 == 0) throw new DivideByZeroException();
                    res = n1 % n2; break;
                default: throw new InvalidOperationException("Unknown operator selected.");
            }
            lblRes.ForeColor = System.Drawing.Color.Green;
            lblRes.Text = "Result = " + res;
        }
        catch (FormatException)
        { Err("Please enter numeric values only."); }
        catch (DivideByZeroException)
        { Err("Division by zero is not allowed."); }
        catch (OverflowException)
        { Err("The value entered is out of range."); }
        catch (InvalidOperationException io)
        { Err(io.Message); }
        catch (Exception ex)
        { Err("Unexpected error : " + ex.Message); }
        finally
        { lblInfo.Text = "Calculation attempted at " + DateTime.Now.ToString("hh:mm:ss tt"); }
    }
    void Err(string m) { lblRes.ForeColor = System.Drawing.Color.Red; lblRes.Text = m; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Calculator with Exception Handling</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Calculator (Exception Handling)</h2>
 <asp:TextBox ID="txtN1" runat="server"></asp:TextBox>
 <asp:DropDownList ID="ddlOp" runat="server">
   <asp:ListItem>+</asp:ListItem><asp:ListItem>-</asp:ListItem><asp:ListItem>*</asp:ListItem>
   <asp:ListItem>/</asp:ListItem><asp:ListItem>%</asp:ListItem>
 </asp:DropDownList>
 <asp:TextBox ID="txtN2" runat="server"></asp:TextBox>
 <asp:Button ID="btnCalc" runat="server" Text="=" OnClick="btnCalc_Click" />
 <br /><br />
 <asp:Label ID="lblRes" runat="server" Font-Bold="true"></asp:Label><br />
 <asp:Label ID="lblInfo" runat="server" ForeColor="Gray"></asp:Label>
</form>
</body>
</html>
