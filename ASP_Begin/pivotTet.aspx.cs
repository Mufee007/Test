using ASP_Begin.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ASP_Begin
{
    public partial class pivotTet : System.Web.UI.Page
    {
        static int datecount = 0;
        static DateTime startdate;
        public static DataTable distdates = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable maindata = new DataTable();
                DepartmentDAL Dept = new DepartmentDAL();
                DataTable dt = new DataTable();
                maindata = Dept.getpivot ();          
                DataTable sourcedt = new DataTable();
                DataTable disemployees = new DataTable();
                disemployees = maindata.DefaultView.ToTable(true, "F_Tbl_Emp_Code", "F_Emp_FirstName");
                sourcedt = maindata.DefaultView.ToTable(true, "F_Tbl_Emp_Code", "F_Emp_FirstName");                
                distdates = maindata.DefaultView.ToTable(true, "Dt_Punched");                  
                datecount = distdates.Rows.Count;
                startdate = Convert.ToDateTime(distdates.Rows[0][0].ToString());
                for (int i = 0; i <= distdates.Rows .Count ; i++)
                {
                    string colhead = DateTime.Today.AddDays(i).ToShortDateString();                    
                    sourcedt.Columns.Add(new DataColumn("", typeof(String)));
                    sourcedt.Columns.Add(new DataColumn("", typeof(String)));
                    sourcedt.Columns.Add(new DataColumn("", typeof(String)));                    
                }
               
                DataTable dtdata = new DataTable();               
                foreach (DataRow mr in sourcedt.Rows)
                {
                    DataView view2 = new DataView(maindata, "F_Tbl_Emp_Code=" + mr["F_Tbl_Emp_Code"].ToString(), "", DataViewRowState.CurrentRows);
                    dtdata = view2.ToTable();
                    int l = 2;
                    int m = 3;
                    foreach (DataRow dr in dtdata.Rows)
                    {
                        mr[l] = dr[m].ToString();
                        l++;
                        mr[l] = dr[m + 1].ToString();
                        l++;
                        mr[l] = dr[m + 2].ToString();
                        l++;
                        m = 3;
                    }
                }
                GridView_Merge_Header.DataSource = sourcedt;
                GridView_Merge_Header.DataBind();
               
                
            }
        }


        protected void GridView_Merge_Header_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //Build custom header.
                GridView oGridView = (GridView)sender;
                GridViewRow oGridViewRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell oTableCell = new TableCell();

                DateTime selecteddate = Convert.ToDateTime(distdates.Rows[0][0].ToString());        
                //Generating Header column for empCode and Name
                oTableCell.Text = selecteddate.ToString("yyyy MMMM");
                oTableCell.ColumnSpan = 2;
                oTableCell .Height =60;               
                oTableCell.Font.Size = 14;
                oTableCell.Font.Bold = true;
                oTableCell.HorizontalAlign = HorizontalAlign.Center;
                oGridViewRow.Cells.Add(oTableCell);
                oTableCell.Font.Bold = true;

                //Date column Header
                int colcount = 2;
                int i = 0;
                while (((datecount*3) - colcount) >= 0)
                {
                    oTableCell = new TableCell();
                    oTableCell.Text = distdates.Rows[i][0].ToString();
                    oTableCell.ColumnSpan = 3;
                    oGridViewRow.Cells.Add(oTableCell);
                    oTableCell.Font.Size = 12;
                    oTableCell.Font.Bold = true;
                    i++;
                    colcount += 3;
                }

                //Total Column
                oTableCell = new TableCell();
                oTableCell.HorizontalAlign = HorizontalAlign.Center;
                oTableCell.Font.Size = 12;
                oTableCell.Text = "Total";
                oTableCell.ColumnSpan = 3;
                oTableCell.Font.Bold = true;
                oGridViewRow.Cells.Add(oTableCell);
               


                oGridView.Controls[0].Controls.AddAt(0, oGridViewRow);

               
            }
        }

        protected void GridView_Merge_Header_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.Header)
            {                

                //Assigning Column Header
                e.Row.Cells[0].Text = "Employee Code";             
                e.Row.Cells[1].Text = "Employee Name";
             
                for (int k = 0; k < e.Row.Cells.Count; k++)
                {                   
                    if (k != 0 && k != 1)
                    {
                        if (k % 3 == 0)
                        {
                            e.Row.Cells[k].Text = "NOT";
                        }
                        else  if (k % 3 == 1)
                        {
                            e.Row.Cells[k].Text = "HOT";
                        }
                        else if (k % 3 == 2)
                        {
                            e.Row.Cells[k].Text = "ATT";
                        }
                        
                    }
                }
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
               
                int totATT=0,totHOT=0,totNOT=0;
                for (int k = 0; k < e.Row.Cells.Count; k++)
                {
                    if (k != 0 && k != 1)
                    {
                        if (k % 3 == 0)
                        {
                            if (e.Row.Cells[k].Text.Trim() != string.Empty && e.Row.Cells[k].Text.Trim() != "&nbsp;")
                            {
                                totNOT += Convert.ToInt32(e.Row.Cells[k].Text.Trim());
                            }
                        }
                        else if (k % 3 == 1)
                        {
                            if (e.Row.Cells[k].Text.Trim() != string.Empty && e.Row.Cells[k].Text.Trim() !="&nbsp;")
                            {
                                totHOT += Convert.ToInt32(e.Row.Cells[k].Text.Trim());
                            }
                        }
                        else if (k % 3 == 2)
                        {
                            if (e.Row.Cells[k].Text.Trim().ToUpper() == "P")
                                totATT++;
                        }

                    }
                }
                e.Row.Cells[e.Row.Cells.Count - 3].Text = totATT.ToString();
                e.Row.Cells[e.Row.Cells.Count - 2].Text = totNOT.ToString();
                e.Row.Cells[e.Row.Cells.Count - 1].Text = totHOT.ToString();
            }
          
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }  
        protected void Button2_Click(object sender, EventArgs e)
        {
        }

        protected void btnPrintPDF_Click(object sender, EventArgs e)
        {

            string attachment = "attachment; filename=Export.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            // Create a form to contain the grid
            HtmlForm frm = new HtmlForm();

            divMon.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(divMon);
            frm.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }
}