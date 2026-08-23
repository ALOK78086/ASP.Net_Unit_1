<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnCalc_Click(object sender, EventArgs e)
    {
        try
        {
            int[] m = { int.Parse(txtM1.Text), int.Parse(txtM2.Text), int.Parse(txtM3.Text),
                        int.Parse(txtM4.Text), int.Parse(txtM5.Text) };
            int total = 0; foreach (int x in m) total += x;
            double per = total / 5.0;
            string result = Array.TrueForAll(m, delegate(int v) { return v >= 33; }) ? "Pass" : "Fail";
            string grade = result == "Fail" ? "F" : per >= 75 ? "A+" : per >= 60 ? "A" : per >= 50 ? "B" : "C";

            lblResult.ForeColor = System.Drawing.Color.Green;
            lblResult.Text = string.Format("Roll No : {0} | Total : {1} | Per : {2:0.00}% | Grade : {3} | Result : {4}",
                             txtRoll.Text, total, per, grade, result);
        }
        catch (Exception ex)
        { lblResult.ForeColor = System.Drawing.Color.Red; lblResult.Text = "Error : " + ex.Message; }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Mark Sheet with AJAX</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <!-- ScriptManager is compulsory for AJAX -->
 <asp:ScriptManager ID="ScriptManager1" runat="server" />
 <h2>Student Mark Sheet (AJAX - No full page refresh)</h2>

 <asp:UpdatePanel ID="upMarks" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
   <table>
    <tr><td>Roll No</td><td><asp:TextBox ID="txtRoll" runat="server"></asp:TextBox></td></tr>
    <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
    <tr><td>Sub 1</td><td><asp:TextBox ID="txtM1" runat="server"></asp:TextBox></td></tr>
    <tr><td>Sub 2</td><td><asp:TextBox ID="txtM2" runat="server"></asp:TextBox></td></tr>
    <tr><td>Sub 3</td><td><asp:TextBox ID="txtM3" runat="server"></asp:TextBox></td></tr>
    <tr><td>Sub 4</td><td><asp:TextBox ID="txtM4" runat="server"></asp:TextBox></td></tr>
    <tr><td>Sub 5</td><td><asp:TextBox ID="txtM5" runat="server"></asp:TextBox></td></tr>
   </table>
   <asp:Button ID="btnCalc" runat="server" Text="Calculate Result" OnClick="btnCalc_Click" />
   <br /><br />
   <asp:Label ID="lblResult" runat="server" Font-Bold="true"></asp:Label>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="btnCalc" EventName="Click" />
  </Triggers>
 </asp:UpdatePanel>

 <asp:UpdateProgress ID="up1" runat="server" AssociatedUpdatePanelID="upMarks">
   <ProgressTemplate><b>Please wait... calculating</b></ProgressTemplate>
 </asp:UpdateProgress>
</form>
</body>
</html>
