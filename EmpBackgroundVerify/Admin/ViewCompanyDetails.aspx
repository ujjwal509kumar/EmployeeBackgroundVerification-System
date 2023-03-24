<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewCompanyDetails.aspx.cs" Inherits="EmpBackgroundVerify.Admin.ViewCompanyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
    <div class="article">
          <h2><span>Employee Background verification</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel_fresher" runat="server">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 343px; color: #CC0066; font-weight: bold;">
                                            City</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 343px">
                                            <asp:DropDownList ID="DDLcity" runat="server" AutoPostBack="True" 
                                                onselectedindexchanged="DDLcity_SelectedIndexChanged" Width="300px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 343px">
                                            <strong style="color: #990033">Company</strong></td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 343px">
                                            <asp:DropDownList ID="DDLcompany" runat="server" Width="300px" 
                                                AutoPostBack="True" onselectedindexchanged="DDLcompany_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="#FF9900"></asp:Label>
                        </td>
                    </tr>
                </table>
              </p>
              <asp:Panel ID="Panel2" runat="server">
              <center>
                  <asp:GridView ID="GVcompanies" runat="server" BackColor="White" 
                      BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                      AutoGenerateColumns="False">
                      <Columns>
                          <asp:TemplateField HeaderText="CompanyId">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:LinkButton ID="LB_CompanyId" runat="server" 
                                      CommandArgument='<%# Eval("CompanyId") %>' onclick="LB_CompanyId_Click" 
                                      Text='<%# Eval("CompanyId") %>' Font-Bold="True"></asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="CompanyName">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="City">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblCityName" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="View Employee Details">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:LinkButton ID="LB_ViewEmpDetails" runat="server" 
                                      CommandArgument='<%# Eval("CompanyId") %>' Font-Bold="True" 
                                      onclick="LB_ViewEmpDetails_Click">View Employee Details</asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Delete">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:LinkButton ID="LB_Delete" runat="server" 
                                      CommandArgument='<%# Eval("CompanyId") %>' Font-Bold="True" 
                                      onclick="LB_Delete_Click">Delete</asp:LinkButton>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                      <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <RowStyle BackColor="White" ForeColor="#330099" />
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <SortedAscendingCellStyle BackColor="#FEFCEB" />
                      <SortedAscendingHeaderStyle BackColor="#AF0101" />
                      <SortedDescendingCellStyle BackColor="#F6F0C0" />
                      <SortedDescendingHeaderStyle BackColor="#7E0000" />
                  </asp:GridView>
              </center>
              </asp:Panel>
              <p>
              </p>
          </div>
          <div class="clr"></div>
        </div>

</form>
</asp:Content>
