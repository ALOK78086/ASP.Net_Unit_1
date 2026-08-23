<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    string cs { get { return ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString; } }

    protected void Page_Load(object sender, EventArgs e)
    { if (!IsPostBack) BindGrid(); }

    void BindGrid()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tblEmployee", con);
            DataTable dt = new DataTable(); da.Fill(dt);
            gvEmp.DataSource = dt; gvEmp.DataBind();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                  "INSERT INTO tblEmployee(EmpId,Name,Post,Qualification,Experience,Email,Mobile) " +
                  "VALUES(@id,@n,@p,@q,@ex,@e,@m)", con);
                cmd.Parameters.AddWithValue("@id", txtId.Text);
                cmd.Parameters.AddWithValue("@n", txtName.Text);
                cmd.Parameters.AddWithValue("@p", ddlPost.SelectedValue);
                cmd.Parameters.AddWithValue("@q", txtQual.Text);
                cmd.Parameters.AddWithValue("@ex", txtExp.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.Parameters.AddWithValue("@m", txtMobile.Text);
                cmd.ExecuteNonQuery();
            }
            lblMsg.Text = "Record added without page refresh (AJAX).";
            BindGrid();
        }
        catch (Exception ex) { lblMsg.Text = "Error : " + ex.Message; }
    }

    protected void tmrClock_Tick(object sender, EventArgs e)
    { lblTime.Text = DateTime.Now.ToString("hh:mm:ss tt"); }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Employee Recruitment with AJAX</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server" />
 <h2>Employee Recruitment Portal (AJAX)</h2>

 <!-- Timer inside its own UpdatePanel : refreshes only the clock -->
 <asp:UpdatePanel ID="upClock" runat="server">
  <ContentTemplate>
    <asp:Timer ID="tmrClock" runat="server" Interval="1000" OnTick="tmrClock_Tick" />
    Server Time : <asp:Label ID="lblTime" runat="server"></asp:Label>
  </ContentTemplate>
 </asp:UpdatePanel>
 <hr />

 <asp:UpdatePanel ID="upEmp" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
   <table>
    <tr><td>Emp Id</td><td><asp:TextBox ID="txtId" runat="server"></asp:TextBox></td></tr>
    <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
    <tr><td>Post</td><td><asp:DropDownList ID="ddlPost" runat="server">
        <asp:ListItem>Clerk</asp:ListItem><asp:ListItem>Programmer</asp:ListItem>
        <asp:ListItem>Manager</asp:ListItem></asp:DropDownList></td></tr>
    <tr><td>Qualification</td><td><asp:TextBox ID="txtQual" runat="server"></asp:TextBox></td></tr>
    <tr><td>Experience</td><td><asp:TextBox ID="txtExp" runat="server"></asp:TextBox></td></tr>
    <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td></tr>
    <tr><td>Mobile</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td></tr>
   </table>
   <asp:Button ID="btnAdd" runat="server" Text="Add Employee" OnClick="btnAdd_Click" />
   <br /><asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label><br />
   <asp:GridView ID="gvEmp" runat="server" CellPadding="5"></asp:GridView>
  </ContentTemplate>
  <Triggers><asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" /></Triggers>
 </asp:UpdatePanel>
</form>
</body>
</html>
