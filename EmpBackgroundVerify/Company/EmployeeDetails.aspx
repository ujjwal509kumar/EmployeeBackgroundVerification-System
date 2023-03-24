<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="EmpBackgroundVerify.Company.EmployeeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
 <div class="article">
          <h2><span>Employee Background verification</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
              <p >
                  &nbsp;<asp:Panel ID="Panel3" runat="server">
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                           <asp:Panel ID="Panel1" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Basic Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">              
                                <tr>
                                    <td style="width: 283px" valign="top">
                                        <asp:DetailsView ID="DVemp" runat="server" Height="50px" Width="125px" 
                                            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                                            CellPadding="4" GridLines="Horizontal">
                                            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                            <FooterStyle BackColor="White" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="White" ForeColor="#333333" />
                                        </asp:DetailsView>
                                    </td>
                                    <td valign="top">
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
                                                    <asp:Image ID="ImgEmp" runat="server" Height="147px" Width="152px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Employee ID :
                                                    <asp:Label ID="lblEmpId" runat="server" Font-Bold="True"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Employee Name :
                                                    <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>
                          </td>
                      </tr>
                      <tr>
                          <td>
                            <asp:Panel ID="Panel2" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Work Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">              
                                <tr>
                                    <td style="width: 283px" valign="top">
                                        <%--<asp:Table ID="tblWork" runat="server">
                                        </asp:Table>--%>
                                        <asp:DetailsView ID="DVEmpOverallDetails" runat="server" BackColor="White" 
                                  BorderColor="#329ECC" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Height="50px" Width="80%" AutoGenerateRows="False">
                                  <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <Fields>
                                      <asp:BoundField DataField="CompanyName" HeaderText="Company Name" ControlStyle-Font-Bold="true" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Department Name" />
                                      <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                      <asp:BoundField DataField="DOJ" HeaderText="DOJ" />
                                      <asp:BoundField DataField="CTC" HeaderText="CTC" />
                                      <asp:BoundField DataField="HikeDate" HeaderText="Hike Date" />
                                      <asp:BoundField DataField="SalaryRating" HeaderText="Salary Rating" />
                                      <asp:BoundField DataField="SalaryStatus" HeaderText="Salary Status" />
                                      <asp:BoundField DataField="WorkStatus" HeaderText="Work Status" />
                                      <asp:BoundField DataField="QuitDate" HeaderText="Quit Date" />
                                      <asp:BoundField DataField="QuitReason" HeaderText="QuitReason" />
                                      <asp:BoundField DataField="OverAllRating" HeaderText="Over All Rating" />
                                     
                                  </Fields>
                                  <FooterStyle BackColor="White" ForeColor="#333333" />
                                  <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="White" ForeColor="#333333"  />
                              </asp:DetailsView>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 283px" valign="top">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">
                              <asp:Button ID="btnClose" runat="server" BackColor="#62B7EB" Font-Bold="True" 
                                  ForeColor="White" onclick="btnClose_Click" Text="CLOSE" Width="120px" />
                          </td>
                      </tr>
                  </table>
                  </asp:Panel>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
