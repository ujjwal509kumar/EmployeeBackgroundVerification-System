<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ReplyToQueries.aspx.cs" Inherits="EmpBackgroundVerify.Admin.ReplyToQueries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<div class="article">
          <h2><span>REPLY TO QUERIES</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 299px">
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 299px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 299px" align="left">
                            <asp:Button ID="btnPostedQueries" runat="server" Text="Posted Queries" 
                                BackColor="White" Font-Bold="True" ForeColor="#2F9BC9" 
                                onclick="btnPostedQueries_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnAnsweresQueries" runat="server" Text="Answered Queries" 
                                BackColor="White" Font-Bold="True" ForeColor="#339FCD" 
                                onclick="btnAnsweresQueries_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 299px" align="right">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 299px" align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
              <p >
                  <table align="center" style="width: 90%;">
                      <tr>
                          <td width="500">
                              <asp:MultiView ID="MultiView1" runat="server">
                                  <asp:View ID="View1" runat="server">
                                      <table style="width:100%;">
                                          <tr>
                                              <td colspan=3 align="center">
                                                 <strong>REPLY TO QUERIES</strong></td>
                                              
                                          </tr>
                                          <tr>
                                              <td colspan=3>
                                                  <hr /></td>
                                              
                                          </tr>
                                          <tr>
                                              <td style="width: 119px">
                                                  Company Name</td>
                                              <td>
                                                  <asp:DropDownList ID="DDLcompany" runat="server" Width="300px" 
                                                      AutoPostBack="True" onselectedindexchanged="DDLcompany_SelectedIndexChanged">
                                                  </asp:DropDownList>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td style="width: 119px">
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td style="width: 119px; height: 22px;" colspan=3 align="left">
                                                  <asp:GridView ID="GVqueries1" runat="server" BackColor="White" 
                                                      BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                                      AutoGenerateColumns="False">
                                                      <Columns>
                                                          <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" />
                                                          <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                                          <asp:BoundField DataField="Query" HeaderText="Query" />
                                                          <asp:BoundField DataField="PostedDate" HeaderText="PostedDate" />
                                                          <asp:TemplateField HeaderText="QueryId">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:Label ID="lblQueryId" runat="server" Text='<%# Eval("QueryId") %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Reply">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:LinkButton ID="LB_Reply" runat="server" 
                                                                      CommandArgument='<%# Eval("QueryId") %>' Font-Bold="True" ForeColor="#990033" 
                                                                      onclick="LB_Reply_Click">REPLY</asp:LinkButton>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:TemplateField HeaderText="Delete">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:LinkButton ID="LB_Delete" runat="server" 
                                                                      CommandArgument='<%# Eval("QueryId") %>' Font-Bold="True" ForeColor="#990033" 
                                                                      onclick="LB_Delete_Click" OnClientClick="return confirm('Are you sure?')">DELETE</asp:LinkButton>
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
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="left" colspan="3" style="width: 119px; height: 22px;">
                                                  &nbsp;</td>
                                          </tr>
                                      </table>
                                  </asp:View>
                                  <br />
                                  <asp:View ID="View2" runat="server">
                                  <table style="width:100%;">
                                          <tr>
                                              <td colspan=3 align="center">
                                                  <strong>ANSWERED QUERIES</strong></td>
                                              
                                          </tr>
                                          <tr>
                                              <td colspan=3>
                                                  <hr /></td>
                                              
                                          </tr>
                                          <tr>
                                              <td style="width: 119px">
                                                  Company Name</td>
                                              <td>
                                                  <asp:DropDownList ID="DDLcompany2" runat="server" Width="300px" 
                                                      AutoPostBack="True" onselectedindexchanged="DDLcompany2_SelectedIndexChanged" 
                                                      >
                                                  </asp:DropDownList>
                                              </td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td style="width: 119px">
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                          <tr>
                                              <td style="width: 119px; height: 22px;" colspan=3 align="left">
                                                  <asp:GridView ID="GVansweredQueries" runat="server" BackColor="White" 
                                                      BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                                      AutoGenerateColumns="False">
                                                      <Columns>
                                                          <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" Visible="False" />
                                                          <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                                          <asp:BoundField DataField="Query" HeaderText="Query" />
                                                          <asp:BoundField DataField="PostedDate" HeaderText="PostedDate" />
                                                          <asp:TemplateField HeaderText="QueryId" Visible="False">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:Label ID="lblQueryId" runat="server" Text='<%# Eval("QueryId") %>'></asp:Label>
                                                              </ItemTemplate>
                                                          </asp:TemplateField>
                                                          <asp:BoundField DataField="Reply" HeaderText="Reply" />
                                                          <asp:BoundField DataField="ReplyDate" HeaderText="ReplyDate" />
                                                          <asp:TemplateField HeaderText="Delete">
                                                              <EditItemTemplate>
                                                                  <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                              </EditItemTemplate>
                                                              <ItemTemplate>
                                                                  <asp:LinkButton ID="LB_Delete2" runat="server" 
                                                                      CommandArgument='<%# Eval("QueryId") %>' Font-Bold="True" 
                                                                      ForeColor="#990033" onclick="LB_Delete2_Click" OnClientClick="return confirm('Are you sure?')">DELETE</asp:LinkButton>
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
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="left" colspan="3" style="width: 119px; height: 22px;">
                                                  &nbsp;</td>
                                          </tr>
                                      </table>
                                  </asp:View>
                                  <br />
                                  <asp:View ID="View3" runat="server">
                                      <table style="width:100%;">
                                          <tr>
                                              <td align="center" style="height: 22px">
                                                  <strong>REPLING TO QUERIES</strong></td>
                                          </tr>
                                          <tr>
                                              <td>
                                              <hr />
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <table style="width:100%;">
                                                      <tr>
                                                          <td style="width: 116px">
                                                              Company Name</td>
                                                          <td>
                                                              <asp:Label ID="lblCompanyName" runat="server"></asp:Label>
                                                          </td>
                                                          <td>
                                                              &nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 116px">
                                                              Query</td>
                                                          <td>
                                                              <asp:Label ID="lblQuery" runat="server"></asp:Label>
                                                          </td>
                                                          <td>
                                                              &nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 116px">
                                                              &nbsp;</td>
                                                          <td>
                                                              Posted Date :
                                                              <asp:Label ID="lblPostedDate" runat="server"></asp:Label>
                                                          </td>
                                                          <td>
                                                              &nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 116px" valign="top">
                                                              Reply</td>
                                                          <td>
                                                              <asp:TextBox ID="txtReply" runat="server" Rows="8" TextMode="MultiLine" 
                                                                  Width="350px"></asp:TextBox>
                                                          </td>
                                                          <td>
                                                              &nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 116px" valign="top">
                                                              &nbsp;</td>
                                                          <td align="right">
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                  ControlToValidate="txtReply" ErrorMessage="Cant be Blank" Font-Italic="True" 
                                                                  ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                          </td>
                                                          <td>
                                                              &nbsp;</td>
                                                      </tr>
                                                      <tr>
                                                          <td style="width: 116px" valign="top">
                                                              &nbsp;</td>
                                                          <td>
                                                              <asp:Button ID="btnReply" runat="server" BackColor="#3CAFC8" Font-Bold="True" 
                                                                  ForeColor="White" Text="POST REPLY" onclick="btnReply_Click" 
                                                                  ValidationGroup="a" />
                                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                              <asp:Button ID="btnOk" runat="server" BackColor="#3CAFC8" Font-Bold="True" 
                                                                  ForeColor="White" Text="OK" Width="120px" ValidationGroup="a" />
                                                          </td>
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
                                              <td>
                                                  &nbsp;</td>
                                          </tr>
                                      </table>
                                      <br />
                                  </asp:View>
                                  <br />
                                  <br />
                              </asp:MultiView>
                          </td>
                      </tr>
                      <tr>
                          <td width="500">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td width="500">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td width="500">
                              &nbsp;</td>
                      </tr>
                  </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
