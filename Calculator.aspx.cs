using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculator
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtNum1.Text);
            int b = Convert.ToInt32(txtNum2.Text);

            lblResult.Text = "Result = " + (a + b);
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtNum1.Text);
            int b = Convert.ToInt32(txtNum2.Text);

            lblResult.Text = "Result = " + (a - b);
        }

        protected void btnMul_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(txtNum1.Text);
            int b = Convert.ToInt32(txtNum2.Text);

            lblResult.Text = "Result = " + (a * b);
        }

        protected void btnDiv_Click(object sender, EventArgs e)
        {
            double a = Convert.ToDouble(txtNum1.Text);
            double b = Convert.ToDouble(txtNum2.Text);

            lblResult.Text = "Result = " + (a / b);
        }
    }
}