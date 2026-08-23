<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
    string cs { get { return ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString; } }

    protected void Page_Load(object sender, EventArgs e)
    {
        // only a logged in admin can use this page
        if (Session["User"] == null) Response.Redirect("Login.aspx");
        if (!IsPostBack) BindGrid();
    }

    // Bound control : GridView bound with DataAdapter + DataSet
    void BindGrid()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tblMarks", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gvMarks.DataSource = ds;
            gvMarks.DataBind();
        }
    }

    void Calculate(out int total, out double per, out string grade, out string result)
    {
        int[] m = { int.Parse(txtM1.Text), int.Parse(txtM2.Text), int.Parse(txtM3.Text),
                    int.Parse(txtM4.Text), int.Parse(txtM5.Text) };
        total = 0; foreach (int x in m) total += x;
        per = total / 5.0;
        result = Array.TrueForAll(m, delegate(int v) { return v >= 33; }) ? "Pass" : "Fail";
        grade = result == "Fail" ? "F" : per >= 75 ? "A+" : per >= 60 ? "A" : per >= 50 ? "B" : "C";
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            int total; double per; string grade, result;
            Calculate(out total, out per, out grade, out result);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                  "INSERT INTO tblMarks(RollNo,Name,Course,Semester,Email,Mobile,M1,M2,M3,M4,M5,Total,Per,Grade,Result) " +
                  "VALUES(@r,@n,@c,@s,@e,@mo,@m1,@m2,@m3,@m4,@m5,@t,@p,@g,@res)", con);
                Fill(cmd, total, per, grade, result);
                cmd.ExecuteNonQuery();
            }
            Msg("Record added successfully.", true); BindGrid();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int total; double per; string grade, result;
            Calculate(out total, out per, out grade, out result);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                  "UPDATE tblMarks SET Name=@n,Course=@c,Semester=@s,Email=@e,Mobile=@mo," +
                  "M1=@m1,M2=@m2,M3=@m3,M4=@m4,M5=@m5,Total=@t,Per=@p,Grade=@g,Result=@res " +
                  "WHERE RollNo=@r", con);
                Fill(cmd, total, per, grade, result);
                int n = cmd.ExecuteNonQuery();
                Msg(n > 0 ? "Record updated." : "Roll No not found.", n > 0);
            }
            BindGrid();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM tblMarks WHERE RollNo=@r", con);
                cmd.Parameters.AddWithValue("@r", txtRoll.Text.Trim());
                int n = cmd.ExecuteNonQuery();
                Msg(n > 0 ? "Record deleted." : "Roll No not found.", n > 0);
            }
            BindGrid();
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
    }

    // Unbound controls : text boxes filled manually from DataReader
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblMarks WHERE RollNo=@r", con);
                cmd.Parameters.AddWithValue("@r", txtRoll.Text.Trim());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtCourse.Text = dr["Course"].ToString();
                    txtSem.Text = dr["Semester"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtM1.Text = dr["M1"].ToString(); txtM2.Text = dr["M2"].ToString();
                    txtM3.Text = dr["M3"].ToString(); txtM4.Text = dr["M4"].ToString();
                    txtM5.Text = dr["M5"].ToString();
                    Msg("Record found. Total : " + dr["Total"] + " , Grade : " + dr["Grade"] +
                        " , Result : " + dr["Result"], true);
                }
                else Msg("No record found.", false);
                dr.Close();
            }
        }
        catch (Exception ex) { Msg("Error : " + ex.Message, false); }
    }

    void Fill(SqlCommand cmd, int total, double per, string grade, string result)
    {
        cmd.Parameters.AddWithValue("@r", txtRoll.Text.Trim());
        cmd.Parameters.AddWithValue("@n", txtName.Text.Trim());
        cmd.Parameters.AddWithValue("@c", txtCourse.Text.Trim());
        cmd.Parameters.AddWithValue("@s", txtSem.Text.Trim());
        cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@mo", txtMobile.Text.Trim());
        cmd.Parameters.AddWithValue("@m1", txtM1.Text); cmd.Parameters.AddWithValue("@m2", txtM2.Text);
        cmd.Parameters.AddWithValue("@m3", txtM3.Text); cmd.Parameters.AddWithValue("@m4", txtM4.Text);
        cmd.Parameters.AddWithValue("@m5", txtM5.Text);
        cmd.Parameters.AddWithValue("@t", total);
        cmd.Parameters.AddWithValue("@p", per);
        cmd.Parameters.AddWithValue("@g", grade);
        cmd.Parameters.AddWithValue("@res", result);
    }

    void Msg(string m, bool ok)
    { lblMsg.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.Red; lblMsg.Text = m; }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Admin - Student Mark Sheet</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
<h2>Student Mark Sheet (Admin Panel)</h2>
<table>
 <tr><td>Roll No</td><td><asp:TextBox ID="txtRoll" runat="server"></asp:TextBox></td>
     <td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
 <tr><td>Course</td><td><asp:TextBox ID="txtCourse" runat="server"></asp:TextBox></td>
     <td>Semester</td><td><asp:TextBox ID="txtSem" runat="server"></asp:TextBox></td></tr>
 <tr><td>Email</td><td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
     <td>Mobile</td><td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td></tr>
 <tr><td>Sub 1</td><td><asp:TextBox ID="txtM1" runat="server"></asp:TextBox></td>
     <td>Sub 2</td><td><asp:TextBox ID="txtM2" runat="server"></asp:TextBox></td></tr>
 <tr><td>Sub 3</td><td><asp:TextBox ID="txtM3" runat="server"></asp:TextBox></td>
     <td>Sub 4</td><td><asp:TextBox ID="txtM4" runat="server"></asp:TextBox></td></tr>
 <tr><td>Sub 5</td><td><asp:TextBox ID="txtM5" runat="server"></asp:TextBox></td><td></td><td></td></tr>
</table>
<br />
<asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
<asp:Button ID="btnUpdate" runat="server" Text="Update / Modify" OnClick="btnUpdate_Click" />
<asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
<br /><br />
<asp:Label ID="lblMsg" runat="server"></asp:Label><br /><br />
<asp:GridView ID="gvMarks" runat="server" CellPadding="5" HeaderStyle-BackColor="#2c3e50"
     HeaderStyle-ForeColor="White"></asp:GridView>
</form>
</body>
</html>
