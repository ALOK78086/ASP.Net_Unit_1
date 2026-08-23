<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    // This page consumes data of another web portal through its web service (REST API).
    protected void btnGet_Click(object sender, EventArgs e)
    {
        try
        {
            string city = txtCity.Text.Trim();
            if (city == "") { lblMsg.Text = "Please enter a city name."; return; }

            // URL of the external web service
            string url = "https://api.openweathermap.org/data/2.5/weather?q="
                         + Server.UrlEncode(city) + "&units=metric&appid=YOUR_API_KEY";

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            req.Method = "GET";

            using (HttpWebResponse res = (HttpWebResponse)req.GetResponse())
            using (StreamReader sr = new StreamReader(res.GetResponseStream()))
            {
                string json = sr.ReadToEnd();
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Data received from external web portal :";
                txtOutput.Text = json;
            }
        }
        catch (WebException we)
        { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = "Service Error : " + we.Message; }
        catch (Exception ex)
        { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = "Error : " + ex.Message; }
    }

    // Second example : reading data of another portal published as a DataSet / XML
    protected void btnXml_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            ds.ReadXml("https://www.w3schools.com/xml/cd_catalog.xml");
            gvData.DataSource = ds.Tables[0];
            gvData.DataBind();
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "XML data of other portal loaded in GridView.";
        }
        catch (Exception ex)
        { lblMsg.ForeColor = System.Drawing.Color.Red; lblMsg.Text = "Error : " + ex.Message; }
    }
</script>
<!DOCTYPE html>
<html>
<head runat="server"><title>Using Data of Other Web Portal</title></head>
<body style="font-family:Segoe UI">
<form id="form1" runat="server">
 <h2>Consume data of another web portal using Web Service</h2>
 City : <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
 <asp:Button ID="btnGet" runat="server" Text="Get Weather" OnClick="btnGet_Click" />
 <asp:Button ID="btnXml" runat="server" Text="Load XML Catalog" OnClick="btnXml_Click" />
 <br /><br />
 <asp:Label ID="lblMsg" runat="server"></asp:Label><br />
 <asp:TextBox ID="txtOutput" runat="server" TextMode="MultiLine" Rows="8" Width="600"></asp:TextBox>
 <br /><br />
 <asp:GridView ID="gvData" runat="server" CellPadding="5" HeaderStyle-BackColor="#2c3e50"
      HeaderStyle-ForeColor="White"></asp:GridView>
</form>
</body>
</html>
