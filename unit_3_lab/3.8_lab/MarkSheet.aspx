<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtRoll.Text.Trim() == "") throw new ArgumentNullException("Roll No", "Roll no is required.");
            if (txtName.Text.Trim() == "") throw new ArgumentNullException("Name", "Name is required.");

            int[] m = new int[5];
            string[] input = { txtM1.Text, txtM2.Text, txtM3.Text, txtM4.Text, txtM5.Text };
            for (int i = 0; i < 5; i++)
            {
                m[i] = Convert.ToInt32(input[i]);              // may throw FormatException
                if (m[i] < 0 || m[i] > 100)
                    throw new IndexOutOfRangeException("Marks of subject " + (i + 1) + " must be between 0 and 100.");
            }

            int total = 0;
            foreach (int x in m) total += x;
            double per = total / 5.0;
            string result = (Array.TrueForAll(m, delegate(int v) { return v >= 33; })) ? "Pass" : "Fail";
            string grade = result == "Fail" ? "F" : per >= 75 ? "A+" : per >= 60 ? "A" : per >= 50 ? "B" : "C";

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = string.Format("Roll No : {0} | Name : {1} | Total : {2} | Percentage : {3:0.00}% | Grade : {4} | Result : {5}",
                          txtRoll.Text, txtName.Text, total, per, grade, result);
        }
        catch (ArgumentNullException an)
        { ShowError("Missing Data : " + an.Message); }
        catch (FormatException)
        { ShowError("Marks must be numeric values only."); }
        catch (OverflowException)
        { ShowError("Entered marks value is too large."); }
        catch (IndexOutOfRangeException ir)
        { ShowError("Range Error : " + ir.Message); }
        catch (Exception ex)
        { ShowError("Error : " + ex.Message); }
    }

    void ShowError(string msg)
    { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = msg; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Mark Sheet with Exception Handling</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Mark Sheet (Exception Handling)</h2>
<table>
 <tr><td>Roll No</td><td><asp:TextBox ID="txtRoll" runat="server"></asp:TextBox></td></tr>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
 <tr><td>Subject 1</td><td><asp:TextBox ID="txtM1" runat="server"></asp:TextBox></td></tr>
 <tr><td>Subject 2</td><td><asp:TextBox ID="txtM2" runat="server"></asp:TextBox></td></tr>
 <tr><td>Subject 3</td><td><asp:TextBox ID="txtM3" runat="server"></asp:TextBox></td></tr>
 <tr><td>Subject 4</td><td><asp:TextBox ID="txtM4" runat="server"></asp:TextBox></td></tr>
 <tr><td>Subject 5</td><td><asp:TextBox ID="txtM5" runat="server"></asp:TextBox></td></tr>
 <tr><td></td><td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td></tr>
</table>
<h3><asp:Label ID="lblMsg" runat="server"></asp:Label></h3>
</form>
</body>
</html>
