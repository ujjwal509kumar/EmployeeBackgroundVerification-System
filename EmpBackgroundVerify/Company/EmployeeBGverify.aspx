<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeBGverify.aspx.cs" Inherits="EmpBackgroundVerify.Company.EmployeeBGverify" %>
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
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="RBfresher" runat="server" Font-Bold="True" 
                                            ForeColor="#840E0C" Text="Fresher" 
                                            oncheckedchanged="RBfresher_CheckedChanged" Checked="True" GroupName="a" 
                                            AutoPostBack="True" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="RBexperienced" runat="server" Font-Bold="True" 
                                            ForeColor="#801211" Text="Experienced" GroupName="a" 
                                            oncheckedchanged="RBexperienced_CheckedChanged" AutoPostBack="True" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                        <td>
                        <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel_fresher" runat="server">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 343px; color: #CC0066; font-weight: bold;">
                                            Aadhar Card Number</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 343px">
                                            <asp:TextBox ID="txtCardNo" runat="server" Width="250px"></asp:TextBox>
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
                        <asp:Panel ID="Panel_experience" runat="server">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 343px; color: #CC0066; font-weight: bold;">
                                            Employee ID</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 343px">
                                            <asp:TextBox ID="txtEmpId" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSearch" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#2E9AC9" Text="SEARCH" Width="150px" 
                                onclick="btnSearch_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="#FF6600"></asp:Label>
                        </td>
                    </tr>
                </table>
              </p>
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
                                                <td style="height: 21px">
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
                                       <%-- <asp:Table ID="tblWork" runat="server">
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
                                
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>
                          </td>
                      </tr>
                      <tr>
                          <td>
                          <asp:Panel ID="Panel4" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Employee Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">              
                                <tr>
                                    <td style="width: 283px" valign="top">
                                       <%-- <asp:Table ID="tblWork" runat="server">
                                        </asp:Table>--%>
                                         <asp:DetailsView ID="DVEmpSelfDetails" runat="server" BackColor="White" 
                                  BorderColor="#329ECC" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Height="50px" Width="80%" AutoGenerateRows="False">
                                  <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <Fields>
                                      <asp:BoundField DataField="CompanyName" HeaderText="Company Name" ControlStyle-Font-Bold="true" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Department Name" />
                                      <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                      <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                                      <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" />
                                      <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                      <asp:BoundField DataField="Address" HeaderText="Address" />
                                      <asp:BoundField DataField="Expr" HeaderText="Experience" />
                                      <asp:BoundField DataField="CTC" HeaderText="CTC" />
                                     
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
                                
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>

                              </td>
                      </tr>
                      <tr>
                                    <td align="center" style="width: 283px" valign="top">
                                        <asp:LinkButton ID="LB_SendRequest" runat="server" Font-Bold="True" 
                                            onclick="LB_SendRequest_Click">SEND REQUEST</asp:LinkButton>
                                    </td>
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
