<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="PostQueries.aspx.cs" Inherits="EmpBackgroundVerify.Company.PostQueries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
    <div class="article">
          <h2><span>QUERIES</span></h2>
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
                        <td>
                            <table style="width: 100%">
                                <tr>
                                    <td style="font-size: small; width: 150px" valign="top">
                                        <strong style="color: #000000">Query</strong></td>
                                    <td>
                                        <asp:TextBox ID="txtQuery" runat="server" Rows="8" TextMode="MultiLine" 
                                            Width="386px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 91px">
                                        &nbsp;</td>
                                    <td align="right">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtQuery" ErrorMessage="Enter Query" Font-Italic="True" 
                                            ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnPost" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#1F8DBE" onclick="btnPost_Click" Text="POST QUERY" 
                                ValidationGroup="a" />
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
                              <asp:GridView ID="GVqueries" runat="server" BackColor="White" 
                                  BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
