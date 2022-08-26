<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Last2.aspx.cs" Inherits="WebApplication1.Last2" %>

<!DOCTYPE html>
<style>
.mydatagrid {
width: 80%;
border: solid 2px black;
min-width: 80%;
    }

.header {
background-color: #646464;
font-family: Arial;
color: White;
border: none 0px transparent;
height: 25px;
text-align: center;
font-size: 16px;
    }

.rows {
background-color: #fff;
font-family: Arial;
font-size: 14px;
color: #000;
min-height: 25px;
text-align: left;
border: none 0px transparent;
    }

.rows:hover {
background-color: #ff8000;
font-family: Arial;
color: #fff;
text-align: left;
        }

.selectedrow {
background-color: #ff8000;
font-family: Arial;
color: #fff;
font-weight: bold;
text-align: left;
    }

.mydatagrida/** FOR THE PAGING ICONS **/ {
background-color: Transparent;
padding: 5px 5px 5px 5px;
color: #fff;
text-decoration: none;
font-weight: bold;
    }

.mydatagrida:hover/** FOR THE PAGING ICONS HOVER STYLES**/ {
background-color: #000;
color: #fff;
        }

.mydatagridspan/** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
background-color: #c9c9c9;
color: #000;
padding: 5px 5px 5px 5px;
    }

.pager {
background-color: #646464;
font-family: Arial;
color: White;
height: 30px;
text-align: left;
    }

.mydatagridtd {
padding: 5px;
    }

.mydatagridth {
padding: 5px;
    }
</style>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grdDetails" CssClass="mydatagrid"  runat="server" AutoGenerateColumns="False"
                PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="true"
                OnRowEditing="grdDetails_RowEditing" DataKeyNames="Id"
                OnRowUpdating="grdDetails_RowUpdating"
                OnRowDeleting="grdDetails_RowDeleting"
                OnRowCancelingEdit="grdDetails_RowCancelingEdit"
                OnPageIndexChanging="grdDetails_PageIndexChanging">

                 <Columns>
                 <asp:TemplateField HeaderText="Sr No.">
                        <ItemTemplate>
                            <%# grdDetails.Rows.Count + 1  %> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="ID" >
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblid" Text=' <%#Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                 <Columns>
                    <asp:TemplateField SortExpression="FirstName"  HeaderText="FirstName">                       
                        <ItemTemplate><%#Eval("FirstName") %></ItemTemplate>                   
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirst" runat="server" Text='<%#Eval("FirstName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            

                <Columns>
                <asp:TemplateField SortExpression="LastName" HeaderText="LastName">                       
                        <ItemTemplate><%#Eval("LastName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLast" runat="server" Text='<%#Eval("LastName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField >
                        <HeaderTemplate>Mobile</HeaderTemplate>
                        <ItemTemplate>
                            <%#Eval("Mobile") %>
                        </ItemTemplate>
                         <EditItemTemplate>
                            <asp:TextBox ID="txtMobile" runat="server" Text='<%#Eval("Mobile") %>'></asp:TextBox>
                        </EditItemTemplate>
                   
                      
                    </asp:TemplateField>
                </Columns>

                <Columns>
                <asp:TemplateField SortExpression="Email" HeaderText="Email">                       
                        <ItemTemplate><%#Eval("Email") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>State</HeaderTemplate>
                        <ItemTemplate>
                            <%#Eval("State") %>
                        </ItemTemplate>
                   
                      
                    </asp:TemplateField>
                </Columns>
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>Gender</HeaderTemplate>
                        <ItemTemplate>
                            <%#Eval("Gender") %>
                        </ItemTemplate>
                   
                      
                    </asp:TemplateField>
                </Columns>
                   <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>Status</HeaderTemplate>
                        <ItemTemplate>
                            <%#Eval("Status") %>
                        </ItemTemplate>
                   
                      
                    </asp:TemplateField>
                </Columns>
                    

                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>Edit/Delete</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnedit" Text="edit" CommandName="edit" />
                            <asp:Button runat="server" ID="btndelete" Text="delete" CommandName="delete" />
                        </ItemTemplate>
                    
                        <EditItemTemplate>
                            <asp:Button runat="server" ID="btnupdate" Text="Update" CommandName="update" />
                            <asp:Button runat="server" ID="btncancel" Text="Cancel" CommandName="cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
