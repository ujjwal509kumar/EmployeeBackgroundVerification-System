<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="RequestConfirmation.aspx.cs" Inherits="EmpBackgroundVerify.Company.RequestConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="article">
          <h2><span>Reply to Confirmation Request</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td>
                            
                            <br />
                            
                        </td>
                    </tr>
                     <tr>
                        <td>
                        <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        Company Name</td>
                                    <td>
                                        <asp:DropDownList ID="DDLcomp" runat="server" Width="250px" AutoPostBack="True" 
                                            onselectedindexchanged="DDLcomp_SelectedIndexChanged" ValidationGroup="a">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToValidate="DDLcomp" ErrorMessage="Select Company " Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValidationGroup="a" ValueToCompare="Select"></asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Italic="True" 
                                ForeColor="#FF6600"></asp:Label></td>
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
                          <td align="center">
                              <asp:Table ID="tblComapny" runat="server">
                              </asp:Table>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
              </asp:Panel>
              <p>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
