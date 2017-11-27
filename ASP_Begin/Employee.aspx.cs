using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP_Begin.DAL;
using ASP_Begin.Models;
namespace ASP_Begin
{
    public partial class Employee : System.Web.UI.Page
    {
        GeneralDAL obj = new GeneralDAL();
        string msg = "";
        #region Private methods
        private void SelectView()
        {
            if (gvEmplyee.Rows.Count > 0)
            {
                _GridView();
                return;
            }
            _EntryView();
        }
        private void _EntryView()
        {
            mvEmployee.SetActiveView(vwEntry);
            btnList.Visible = true;            
        }
        private void Clear()
        {
            BindGrid();
            txtEmployeeName.Text = "";
            txtContactNo.Text = "";
            txtAddress.Text = "";
            hdnEmplopyeeId.Value = "0";
            btnDelete.Visible = false;
            btnSave.Text = "Save";
            ckbIsActive.Checked = true;
            obj = new GeneralDAL();
            obj.BindDropdown(ddlDepartment, "SP_Department", "GetActiveDepartment", "DepartmentName", "DepartmentId");
            obj = new GeneralDAL();
            obj.BindDropdown(ddlDesignation, "SP_Designation", "GetActiveDesignation", "DesignationName", "DesignationId");
        }
        private void _GridView()
        {
            mvEmployee.SetActiveView(vwGrid);
            btnList.Visible = false;
        }
        private void BindGrid()
        {
            obj = new GeneralDAL();            
            gvEmplyee.DataSource = obj.GetTable("SP_Employee", "GetAllEmployee");
            gvEmplyee.DataBind();
        }
        private void Save()
        {
            msg = "";
            EmployeeModel Emp = new EmployeeModel();
            EmployeeDAL EmpDal = new EmployeeDAL();
            Emp.Address = txtAddress.Text.Trim();
            Emp.Gender = ddlGender.Text;
            Emp.ContactNo = txtContactNo.Text.Trim();
            Emp.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
            Emp.DesignationId = Convert.ToInt32(ddlDesignation.SelectedValue);
            Emp.EmpName = txtEmployeeName.Text.Trim();
            Emp.IsActive = ckbIsActive.Checked;
            if (btnSave.Text == "Save")
            {                
                msg = EmpDal.InsertUpdateDeleteEmployee(Emp, "Insert");
            }
            else
            {
                Emp.EmpId = Convert.ToInt32(hdnEmplopyeeId.Value);
                msg = EmpDal.InsertUpdateDeleteEmployee(Emp, "Update");
            }
            if (msg != "")
                Clear();
        }
        private void Delete()
        {
            msg = "";
            EmployeeModel Emp = new EmployeeModel();
            EmployeeDAL EmpDal = new EmployeeDAL();         
            Emp.EmpId = Convert.ToInt32(hdnEmplopyeeId.Value);
            msg = EmpDal.InsertUpdateDeleteEmployee(Emp, "Delete");           
            if (msg != "")
            Clear();
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
                SelectView();
                Clear();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Clear();
            _EntryView();
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            BindGrid();
            _GridView();
        }

        protected void gvEmplyee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmplyee.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvEmplyee_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer';");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.gvEmplyee, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvEmplyee_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                GridViewRow row = gvEmplyee.Rows[e.NewSelectedIndex];
                hdnEmplopyeeId.Value = (row.FindControl("lblEmpId") as Label).Text;
                txtEmployeeName.Text = row.Cells[1].Text;
                ddlGender.Text = row.Cells[2].Text;
                txtAddress.Text = (row.Cells[3].Text == "&nbsp;") ? "" : row.Cells[3].Text;
                txtContactNo.Text = (row.Cells[4].Text == "&nbsp;") ? "" : row.Cells[4].Text;
                ddlDepartment.SelectedValue = (row.FindControl("lblDepartmentID") as Label).Text;
                ddlDesignation.SelectedValue = (row.FindControl("lblDesignationID") as Label).Text;
                ckbIsActive.Checked = (row.Cells[9].Text.ToUpper() == "TRUE");
                _EntryView();
                btnSave.Text = "Update";
                btnDelete.Visible = true;
                txtEmployeeName.Focus();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete();

        }


    }
}