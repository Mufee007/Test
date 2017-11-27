<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" EnableEventValidation = "false" Inherits="ASP_Begin.Designation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
    <!DOCTYPE html>
    <html> 
    <head>
    <title>Designation</title>         
    </head>
    <body>
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                       <div class="row">
                <div class="col-*-*">   <h2>Designation</h2> </div>
                </div>
                    <hr />
                    <div id="DivButtons">
                        <asp:Button ID="btnNew" runat="server" Text="Add New" CssClass="btn btn-primary" OnClick="btnNew_Click" CausesValidation="False" />
                        <asp:Button ID="btnList" runat="server" Text="List" CssClass="btn btn-warning" OnClick="btnList_Click" CausesValidation="False" />
                    </div>
                    <br />
                     <asp:MultiView ID="mvDesignation" runat="server"  ActiveViewIndex="0" >
                          <asp:View ID="vwGrid" runat="server">
                              <asp:GridView ID="gvDesignation" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" 
                                  AllowPaging="True" PageSize="5" OnPageIndexChanging="gvDesignation_PageIndexChanging" OnRowDataBound="gvDesignation_RowDataBound" OnSelectedIndexChanging="gvDesignation_SelectedIndexChanging">

                                  <Columns>
                                      <asp:TemplateField HeaderText="ID">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DesignationId") %>'></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="lblDesignationID" runat="server" Text='<%# Bind("DesignationId") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="DesignationName" HeaderText="Designation" />
                                      <asp:BoundField DataField="Description" HeaderText="Description" />
                                      <asp:BoundField DataField="IsActive" HeaderText="Active" />
                                  </Columns>

                              </asp:GridView>
                          </asp:View>
                         <asp:View ID="vwEntry" runat="server">
                            <div >
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert-danger" />
                            </div>
                              <div class="panel panel-info">
                    <div class="panel-heading">Add New Designation</div>
                    <div class="panel-body">
                    <div class="form-group">
                    <asp:HiddenField ID="HdnDesignationId" runat="server" />             
                    <label for ="txtDesignationName">Designation Name</label>
                    <asp:TextBox ID="txtDesignationName" runat="server" placeholder="Designation Name" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Designation Name required" Display="None" ControlToValidate="txtDesignationName"></asp:RequiredFieldValidator>
                    <label for ="txtDescription">Description</label>        
                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Designation Description" class="form-control" ></asp:TextBox>  
                    </div>
                    <div class="form-check">
                    <label for ="ckbIsActive">Is Active</label>    
                    <asp:CheckBox ID="ckbIsActive" runat="server" class="form-check-input" />
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save"  class="btn btn-success" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"  class="btn btn-danger"  />
                        
                      
                    </div>
                    </div>
                          </asp:View>
                     </asp:MultiView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </body>
    </html>
</asp:Content>
