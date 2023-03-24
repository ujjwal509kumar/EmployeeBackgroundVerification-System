<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CompanyVerify.aspx.cs" Inherits="EmpBackgroundVerify.Admin.CompanyVerify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<div class="article">
          <h2><span>Companies Approval</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
             <br /><br />
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 85px">
                            <strong>City Name</strong></td>
                        <td>
                            <asp:DropDownList ID="DDLcity" runat="server" Width="250px" AutoPostBack="True" 
                                onselectedindexchanged="DDLcity_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 85px" align="right">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    </table>
              </p>
              <p >
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                              <asp:CheckBox ID="chkSelectAll" runat="server" Text="Select All" 
                                  AutoPostBack="True" oncheckedchanged="chkSelectAll_CheckedChanged" />
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <asp:GridView ID="GVcompanies" runat="server" BackColor="White" 
                                  BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Width="112%" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:TemplateField>
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="True" 
                                                  oncheckedchanged="chkSelect_CheckedChanged" />
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="CompanyId">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="lblCompanyId" runat="server" Text='<%# Eval("CompanyId") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                      <asp:BoundField DataField="Address" HeaderText="Address" />
                                      <asp:BoundField DataField="CityName" HeaderText="CityName" />
                                      <asp:BoundField DataField="EmailId" HeaderText="EmailId" Visible="False" />
                                      <asp:TemplateField HeaderText="ViewMore">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_ViewMore" runat="server" 
                                                  CommandArgument='<%# Eval("CompanyId") %>' onclick="LB_ViewMore_Click">ViewMore</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField>
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_ViewCertificate" runat="server" 
                                                  CommandArgument='<%# Eval("CompanyId") %>' onclick="LB_ViewCertificate_Click">View 
                                              Certificate</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#487575"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#275353"></SortedDescendingHeaderStyle>
                              </asp:GridView>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;<table style="width:100%;">
                                  <tr>
                                      <td style="width: 100px">
                                          <asp:Button ID="btnApprove" runat="server" BackColor="White" Font-Bold="True" 
                                              ForeColor="#2E9AC9" Text="APPROVE" Width="100px" 
                                              onclick="btnApprove_Click" onclientclick="return confirm('Are your sure?')"/>
                                      </td>
                                      <td style="width: 104px">
                                          <asp:Button ID="btnReject" runat="server" BackColor="White" Font-Bold="True" 
                                              ForeColor="#2E9AC9" Text="REJECT" Width="100px" 
                                              onclick="btnReject_Click"  
                                              onclientclick="return confirm('Are your sure?')" Visible="False"/>
                                      </td>
                                      <td>
                                          <asp:Button ID="btnDelete" runat="server" BackColor="White" Font-Bold="True" 
                                              ForeColor="#2E9AC9" Text="DELETE" Width="100px" 
                                              onclientclick="return confirm('Are your sure?')" onclick="btnDelete_Click" />
                                      </td>
                                  </tr>
                              </table>
                          </td>
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
