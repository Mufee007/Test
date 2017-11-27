using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace ASP_Begin
{
    public partial class frmdatalist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                

            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                DataRowView drv = e.Item.DataItem as DataRowView;

                GridView innerDataList = e.Item.FindControl("GridView1") as GridView;
                Label lbl = (Label)e.Item.FindControl("DepartmentIdLabel");
                DataTable _DataTable2 = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from tblEmployee where departmentid=" + lbl.Text;
                SqlConnection con = new SqlConnection("Data Source=ASLAM-PC;Initial Catalog=ASP_TestDB;User ID=sa;Password=myserver");
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                innerDataList.DataSource = dt;
                innerDataList.DataBind();
            }
            catch (Exception ex)
            {
                
              
            }
          
        }
    }
}