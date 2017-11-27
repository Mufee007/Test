<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ASP_Begin.WebForm1" EnableEventValidation="false" %>

<!DOCTYPE html>

 <!DOCTYPE html>
    <html> 
        <head>
            <title>Department</title>
            <script src="Script/jquery-3.1.1.min.js"></script>
        </head>
        <body>
            <form id="form1" runat="server">
            <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <div class="row">
                <div class="col-*-*">   <h2>Grid Edi<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    t Test</h2> </div>
                </div>
                   
                   
                        <hr />
                    <div>
                     <section>
                     
                     <asp:Button ID="btnNew" runat="server" Text="Add New" class="btn btn-primary" CausesValidation="False" OnClick="btnNew_Click" />
                     <asp:Button ID="btnBack" runat="server" Text="List" class="btn btn-warning" CausesValidation="False"  />
                     </section>
                    </div>
                <br />
                     <asp:MultiView ID="mvDepartment" runat="server"  ActiveViewIndex="0" >
                     <asp:View ID="vwGrid" runat="server">
                         <table>
                             <tr>
                                 <td>Net Salary</td>
                                 <td>
                                     <asp:TextBox ID="txtNetSalary" runat="server" Enabled="False"></asp:TextBox> </td>
                             </tr>
                             <tr>
                                 <td>Net Salary Old</td>
                                 <td> <asp:TextBox ID="txtNetSalaryOld" runat="server" Enabled="False" ></asp:TextBox></td>
                             </tr>
                         </table>

                         <h3>Earnings</h3>
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table grid table-hover table-responsive" >
                             <Columns>
                                 <asp:BoundField DataField="Slno" HeaderText="Sl No" />
                                 <asp:BoundField DataField="PayHead" HeaderText="Pay Head" />
                                 <asp:TemplateField HeaderText="Amount Old">
                                     <ItemTemplate>
                                         <asp:TextBox ID="txtEAmountOld" runat="server" Text='<%# Bind("amountOld") %>'
                                         onKeyPress="CheckNumWithDecimal(event);"
                                         onfocus="javascript: if(this.value == '0.00' || this.value == '0'){ this.value = ''; }"
                                         onblur="javascript: if(this.value==''){this.value='0.00';}" Enabled="false"></asp:TextBox>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Amount">
                                     <ItemTemplate>
                                         <asp:TextBox ID="txtEAmount" runat="server" Text='<%# Bind("amount") %>'  
                                         onKeyUp="EarningTotal();" onKeyPress="CheckNumWithDecimal(event);" 
                                         onfocus="javascript: if(this.value == '0.00' || this.value == '0'){ this.value = ''; }"
                                         onblur="javascript: if(this.value==''){this.value='0.00';}"></asp:TextBox>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                             </Columns>
                         </asp:GridView>
                         <br />
                             <table>
                             <tr>
                                 <td>Total Earning Old</td>
                                 <td>
                                     <asp:TextBox ID="txtTotalEarningOld" runat="server" Enabled="False"></asp:TextBox> </td>
                             </tr>
                             <tr>
                                 <td>Total Earning</td>
                                 <td> <asp:TextBox ID="txtTotalEarning" runat="server" Enabled="False"></asp:TextBox></td>
                             </tr>
                         </table>
                         <hr />
                         <br />
                         <h3>Deductions</h3>
                         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                             <Columns>
                                 <asp:BoundField DataField="Slno" HeaderText="Sl No" />
                                 <asp:BoundField DataField="PayHead" HeaderText="Pay Head" />
                                 <asp:TemplateField HeaderText="Amount Old">
                                     <ItemTemplate>
                                         <asp:TextBox ID="txtDAmountOld" runat="server" Text='<%# Bind("amountOld") %>'
                                             onKeyPress="CheckNumWithDecimal(event);" 
                                             onfocus="javascript: if(this.value == '0.00' || this.value == '0'){ this.value = ''; }"
                                         onblur="javascript: if(this.value==''){this.value='0.00';}" Enabled="false"></asp:TextBox>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Amount">
                                     <ItemTemplate>
                                         <asp:TextBox ID="txtDAmount" runat="server" Text='<%# Bind("amount") %>' 
                                         onKeyUp="DeductionTotal();" onKeyPress="CheckNumWithDecimal(event);" 
                                         onfocus="javascript: if(this.value == '0.00' || this.value == '0'){ this.value = ''; }"
                                         onblur="javascript: if(this.value==''){this.value='0.00';}"></asp:TextBox>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                             </Columns>
                         </asp:GridView>
                         <br />
                          <table>
                             <tr>
                                 <td>Total Deduction Old</td>
                                 <td>
                                     <asp:TextBox ID="txtTotalDeductionOld" runat="server" Enabled="False"></asp:TextBox> </td>
                             </tr>
                             <tr>
                                 <td>Total Deduction</td>
                                 <td> <asp:TextBox ID="txtTotalDeduction" runat="server" Enabled="False"></asp:TextBox></td>
                             </tr>
                         </table>
                     </asp:View>
                  </asp:MultiView>
                </ContentTemplate>
                 

            </asp:UpdatePanel>
                
                </div>
            
    
            </form>
        </body>
        <script type="text/javascript">
            function EarningTotal() {
                try {
                    var total = 0;
                    $('[id*=GridView1_txtEAmount_]').each(function (index, item) {
                        if ($(item).val() != '') {
                            total = (total + parseFloat($(item).val()));
                        }
                    });
                    //                $("#gvPayHeadEarning").find(".txtBoxGridMedium").each(function (index, item) {
                    //                    var sum = parseFloat($(item).val() == '' ? '0' : $(item).val());
                    //                    total = total + sum;
                    //                });
                    $("#txtTotalEarning").val(Math.round(total).toFixed(2));
                    NetSalary();
                }
                catch (e) {
                    alert(e);
                }
            }
            function DeductionTotal() {
                try {
                    var total = 0;
                    $('[id*=GridView2_txtDAmount_]').each(function (index, item) {
                        if ($(item).val() != '') {
                            total = (total + parseFloat($(item).val()));
                        }
                    });
                    //                $("#gvPayHeadDeduction").find(".txtBoxGridMedium").each(function (index, item) {
                    //                    var sum = parseFloat($(item).val() == '' ? '0' : $(item).val());
                    //                    total = total + sum;
                    //                });

                    $("#txtTotalDeduction").val(Math.round(total).toFixed(2));
                    NetSalary();
                }
                catch (e) {
                    alert(e);
                }
            }
            function NetSalary() {
                try {
                    var total = 0;
                    var totalEarning = 0;
                    var totalDeductions = 0;

                    if ($("#txtTotalEarning").val() != '') {
                        totalEarning = $("#txtTotalEarning").val();
                    }
                    if ($("#txtTotalDeduction").val() != '') {
                        totalDeductions = $("#txtTotalDeduction").val();
                    }
                    $('#txtNetSalary').val(parseFloat(totalEarning) - parseFloat(totalDeductions));
                } catch (e) {
                    alert(e);
                }
            }
            function CheckNumWithDecimal(eventRef) {
                //take charecter code
                var carCode = eventRef.keyCode ? eventRef.keyCode : ((eventRef.charCode) ? eventRef.charCode : eventRef.which);

                //if carcode not for back space,tab,#,$,%,',.,and not between  0-9 then cancel event
                //(carCode != 35)&&(carCode != 36)(carCode != 37)&&&&(carCode != 39)&&(carCode != 9)
                if ((carCode != 8) && (carCode != 46) && (carCode < 48) || (carCode > 57)) {
                    eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                }

                //take target text box to oTextbox
                var oTextbox = document.getElementById((eventRef.target || eventRef.srcElement).id);

                //taking index of . in text
                var indexval = oTextbox.value.indexOf(".");

                //take charecter kyepressed position to leni

                var leni = GetCursorLocation(oTextbox);
                //handle the case of .
                if (carCode == 46) {
                    //if . already exists then cancel the second keypress of .
                    if (indexval != -1) {
                        eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                    }
                    else {
                        if (oTextbox.value == "") {
                            oTextbox.value = "0";
                            ventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                        }
                    }
                }

                //if key press cherecter in between 0 and 9 then 
                if ((carCode > 47) && (carCode < 58)) {
                    //if text in text box does not contain . then limit cheking using maximum length
                    if (indexval == -1) {
                        if (oTextbox.value.length >= 9) {

                            eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                        }
                    }
                    else {

                        //if text box contain . and current keypress position lessthan or equal to position of . then compare for if lenth of text before . ia alredy >=15 then cancel current action
                        if (leni <= (indexval + 1)) {
                            if ((indexval) >= 15) {
                                eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                            }
                        }
                            //else if digit numbers after . alredy 2 or more cancel current action
                        else if ((oTextbox.value.length - indexval - 1) >= 3) {
                            eventRef.preventDefault ? eventRef.preventDefault() : eventRef.returnValue = false;
                        }
                    }
                }
            }
    </script>
    </html>