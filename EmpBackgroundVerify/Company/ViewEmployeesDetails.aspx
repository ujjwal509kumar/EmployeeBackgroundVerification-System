<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ViewEmployeesDetails.aspx.cs" Inherits="EmpBackgroundVerify.Company.ViewEmployeesDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<div class="article">
          <h2><span>Employee Details</span></h2>
          <%--<asp:GridView ID="GVdepts" runat="server" BackColor="White" 
                                  BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Width="80%" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:BoundField DataField="DeptId" HeaderText="DeptId" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Dept Name" />
                                      <asp:TemplateField HeaderText="Edit">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Edit" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Edit_Click">EDIT</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Delete">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Delete" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Delete_Click" OnClientClick="reurn confirm('Are you sure do you want to delete record?')">DELETE</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <FooterStyle BackColor="White" ForeColor="#333333" />
                                  <HeaderStyle BackColor="#2E9AC9" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="White" ForeColor="#333333" />
                                  <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                  <SortedAscendingHeaderStyle BackColor="#487575" />
                                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                  <SortedDescendingHeaderStyle BackColor="#275353" />
                              </asp:GridView>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 90%; ">
                     <tr>
                        <td style="width: 346px" >
                            <table style="width: 100%; background-image: url('../images/swat_default_background.jpg');">
                                <tr>
                                    <td style="width: 107px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 107px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 107px">
                                        <strong style="color: #CC0066">Department</strong></td>
                                    <td>
                                        <asp:DropDownList ID="DDLdept" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DDLdept_SelectedIndexChanged" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 107px; color: #CC0066">
                                        <strong style="color: #CC0066">Designation</strong></td>
                                    <td>
                                        <asp:DropDownList ID="DDLdes" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 107px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSearch" runat="server" BackColor="White" Font-Bold="True" 
                                            ForeColor="#299BCD" onclick="btnSearch_Click" Text="SEARCH" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 107px">
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="lblMsg" runat="server" Font-Bold="False" Font-Italic="True" 
                                            ForeColor="#FF6600"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="left">
                            &nbsp;</td>
                    </tr>
                   
                    <tr>
                        <td style="width: 346px" align="left">
                            <asp:GridView ID="GVemps" runat="server" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                CellPadding="4" GridLines="Horizontal" Width="500px" >
                                <Columns>
                                    <asp:BoundField DataField="EmpId" HeaderText="EmpId" />
                                    <asp:BoundField DataField="EmpName" HeaderText="EmpName" Visible="False" />
                                    <asp:BoundField DataField="DeptName" HeaderText="Department" Visible="False" />
                                    <asp:BoundField DataField="Designation" HeaderText="Designation" 
                                        Visible="False" />
                                    <asp:BoundField DataField="CTC" HeaderText="CTC" Visible="False" />
                                    <asp:TemplateField HeaderText="UpdateProfile">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LB_UpdateProfile" runat="server" 
                                                CommandArgument='<%# Eval("EmpId") %>' onclick="LB_UpdateProfile_Click">Profile Update</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update Designation">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LB_UpdateDes" runat="server" 
                                                CommandArgument='<%# Eval("EmpId") %>' onclick="LB_UpdateDes_Click">Update Designation</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update Salary">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LB_UpdateSalary" runat="server" 
                                                CommandArgument='<%# Eval("EmpId") %>' onclick="LB_UpdateSalary_Click">Update Salary</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update Status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LB_UpdateStatus" runat="server" 
                                                CommandArgument='<%# Eval("EmpId") %>' onclick="LB_UpdateStatus_Click">Update Status</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LB_Delete" runat="server" 
                                                CommandArgument='<%# Eval("EmpId") %>' onclick="LB_Delete_Click" OnClientClick="return confirm('Are you sure?')">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#299DCE" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#487575" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#275353" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" >
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" >
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
              <p >
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                              <%--<asp:GridView ID="GVdepts" runat="server" BackColor="White" 
                                  BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Width="80%" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:BoundField DataField="DeptId" HeaderText="DeptId" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Dept Name" />
                                      <asp:TemplateField HeaderText="Edit">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Edit" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Edit_Click">EDIT</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Delete">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Delete" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Delete_Click" OnClientClick="reurn confirm('Are you sure do you want to delete record?')">DELETE</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <FooterStyle BackColor="White" ForeColor="#333333" />
                                  <HeaderStyle BackColor="#2E9AC9" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="White" ForeColor="#333333" />
                                  <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                  <SortedAscendingHeaderStyle BackColor="#487575" />
                                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                  <SortedDescendingHeaderStyle BackColor="#275353" />
                              </asp:GridView>--%>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
