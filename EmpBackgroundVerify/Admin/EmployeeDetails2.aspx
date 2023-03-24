<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails2.aspx.cs" Inherits="EmpBackgroundVerify.Admin.EmployeeDetails2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<div class="article">
          <h2><span>Employee Background verification</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
              <p >
                  &nbsp;<asp:Panel ID="Panel3" runat="server">
                  <table style="width:100%;">
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Panel ID="Panel4" runat="server">
                              </asp:Panel>
                          </td>
                      </tr>
                      <tr>
                          <td align="center" bgcolor="#A0C6DE">
                              <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                                  ForeColor="#990033" Text="EMPLOYEE BASIC  DETAILS"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td>
                          <hr />
                          </td>
                      </tr>
                      <tr>
                          <td>
                            <table style="width:70%;" align="center">
                                      <tr>
                                          <td style="width: 124px; height: 109px;">
                                              </td>
                                          <td align="right" style="width: 170px; height: 109px;">
                                              </td>
                                          <td style="height: 109px">
                                              <asp:Image ID="ImgEmp" runat="server" Height="101px" Width="97px" />
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px; height: 22px;" bgcolor="#A0C6DE">
                                              Name</td>
                                          <td style="width: 170px; height: 22px;">
                                              <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td style="height: 22px">
                                              Emp ID&nbsp; :&nbsp;&nbsp;
                                              <asp:Label ID="lblEmpId" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px" bgcolor="#A0C6DE">
                                              Address</td>
                                          <td style="width: 170px">
                                              <asp:Label ID="lblAddress" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px" bgcolor="#A0C6DE">
                                              Mobile Number</td>
                                          <td style="width: 170px">
                                              <asp:Label ID="lblMobileNo" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px" bgcolor="#A0C6DE">
                                              Email ID</td>
                                          <td style="width: 170px">
                                              <asp:Label ID="lblEmailId" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px" bgcolor="#A0C6DE">
                                              Date of Birth</td>
                                          <td style="width: 170px">
                                              <asp:Label ID="lblDOB" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px" bgcolor="#A0C6DE">
                                              Aadhar Card Number</td>
                                          <td style="width: 170px">
                                              <asp:Label ID="lblAadharNo" runat="server" Font-Bold="True"></asp:Label>
                                          </td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td style="width: 124px">
                                              &nbsp;</td>
                                          <td style="width: 170px">
                                              &nbsp;</td>
                                          <td>
                                              &nbsp;</td>
                                      </tr>
                                  </table>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="center" bgcolor="#A0C6DE">
                              <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                                  ForeColor="#990033" Text="EMPLOYEE WORK  DETAILS"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td>
                          <hr />
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Table ID="tblWork" runat="server">
                              </asp:Table>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
                  </asp:Panel>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
