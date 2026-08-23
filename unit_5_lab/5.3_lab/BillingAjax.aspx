<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void lstItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        imgItem.ImageUrl = "images/" + lstItems.SelectedItem.Text.Replace(" ", "") + ".jpg";
        imgItem.Visible = true;
        lblPrice.Text = "Price : Rs. " + lstItems.SelectedValue;
        lblCost.Text = "";
    }

    protected void btnCalc_Click(object sender, EventArgs e)
    {
        int qty;
        if (lstItems.SelectedIndex < 0) { lblCost.Text = "Select an item first."; return; }
        if (!int.TryParse(txtQty.Text, out qty) || qty <= 0)
        { lblCost.Text = "Enter valid quantity."; return; }

        double cost = double.Parse(lstItems.SelectedValue) * qty;
        lblCost.Text = "Total Cost = Rs. " + cost.ToString("0.00");
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Billing with AJAX</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server" />
 <h2>Hardware Store Billing (AJAX)</h2>
 <asp:UpdatePanel ID="upBill" runat="server">
  <ContentTemplate>
   <table><tr>
    <td valign="top">
      <asp:ListBox ID="lstItems" runat="server" Rows="6" Width="180" AutoPostBack="true"
          OnSelectedIndexChanged="lstItems_SelectedIndexChanged">
        <asp:ListItem Text="Hammer" Value="250" />
        <asp:ListItem Text="Screw Driver" Value="120" />
        <asp:ListItem Text="Drill Machine" Value="3200" />
        <asp:ListItem Text="Paint Brush" Value="80" />
        <asp:ListItem Text="Wrench" Value="450" />
      </asp:ListBox>
    </td>
    <td valign="top" style="padding-left:25px">
      <asp:Image ID="imgItem" runat="server" Width="150" Height="150" Visible="false" /><br />
      <asp:Label ID="lblPrice" runat="server" Font-Bold="true"></asp:Label><br /><br />
      Quantity : <asp:TextBox ID="txtQty" runat="server" Width="60"></asp:TextBox>
      <asp:Button ID="btnCalc" runat="server" Text="Calculate" OnClick="btnCalc_Click" /><br /><br />
      <asp:Label ID="lblCost" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
    </td>
   </tr></table>
  </ContentTemplate>
 </asp:UpdatePanel>
 <asp:UpdateProgress ID="up1" runat="server" AssociatedUpdatePanelID="upBill">
   <ProgressTemplate>Loading...</ProgressTemplate>
 </asp:UpdateProgress>
</form>
</body>
</html>
