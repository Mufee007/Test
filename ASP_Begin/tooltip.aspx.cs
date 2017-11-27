using ASP_Begin.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Begin
{
    public partial class tooltip : System.Web.UI.Page
    {
        public static int a = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenField1.Value = a.ToString ();
                
            }
        }

        protected void Label1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void HiddenField1_ValueChanged(object sender, EventArgs e)
        {
            Label1.ToolTip = HiddenField1.Value;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            myclass abc = new myclass();
            Label1.Text = abc.callme();

           

        }

        [WebMethod]
        public static string jqueryAjaxCall(string firstName, string lastName)
        {
            a++;
            Page page = (Page)HttpContext.Current.Handler;
            Label lbl = (Label)page.FindControl("Label1");

            lbl.ToolTip = a.ToString();
            //Do coding staff.
            return firstName + " " + lastName;
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Label1.ToolTip = TextBox1.Text;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (divabc.Visible == true)
            {
                divabc.Visible = false;

            }
            else
            {
                divabc.Visible = true ;
            }
        }
    }
}