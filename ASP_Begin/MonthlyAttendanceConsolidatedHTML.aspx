<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyAttendanceConsolidatedHTML.aspx.cs" Inherits="ASP_Begin.MonthlyAttendanceConsolidatedHTML" 
    EnableEventValidation = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
         <table class="style1">
            <tr>
                <td class="style6">&nbsp;</td>
                <td align="right">
                  <asp:Button ID="btnPrintPDF" runat="server" CssClass="submitbutton"
                        Text="Export to Excel" Width="107px" OnClick="btnPrintPDF_Click" />
                </td>
            </tr>
        </table>
         <div id ="divMon" runat ="server" >
      <table class="style1">
                <tr align="right">
                    <td class="style4" align="left">
                        <asp:Image ID="Image1" runat="server" Height="58px" ImageUrl="~/images/al.bmp"
                            Width="145px" />
                        <div id="Div1" style="text-align: right; float: right; font-weight: bold; font-size: large; font-family: Tahoma" runat="server">
                            <asp:Label runat="server" ID="Label1" Text="Monthly Attendance HTML Report " Font-Names="TAHOMA" Font-Bold="true" Font-Size="Large" /><br />
                           <%-- Report Period From: <%=FD %>  TO: <%=TD %>--%>
                        </div>

                    </td>
                </tr>              
                <tr>
                    <td class="style5" align="center">

                       <asp:GridView EmptyDataText="No Data Found" ID="GridView_Merge_Header" runat="server"
                            OnRowCreated="GridView_Merge_Header_RowCreated"
                            OnRowDataBound="GridView_Merge_Header_RowDataBound" Style="table-layout: fixed;" CssClass="gridstyle" HeaderStyle-BackColor="#8db4e2"
                            HeaderStyle-ForeColor="Black" HeaderStyle-Font-Names="Tahoma" HeaderStyle-Font-Size="14px" EnableSortingAndPagingCallbacks="True" PageSize="50" >
                        </asp:GridView>

                    </td>
                </tr>
            
              
            </table>
               <style type='text/css'>
                .my-legend .legend-title {
                    text-align: left;
                    margin-bottom: 5px;
                    font-weight: bold;
                    font-size: 90%;
                    padding-top: 30px;
                }

                .my-legend .legend-scale ul {
                    margin: 0;
                    margin-bottom: 5px;
                    padding: 0;
                    float: left;
                    list-style: none;
                }

                    .my-legend .legend-scale ul li {
                        font-size: 80%;
                        list-style: none;
                        margin-left: 0;
                        line-height: 18px;
                        margin-bottom: 2px;
                    }

                .my-legend ul.legend-labels li span {
                    display: block;
                    float: left;
                    height: 16px;
                    width: 30px;
                    margin-right: 5px;
                    margin-left: 0;
                    border: 1px solid #999;
                }

                .my-legend .legend-source {
                    font-size: 70%;
                    color: #999;
                    clear: both;
                }

                .my-legend a {
                    color: #777;
                }
            </style>
            <style type="text/css">
                .headerStylesnew {
                    background-color: #747D9D;
                }

                .RowStylesnew {
                    background-color: White;
                    text-align: left;
                    color: #404040;
                }

                    .RowStylesnew td {
                        background-color: White;
                        color: #404040;
                    }

                    .RowStylesnew tr {
                        background-color: White;
                        color: #FFFFFF;
                        text-align: left;
                    }

                .inputLabel {
                    color: #404040;
                }

                .submitbutton {
                    color: #FFF;
                    background-color: #747D9D;
                }

                .style1 {
                    width: 100%;
                }

                .style4 {
                    height: 30px;
                }

                .style5 {
                    /*height: 16px;*/
                }

                /*.style6 {
            width: 918px;
        }*/

                .style9 {
                    height: 31px;
                }

                .style10 {
                    height: 15px;
                }

                body * {
                    font-family: Tahoma !important;
                    font-weight: normal;
                    font-size: 11px;
                }

                .gridstyle th, tr, td * {
                    border-color: #C0C0C0 !Important;
                }
                /*#gvMonthlyAttendancelist tr > td  *{
        border-color:#C0C0C0 !Important;
        }
        #gvMonthlyAttendancelist tbody > tr    *{
        border-color:#C0C0C0 !Important;
        }*/
                /*.gridBorder
        {
         border-right: 2px solid black;
         border-bottom: 2px solid Black;
         border-left: 2px solid black;
         border-top: 2px solid Black !important;

        
        }
      .gridBorder tr {
        
    border-top-color:black;    
        }
.GridViewRowStyle td {
    border-color:#c0c0cc;
    
}

.GridViewHeaderStyle th,td {
    border-color:#c0c0cc;
}*/
                .auto-style1 {
                    height: 104px;
                }
            </style>
                      
    </div>
    </form>
</body>
</html>
