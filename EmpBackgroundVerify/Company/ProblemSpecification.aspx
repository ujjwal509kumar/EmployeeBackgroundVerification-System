<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ProblemSpecification.aspx.cs" Inherits="EmpBackgroundVerify.Company.ProblemSpecification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
    <div class="article">
          <h2><span>STAFFING PROBLEM</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 90%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td>
                            
                            <table style="width:100%;">
                                <tr>
                                    <td style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 138px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 138px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 190px">
                                        Input Current Recuitment&nbsp; Policy</td>
                                    <td style="width: 138px">
                                        <asp:TextBox ID="txtCRP" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="*" ControlToValidate="txtCRP" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 190px">
                                        Strength to Raise</td>
                                    <td style="width: 138px">
                                        <asp:TextBox ID="txtRaise" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 190px">
                                        Number of Years(Last)</td>
                                    <td style="width: 138px">
                                        <asp:DropDownList ID="DDLyears" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DDLyears_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 138px">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="Panel4" runat="server">
                            

                            </asp:Panel>
                            
                        </td>
                    </tr>
                    </table>
              </p>
              <asp:Panel ID="Panel3" runat="server">
                  <table style="width:100%;">
                      <tr>
                          <td>
                              <asp:Table ID="Table1" runat="server">
                              </asp:Table>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              <asp:Button ID="btnSolution" runat="server" Font-Bold="True" 
                                  onclick="btnSolution_Click" Text="SOLUTION" />
                          </td>
                      </tr>
                  </table>
              </asp:Panel>
              <p>
                  <table style="width:100%;">
                      <tr>
                          <td>
                              <asp:Table ID="Table2" runat="server">
                              </asp:Table>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                          <asp:Label ID="lblTotal" runat="server" Font-Bold="True"></asp:Label>
                          </td>
                      </tr>
                  </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
