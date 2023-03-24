<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CompanyDetails2.aspx.cs" Inherits="EmpBackgroundVerify.Admin.CompanyDetails2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<div class="article">
          <h2><span>Company Profile</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
             <asp:Panel ID="Panel2" runat="server">
                 
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td align="center">
                              <br />
                              <br />
                          </td>
                      </tr>
                      <tr>
                          <td align="center">
                              <asp:Label ID="lblCompanyName" runat="server" Font-Bold="True" 
                                  Font-Size="Medium" ForeColor="#990033"></asp:Label>
                              <br />
                          </td>
                      </tr>
                      <tr>
                          <td align="center">
                           <hr /></td>
                      </tr>
                      <tr>
                          <td align="center">
                              <asp:DetailsView ID="DVcompanyDetails" runat="server" AutoGenerateRows="False" 
                                  BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                  CellPadding="4" GridLines="Horizontal" Height="50px" Width="350px">
                                  <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <Fields>
                                      <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" />
                                      <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                      <asp:BoundField DataField="Address" HeaderText="Address" />
                                      <asp:BoundField DataField="CityName" HeaderText="CityName" />
                                      <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" />
                                      <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                      <asp:BoundField DataField="WebsiteAddress" HeaderText="WebsiteAddress" />
                                  </Fields>
                                  <FooterStyle BackColor="White" ForeColor="#333333" />
                                  <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="White" ForeColor="#333333" />
                              </asp:DetailsView>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
                   </asp:Panel>
              <p>
                  &nbsp;<asp:Panel ID="Panel3" runat="server">
                  <table style="width:100%;">
                      <tr>
                          <td align="center" style="color: #990033; font-size: medium">
                              EMPLOYEE DETAILS</td>
                      </tr>
                      <tr>
                          <td>
                            <hr /></td>
                      </tr>
                      <tr>
                          <td align="center">
                              <asp:GridView ID="GVempDetails" runat="server" AutoGenerateColumns="False" 
                                  BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                                  CellPadding="4">
                                  <Columns>
                                      <asp:TemplateField HeaderText="Employee ID">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_EmpId" runat="server" 
                                                  CommandArgument='<%# Eval("EmpId") %>' Font-Bold="True" 
                                                  onclick="LB_EmpId_Click" Text='<%# Eval("EmpId") %>'></asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Department" />
                                      <asp:BoundField DataField="Designation" HeaderText="Designation" />
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
              </asp:Panel></p>
              
          </div>
          <div class="clr"></div>
        </div>

</form>
</asp:Content>
