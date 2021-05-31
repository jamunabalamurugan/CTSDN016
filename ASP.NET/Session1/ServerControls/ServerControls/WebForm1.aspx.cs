using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControls
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)//true if POST and false if GET--Renderd the page for the first time
            {
                City.Items.Add("Goa");
                City.Items.Add("Mumbai");
                City.Items.Add("Chennai");
                City.Items.Add("Madurai");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
           
            if (TextBox1.Text == "Kavin" && TextBox2.Text == "1234")
            {
                Response.Write("Welcome" + TextBox1.Text);
              
            }
            //if (MaleRadioButton.Checked )
            //{
            //    Response.Write("radiobutton" + MaleRadioButton.Text);
            //}
            //else
            //{
            //    Response.Write("radiobutton" + FemaleRadioButton.Text);
            //}

        }

        protected void MaleRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Response.Write("Male Radio button selected" + "</br>");
        }

        protected void FemaleRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Response.Write("Female Radio button selected");
        }

        
    }
}