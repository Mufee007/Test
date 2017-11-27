using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP_Begin.DAL;
using ASP_Begin.Models;
using System.Data;
using ASP_Begin.ServiceReference1;
namespace ASP_Begin
{
    public partial class Department : System.Web.UI.Page
    {
        //for wcf service tes
        //ServiceReference1.Service1Client objServiceClientobjService = new ServiceReference1.Service1Client();

        string msg = "";
        #region Private methods
        private void _EntryView()
        {
            mvDepartment.SetActiveView(vWEntry);
            btnBack.Visible = true;
           // btnDelete.Visible = false;
        }
        private void _GridView()
        {
            mvDepartment.SetActiveView(vwGrid);
            btnBack.Visible = false;
        }
        private void _selectView()
        {
            if (gvDepartment.Rows.Count > 0)
            {
                _GridView();
            }
            else
            {
                _EntryView();
            }
        }
        private void _Clear()
        {
            txtDepartmentName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            HdnDepartmentId.Value = "0";
            btnSave.Text = "Save";
            Session["Ses_Department"] = null;
            btnDelete.Visible = false;
            txtDepartmentName.Focus();
        }
        private void _Refresh()
        {
            _LoadGrid();
            _Clear();
        }
        private void _LoadGrid()
        {
            DepartmentDAL Dept = new DepartmentDAL();
            DataTable dt=new DataTable();
            dt=Dept._SelectAllDepartment();
            gvDepartment.DataSource = dt;
            gvDepartment.DataBind();
            Session["Ses_Department"]=dt;
        }
        private void _Save()
        {
            msg = "";
            DepartmentModel dpt = new DepartmentModel();
            dpt.DepartmentName = txtDepartmentName.Text.Trim();
            dpt.Description = txtDescription.Text.Trim();
            if (ckbIsActive.Checked == true)
            {
                dpt.IsActive = true;
            }
            else
            {
                dpt.IsActive = false;
            }
            DepartmentDAL objDal = new DepartmentDAL();
            if (btnSave.Text == "Save")
            {
                msg = objDal._insertUpdateDeleteDepartment(dpt, "Insert");
            }
            else
            {
                dpt.DepartmentId = Convert.ToInt32(HdnDepartmentId.Value);
                msg = objDal._insertUpdateDeleteDepartment(dpt, "Update");
            }
            if (msg != "")
            {
                _Refresh();
            }

        }
        private void _Delete()
        {
            msg = "";
            DepartmentModel dpt = new DepartmentModel();
            DepartmentDAL objDal = new DepartmentDAL();
            dpt.DepartmentId = Convert.ToInt32(HdnDepartmentId.Value);
            msg = objDal._insertUpdateDeleteDepartment(dpt, "Delete");
            if (msg != "")
            {
                _Refresh();
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.Session["user"] == null)
            {
                System.Web.HttpContext.Current.Response.Redirect("~/Default.aspx");
            }
            if (!IsPostBack)
            {
                _selectView();
                _Refresh();

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Using wcf service created
            //UserDetails userInfo = new UserDetails();
            //userInfo.DepartmentName = txtDepartmentName.Text;
            //userInfo.Description = txtDescription.Text;
            //if (ckbIsActive.Checked == true)
            //{
            //    userInfo.Isactive = true;
            //}
            //else
            //{
            //    userInfo.Isactive = false;
            //}
            //var javaScriptSerializer = new
            //System.Web.Script.Serialization.JavaScriptSerializer();                     
            //string result = objServiceClientobjService.InsertDepartmentDetails(userInfo);
            #endregion
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            _EntryView();
            _Clear();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            _LoadGrid();
            _GridView();
        }

        protected void gvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDepartment.PageIndex = e.NewPageIndex;
            gvDepartment.DataSource = (DataTable)Session["Ses_Department"];
            gvDepartment.DataBind();
        }

        protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
         
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer';");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.gvDepartment, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
           

            //Accessing TemplateField Column controls
            //string country = (GridView1.SelectedRow.FindControl("lblCountry") as Label).Text;

            //lblValues.Text = "<b>Name:</b> " + name + " <b>Country:</b> " + country;
        }

        protected void gvDepartment_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                GridViewRow row = gvDepartment.Rows[e.NewSelectedIndex];
                HdnDepartmentId.Value = (row.FindControl("lblDepartmentID") as Label).Text;
                txtDepartmentName.Text = row.Cells[1].Text;
                txtDescription.Text = (row.Cells[2].Text == "&nbsp;") ? "" : row.Cells[2].Text;
                ckbIsActive.Checked = (row.Cells[3].Text.ToUpper() == "TRUE");               
                _EntryView();
                btnSave .Text ="Update";
                btnDelete.Visible = true;
                txtDepartmentName.Focus();
            }
            catch (Exception)
            {
                
                throw;
            }
           
           
           
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            _Clear();
        }

    }
}