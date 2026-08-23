<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    SqlConnection con;                                  // Connection object

    void OpenConnection()
    {
        string cs = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
        con = new SqlConnection(cs);
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) BindGrid();
    }

    void BindGrid()
    {
        try
        {
            OpenConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblEmployee", con);   // Command object
            SqlDataReader dr = cmd.ExecuteReader();                              // DataReader
            gvEmp.DataSource = dr;
            gvEmp.DataBind();
            dr.Close();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        finally { if (con != null) con.Close(); }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            OpenConnection();
            SqlCommand cmd = new SqlCommand(
              "INSERT INTO tblEmployee(EmpId,Name,Post,Qualification,Experience,Email,Mobile) " +
              "VALUES(@id,@n,@p,@q,@ex,@e,@m)", con);
            AddParams(cmd);
            cmd.ExecuteNonQuery();
            Msg("Record added successfully.", true);
            BindGrid(); Clear();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        finally { if (con != null) con.Close(); }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            OpenConnection();
            SqlCommand cmd = new SqlCommand(
              "UPDATE tblEmployee SET Name=@n,Post=@p,Qualification=@q,Experience=@ex," +
              "Email=@e,Mobile=@m WHERE EmpId=@id", con);
            AddParams(cmd);
            int n = cmd.ExecuteNonQuery();
            Msg(n > 0 ? "Record updated successfully." : "Employee Id not found.", n > 0);
            BindGrid();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        finally { if (con != null) con.Close(); }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            OpenConnection();
            SqlCommand cmd = new SqlCommand("DELETE FROM tblEmployee WHERE EmpId=@id", con);
            cmd.Parameters.AddWithValue("@id", txtId.Text.Trim());
            int n = cmd.ExecuteNonQuery();
            Msg(n > 0 ? "Record deleted successfully." : "Employee Id not found.", n > 0);
            BindGrid(); Clear();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        finally { if (con != null) con.Close(); }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            OpenConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblEmployee WHERE EmpId=@id", con);
            cmd.Parameters.AddWithValue("@id", txtId.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();      // reading data with DataReader
            if (dr.Read())
            {
                txtName.Text = dr["Name"].ToString();
                ddlPost.SelectedValue = dr["Post"].ToString();
                txtQual.Text = dr["Qualification"].ToString();
                txtExp.Text = dr["Experience"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtMobile.Text = dr["Mobile"].ToString();
                Msg("Record found.", true);
            }
            else { Clear(); Msg("No record found for this Employee Id.", false); }
            dr.Close();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
        finally { if (con != null) con.Close(); }
    }

    void AddParams(SqlCommand cmd)
    {
        cmd.Parameters.AddWithValue("@id", txtId.Text.Trim());
        cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
        cmd.Parameters.AddWithValue("@p", ddlPost.SelectedValue);
        cmd.Parameters.AddWithValue("@q", txtQual.Text.Trim());
        cmd.Parameters.AddWithValue("@ex", txtExp.Text.Trim());
        cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@m", txtMobile.Text.Trim());
    }

    void Clear()
    { txtName.Text = txtQual.Text = txtExp.Text = txtEmail.Text = txtMobile.Text = ""; }

    void Msg(string m, bool ok)
    { lblMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red; lblMsg.Text = m; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Employee Recruitment Form</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Employee Recruitment Form</h2>
<table>
 <tr><td>Employee Id</td><td><asp:TextBox ID="txtId" runat="server"></asp:TextBox></td></tr>
 <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
 <tr><td>Post Applied</td><td><asp:DropDownList ID="ddlPost" runat="server">
    <asp:ListItem>Clerk</asp:ListItem><asp:ListItem>Programmer</asp:ListItem>
    <asp:ListItem>Manager</asp:ListItem></asp:DropDownList></td></tr>
 <tr><td>Qualification</td><td><asp:TextBox ID="txtQual" runat="server"></asp:TextBox></td></tr>
 <tr><td>Experience (Years)</td><td><asp:TextBox ID="txtExp" runat="server"></asp:TextBox></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox></td></tr>
 <tr><td>Mobile</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td></tr>
</table>
<br />
<asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
<asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
<asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
<br /><br />
<asp:Label ID="lblMsg" runat="server"></asp:Label>
<br /><br />
<asp:GridView ID="gvEmp" runat="server" CellPadding="5" HeaderStyle-BackColor="#2c3e50"
     HeaderStyle-ForeColor="White" BorderColor="#ccc"></asp:GridView>
</form>
</body>
</html>
