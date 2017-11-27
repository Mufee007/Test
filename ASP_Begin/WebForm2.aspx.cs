using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP_Begin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Int32 HH = default(Int32);
            Int32 MM = default(Int32);
            ListItem li = default(ListItem);


            for (HH = 0; HH <= 23; HH++)
            {
                li = new ListItem();
                li.Text = HH.ToString().PadLeft(3, '1');
                li.Value = li.Text;

              
                li = null;
            }
        }
    }
}