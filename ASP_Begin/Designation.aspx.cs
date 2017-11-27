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
    public partial class Designation : System.Web.UI.Page
    {
        string msg = "";
        #region Private methods
        private void _EntryView()
        {
            mvDesignation.SetActiveView(vwEntry);
            btnList.Visible = true;
            // btnDelete.Visible = false;
        }
        private void _GridView()
        {
            mvDesignation.SetActiveView(vwGrid);
            btnList.Visible = false;
        }
        private void _selectView()
        {
            if (gvDesignation.Rows.Count > 0)
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
            txtDesignationName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            HdnDesignationId.Value = "0";
            btnSave.Text = "Save";
            Session["Ses_Designation"] = null;
            btnDelete.Visible = false;
            txtDesignationName.Focus();
        }
        private void _Refresh()
        {
            _LoadGrid();
            _Clear();
        }
        private void _LoadGrid()
        {
            DesignationDAL Dept = new DesignationDAL();
            DataTable dt = new DataTable();
            dt = Dept._SelectAllDesignation();
            gvDesignation.DataSource = dt;
            gvDesignation.DataBind();
            Session["Ses_Designation"] = dt;
        }
        private void _Save()
        {
            msg = "";
            DesignationModel dpt = new DesignationModel();
            dpt.DesignationName = txtDesignationName.Text.Trim();
            dpt.Description = txtDescription.Text.Trim();
            if (ckbIsActive.Checked == true)
            {
                dpt.IsActive = true;
            }
            else
            {
                dpt.IsActive = false;
            }
            DesignationDAL objDal = new DesignationDAL();
            if (btnSave.Text == "Save")
            {
                msg = objDal._insertUpdateDeleteDesignation(dpt, "Insert");
            }
            else
            {
                dpt.DesignationId = Convert.ToInt32(HdnDesignationId.Value);
                msg = objDal._insertUpdateDeleteDesignation(dpt, "Update");
            }
            if (msg != "")
            {
                _Refresh();
            }

        }
        private void _Delete()
        {
            msg = "";
            DesignationModel dpt = new DesignationModel();
            DesignationDAL objDal = new DesignationDAL();
            dpt.DesignationId = Convert.ToInt32(HdnDesignationId.Value);
            msg = objDal._insertUpdateDeleteDesignation(dpt, "Delete");
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

        protected void btnNew_Click(object sender, EventArgs e)
        {
            _EntryView();
            _Clear();
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            _LoadGrid();
            _GridView();
        }

        protected void gvDesignation_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDesignation.PageIndex = e.NewPageIndex;
            gvDesignation.DataSource = (DataTable)Session["Ses_Designation"];
            gvDesignation.DataBind();
        }

        protected void gvDesignation_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer';");
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.gvDesignation, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvDesignation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                GridViewRow row = gvDesignation.Rows[e.NewSelectedIndex];
                HdnDesignationId.Value = (row.FindControl("lblDesignationID") as Label).Text;
                txtDesignationName.Text = row.Cells[1].Text;
                txtDescription.Text = (row.Cells[2].Text == "&nbsp;") ? "" : row.Cells[2].Text;
                ckbIsActive.Checked = (row.Cells[3].Text.ToUpper() == "TRUE");
                _EntryView();
                btnSave.Text = "Update";
                btnDelete.Visible = true;
                txtDesignationName.Focus();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}