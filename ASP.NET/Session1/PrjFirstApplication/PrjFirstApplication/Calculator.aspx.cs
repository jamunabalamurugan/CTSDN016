using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrjFirstApplication
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddMethod(object sender, EventArgs e)
        {
           Result.Text= (Convert.ToInt32(input1.Text) + Convert.ToInt32( input2.Text)).ToString();
        }

        protected void SubMethod(object sender, EventArgs e)
        {
           if(input1.Text!=String.Empty && input2.Text != String.Empty)
            {
                Result.Text = (Convert.ToInt32(input1.Text) - Convert.ToInt32(input2.Text)).ToString();
            }

           else
            {
                Result.Text = "Input Cant be blank";
            }
        }

        protected void MultiplyMethod(object sender, EventArgs e)
        {
            Result.Text = (Convert.ToInt32(input1.Text) * Convert.ToInt32(input2.Text)).ToString();
        }

        protected void btnCancel(object sender, EventArgs e)
        {
            Result.Text = "";
        }

        protected void input1_TextChanged(object sender, EventArgs e)
        {
            input1.BackColor = System.Drawing.Color.DarkGreen;
        }

        protected void btnClear(object sender, EventArgs e)
        {
            input1.Text = "";
            input2.Text = "";
        }
    }
}