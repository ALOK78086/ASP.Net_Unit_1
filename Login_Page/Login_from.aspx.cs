using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Login_Page
{
    public partial class Login_from : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == "admin" && txtPass.Text == "123")
            {
                Response.Write("<script>alert('Login Successful');</script>");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }

        protected void btnLogin_Load(object sender, EventArgs e)
        {
           
        }
    }
}