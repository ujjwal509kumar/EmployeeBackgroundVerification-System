<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminManageCities.aspx.cs" Inherits="EmpBackgroundVerify.Admin.AdminManageCities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
<script type="text/javascript">
//    {
//        $(document).ready(function () {
//            $('#btnCancel').click(
//            function () {
//                $("#<%=txtCity.ClientID%>").val('');
//            });
//        });

//        function validate() {

//            var textField = $('#<%= txtCity.ClientID %>').val();

//            if (textField == "") {
//                $('#<%=lblMsg.ClientID%>').html('Enter the CityName');
//                return false;
//            }
//            return true;
//        }


//    }
    </script>

<div class="article">
          <h2><span>Manage Cities</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 346px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            <strong>City Name</strong></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtCity" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtCity" ErrorMessage="Cant be blank" Font-Italic="True" 
                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtCity" ErrorMessage="Only alphabets are allowed" 
                                Font-Italic="True" ForeColor="Red" ValidationExpression="[A-Za-z ]+" 
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnAdd" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#33A0CB" Text="ADD" Width="300px" onclick="btnAdd_Click" ValidationGroup="a" 
                                />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
              <p >
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                              <asp:GridView ID="GVcities" runat="server" BackColor="White" 
                                  BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Width="80%" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:BoundField DataField="CityId" HeaderText="CityId" Visible="False" />
                                      <asp:BoundField DataField="CityName" HeaderText="City Name" />
                                      <asp:TemplateField HeaderText="Edit">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Edit" runat="server" 
                                                  CommandArgument='<%# Eval("CityId") %>' onclick="LB_Edit_Click">EDIT</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Delete">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Delete" runat="server" 
                                                  CommandArgument='<%# Eval("CityId") %>' onclick="LB_Delete_Click" OnClientClick="return confirm('Are you sure do you want to delete record?')">DELETE</asp:LinkButton>
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
                              &nbsp;</td>
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
