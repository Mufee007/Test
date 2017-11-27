using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP_Begin.DAL;
using ASP_Begin.Models;
using System.Data;
namespace ASP_Begin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
               
                txtUserName.Text = "";
                txtPassword.Text = "";
                txtUserName.Focus();
            }
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            UserModel user = new UserModel();
            user.UserName = txtUserName.Text.Trim();
            user.Password = txtPassword.Text.Trim();
            UserDAL obj = new UserDAL();
            DataTable dt = new DataTable();
            dt = obj.GetLoginDetails(user);
            if (dt.Rows.Count > 0)
            {
                Session["user"] = dt;
                Response.Redirect("Department.aspx");
            }
            else
            {
            
            }
        }
    }
}