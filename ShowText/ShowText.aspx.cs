using System;

namespace ShowText
{
    public partial class ShowText : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblResult.Text = "Username: " + txtUsername.Text +
                             "<br/>Password: " + txtPassword.Text;
        }
    }
}