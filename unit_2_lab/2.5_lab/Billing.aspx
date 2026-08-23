<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    // Hardware store items : name -> price and image
    protected void lstItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        string item = lstItems.SelectedValue;   // value holds the price
        imgItem.ImageUrl = "images/" + lstItems.SelectedItem.Text.Replace(" ", "") + ".jpg";
        imgItem.Visible = true;
        lblPrice.Text = "Price : Rs. " + item;
        lblCost.Text = "";
    }

    protected void btnCalc_Click(object sender, EventArgs e)
    {
        if (lstItems.SelectedIndex < 0) { lblCost.Text = "Please select an item."; return; }
        int qty;
        if (!int.TryParse(txtQty.Text, out qty) || qty <= 0)
        { lblCost.Text = "Enter a valid quantity."; return; }

        double price = double.Parse(lstItems.SelectedValue);
        double cost = price * qty;
        lblCost.Text = "Total Cost of " + lstItems.SelectedItem.Text + " = Rs. " + cost.ToString("0.00");
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Hardware Store Billing</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Hardware Store - Billing</h2>
<table>
 <tr>
  <td valign="top">
    <asp:Label runat="server" Text="Items :"></asp:Label><br />
    <asp:ListBox ID="lstItems" runat="server" Rows="6" Width="180"
        AutoPostBack="true" OnSelectedIndexChanged="lstItems_SelectedIndexChanged">
      <asp:ListItem Text="Hammer" Value="250" />
      <asp:ListItem Text="Screw Driver" Value="120" />
      <asp:ListItem Text="Drill Machine" Value="3200" />
      <asp:ListItem Text="Paint Brush" Value="80" />
      <asp:ListItem Text="Wrench" Value="450" />
    </asp:ListBox>
  </td>
  <td valign="top" style="padding-left:25px">
    <asp:Image ID="imgItem" runat="server" Width="160" Height="160" Visible="false" /><br />
    <asp:Label ID="lblPrice" runat="server" Font-Bold="true"></asp:Label><br /><br />
    Quantity : <asp:TextBox ID="txtQty" runat="server" Width="60"></asp:TextBox>
    <asp:Button ID="btnCalc" runat="server" Text="Calculate Cost" OnClick="btnCalc_Click" />
    <br /><br />
    <asp:Label ID="lblCost" runat="server" Font-Bold="true" ForeColor="Green"></asp:Label>
  </td>
 </tr>
</table>
</form>
</body>
</html>
