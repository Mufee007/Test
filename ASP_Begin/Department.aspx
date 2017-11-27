<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" EnableEventValidation = "false"
  Inherits="ASP_Begin.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!DOCTYPE html>
    <html> 
        <head>
            <title>Department</title>
          
        </head>
        <body>
            <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <div class="row">
                <div class="col-*-*">   <h2>Department</h2> </div>
                </div>
                   
                   
                        <hr />
                    <div>
                     <section>
                     
                     <asp:Button ID="btnNew" runat="server" Text="Add New" class="btn btn-primary" CausesValidation="False" OnClick="btnNew_Click" />
                     <asp:Button ID="btnBack" runat="server" Text="List" class="btn btn-warning" CausesValidation="False" OnClick="btnBack_Click" />
                     </section>
                    </div>
                <br />
                     <asp:MultiView ID="mvDepartment" runat="server"  ActiveViewIndex="0" >
                     <asp:View ID="vwGrid" runat="server">
                         <asp:GridView ID="gvDepartment" runat="server" CssClass="table table-striped table-bordered table-hover"
                              OnPageIndexChanging="gvDepartment_PageIndexChanging" AutoGenerateColumns="False" PageSize="5" AllowPaging="True" OnRowDataBound="gvDepartment_RowDataBound" OnSelectedIndexChanged="gvDepartment_SelectedIndexChanged" OnSelectedIndexChanging="gvDepartment_SelectedIndexChanging" >
                             <Columns>
                                 <asp:TemplateField HeaderText="ID" Visible="False">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:TextBox>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="lblDepartmentID" runat="server" Text='<%# Bind("DepartmentId") %>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                 <asp:BoundField DataField="Description" HeaderText="Description" />
                                 <asp:BoundField DataField="IsActive" HeaderText="Active" />
                                
                             </Columns>
                     
                              </asp:GridView>

                     </asp:View>
                    <asp:View ID="vWEntry" runat="server">
                          <div >
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert-danger" />
                            </div>
                        <div class="col-sm-8">
                    <div class="panel panel-info">
                    <div class="panel-heading">Add New Department</div>
                    <div class="panel-body">
                    <div class="form-group">
                    <asp:HiddenField ID="HdnDepartmentId" runat="server" />             
                    <label for ="txtDepartmentName">Department Name</label>
                    <asp:TextBox ID="txtDepartmentName" runat="server" placeholder="Department Name" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Department Name  required" Display="None" ControlToValidate="txtDepartmentName"></asp:RequiredFieldValidator>
                    <label for ="txtDescription">Description</label>        
                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Department Description" class="form-control" ></asp:TextBox>  
                    </div>
                    <div class="form-check">
                    <label for ="ckbIsActive">Is Active</label>    
                    <asp:CheckBox ID="ckbIsActive" runat="server" class="form-check-input" />
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save"  class="btn btn-success" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"  class="btn btn-danger"  />
                        
                      
                    </div>
                    </div>
                            </div>
                    </asp:View>
                  </asp:MultiView>
                </ContentTemplate>
                 

            </asp:UpdatePanel>
                </div>
            
    <script type="text/javascript">
        $(function () {
            $("[id*=GridView1] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>
        </body>
    </html>
</asp:Content>
