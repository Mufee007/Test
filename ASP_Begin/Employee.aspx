<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" EnableEventValidation = "false"
     Inherits="ASP_Begin.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!DOCTYPE html>
    <html>
        <head>                   
        </head>
        <body>
            <div class="container-fluid">
             <div class="container">
                 
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                         <div class="row">
                             <div class="col-*-*">
                                 <h2>Employee</h2>
                             </div>
                         </div>
                         <hr />
                         <section>
                             <asp:Button ID="btnNew" runat="server" Text="New Employee" CssClass="btn btn-primary" CausesValidation="false" OnClick="btnNew_Click" />
                             <asp:Button ID="btnList" runat="server" Text="List" CssClass="btn btn-warning" CausesValidation="false" OnClick="btnList_Click" />
                         </section>
                         <br />
                         <asp:MultiView ID="mvEmployee" runat="server">
                             <asp:View ID="vwGrid" runat="server">
                                 <asp:GridView ID="gvEmplyee" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                     CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="gvEmplyee_PageIndexChanging" 
                                     OnRowDataBound="gvEmplyee_RowDataBound" OnSelectedIndexChanging="gvEmplyee_SelectedIndexChanging">
                                     <Columns>
                                         <asp:TemplateField HeaderText="ID" Visible="False">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmpId") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="lblEmpId" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                                         <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                         <asp:BoundField DataField="Address" HeaderText="Address" />
                                         <asp:BoundField DataField="ContactNo" HeaderText="Contact No" />
                                         <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                         <asp:TemplateField HeaderText="Department Id" Visible="False">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="lblDepartmentID" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:BoundField DataField="DesignationName" HeaderText="Designation" />
                                         <asp:TemplateField HeaderText="Designation Id" Visible="False">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DEsignationId") %>'></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="lblDesignationID" runat="server" Text='<%# Bind("DEsignationId") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                                     </Columns>
                                 </asp:GridView>
                             </asp:View>
                             <asp:View ID="vwEntry" runat="server">
                                      <div>
                                          <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert-danger"/>
                                      </div>
                                      <div class="panel panel-info">
                                          <div class="panel-heading">Add new employee</div>
                                          <div class="panel-body">
                                              <div class="form-group">
                                                   <div class="row">
                                              <div class="col-sm-6">
                                                  <asp:HiddenField ID="hdnEmplopyeeId" runat="server" />
                                                  <asp:Label ID="Label1" for="txtEmployeeName" runat="server" Text="Employee Name"></asp:Label>
                                                  <asp:TextBox ID="txtEmployeeName" runat="server" placeholder="Employee Name" 
                                                      class="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                           ErrorMessage="Employee Name missing" ControlToValidate="txtEmployeeName" Display="None">

                                                                                         </asp:RequiredFieldValidator>
                                                  
                                                  <asp:Label ID="Label2" for="ddlGender" runat="server" Text="Gender" ></asp:Label>
                                                  <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control chosen-select">
                                                      <asp:ListItem>Male</asp:ListItem>
                                                      <asp:ListItem>Female</asp:ListItem>
                                                      <asp:ListItem>Other</asp:ListItem>
                                                  </asp:DropDownList>
                                                  <asp:Label ID="Label3" for="txtAddress" runat="server" Text="Address"></asp:Label>
                                                  <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" class="form-control" Height="70px" T
                                                      extMode="MultiLine" style = "resize:none">

                                                  </asp:TextBox>
                                              </div>
                                              <div class="col-sm-6">
                                                  <asp:Label ID="Label4" for="txtContactNo" runat="server" Text="Contact No"></asp:Label>
                                                  <asp:TextBox ID="txtContactNo" runat="server" placeholder="Contact No" 
                                                      class="form-control"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Contact Number"
                                                       ControlToValidate="txtContactNo"
                                                       Display="None"></asp:RequiredFieldValidator>
                                                  <asp:Label ID="Label5" for="ddlDepartment" runat="server" Text="Department"></asp:Label>
                                                  <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control chosen-select"></asp:DropDownList>
                                                  <asp:Label ID="Label6" for="ddlDesignation" runat="server" Text="Designation"></asp:Label>
                                                  <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control chosen-select"></asp:DropDownList>
                                                  <div class="form-check">
                                                   <asp:Label ID="Label7" for="ckbIsActive" runat="server" Text="Is Active"></asp:Label>
                                                  <asp:CheckBox ID="ckbIsActive" runat="server"  class="form-check-input" Font-Size="Medium"/>
                                                      </div>
                                              </div>
                                        
                                                  </div>
                                                  
                                              </div>
                                              <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click"/>
                                              <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" CausesValidation="False" OnClick="btnDelete_Click"/>
                                          </div>
                                      </div>
                             
                             </asp:View>
                         </asp:MultiView>
                     </ContentTemplate>
                 </asp:UpdatePanel>
             </div>
                </div>
<script type="text/javascript">
function pageLoad() {
        
$(".chosen-select").chosen();
$('.chosen-container').attr('style', 'width:100%');
       
}
</script>
<script src="Script/chosen.jquery.js"></script>
             </body>
    </html>
</asp:Content>
