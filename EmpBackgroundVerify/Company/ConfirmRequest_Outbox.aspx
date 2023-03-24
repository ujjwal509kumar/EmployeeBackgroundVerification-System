<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ConfirmRequest_Outbox.aspx.cs" Inherits="EmpBackgroundVerify.Company.ConfirmRequest_Outbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<div class="article">
          <h2><span>Confirmation Request Outbox</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td>
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            
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
                      <tr>
                          <td align="center">
                              <asp:DataList ID="DLcompany" runat="server" CellPadding="4" ForeColor="#333333" 
                                  Width="550px">
                                  <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                  <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                  <ItemTemplate>
                                      <table style="width:100%;">
                                          <tr>
                                              <td align="left" >
                                                  <span style="color: #000000">COMPANY NAME&nbsp; :&nbsp;&nbsp; </span>&nbsp;<asp:Label 
                                                      ID="lblCompName" runat="server" ForeColor="#990033"></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="left" valign="top">
                                                  <span style="color: #000000">COMPANY ID&nbsp; : </span>&nbsp;
                                                  <asp:Label ID="lblCompId" runat="server" Text='<%# Eval("RequestTo") %>' 
                                                      ForeColor="#990033"></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="left" >
                                              <asp:DataList ID="DLreply" runat="server" Width="500px">
                                                      <ItemTemplate>
                                                          <table border="1" style="width: 100%">
                                                              <tr>
                                                                  <td valign="top" width="100" align="center">
                                                                      <asp:LinkButton ID="LB_EmpId" runat="server" 
                                                                          CommandArgument='<%# Eval("EmpId") %>' onclick="LB_EmpId_Click" 
                                                                          Text='<%# Eval("EmpId") %>'></asp:LinkButton>
                                                                  </td>
                                                                  <td>
                                                                      &nbsp;<asp:Label ID="lblReply" runat="server" Text='<%# Eval("Reply") %>' 
                                                                          ForeColor="Black"></asp:Label>
                                                                      &nbsp;</td>
                                                              </tr>
                                                             
                                                          </table>
                                                      </ItemTemplate>
                                                  </asp:DataList>
                                              </td>
                                          </tr>
                                           <tr>
                                                                <td>
                                                                <hr />
                                                                </td>
                                                              </tr>
                                      </table>
                                  </ItemTemplate>
                                  <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                              </asp:DataList>
                          </td>
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
