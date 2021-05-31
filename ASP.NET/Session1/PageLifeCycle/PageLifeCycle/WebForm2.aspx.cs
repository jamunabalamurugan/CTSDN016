using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PageLifeCycle
{
    public partial class WebForm2 : System.Web.UI.Page
    {
       
        //1
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Button Clicked " + "<br/>");
        }
        //1
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Response.Write("Text Changed  " + TextBox1.Text+ "<br/>");
        }

        //explain about is post back property -true in properties of text box
        //2



        protected void Page_PreInit(object sender, EventArgs e)
        { Response.Write("Page_PreInit" + "<br/>"); }

        protected void Page_Init(object sender, EventArgs e)
        { Response.Write("Page_Init" + "<br/>"); }

        protected void Page_InitComplete(object sender, EventArgs e)
        { Response.Write("Page_InitComplete" + "<br/>"); }

        protected void Page_PreLoad(object sender, EventArgs e)
        { Response.Write("Page_PreLoad" + "<br/>"); }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Welcome !!! " + TextBox1.Text);
            if (!IsPostBack)// When the PageRequest type is GET
            {
                Response.Write("Page_Load" + "<br/>");

                ddlCity.Items.Add("Chennai");
                ddlCity.Items.Add("Mumbai");
                ddlCity.Items.Add("Bangalore");
                ddlCity.Items.Add("Hyderabad");
                ddlCity.Items.Add("Delhi");
            }
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        { Response.Write("Page_LoadComplete" + "<br/>"); }

        protected void Page_PreRender(object sender, EventArgs e)
        { Response.Write("Page_PreRender" + "<br/>"); }

        protected void Page_PreRenderComplete(object sender, EventArgs e)
        { Response.Write("Page_PreRenderComplete" + "<br/>"); }

        protected void Page_Unload(object sender, EventArgs e)
        {
            //Response.Write("Page_Unload" + "<br/>"); 
        }
    }
}