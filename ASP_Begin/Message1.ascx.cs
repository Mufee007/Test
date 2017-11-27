using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Begin
{
    public partial class Message1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ShowMessage(string msg, string type)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "Script", "<script type=\"text/javascript\">ShowMessage(\"" + msg + "\",\"" + type + "\");</script>");
        } 
    }
}