<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="CompanyHome.aspx.cs" Inherits="EmpBackgroundVerify.Company.CompanyHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
    <div class="article">
          <h2><span>Company Profile</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
                &nbsp;<asp:Panel ID="Panel1" runat="server">
                
                <table align="center" 
                    
                    style="width: 80%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 143px">
                            &nbsp;</td>
                        <td style="width: 344px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px">
                            <strong style="color: #000000">Company Name</strong></td>
                        <td style="width: 344px">
                            <asp:TextBox ID="txtComName" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtComName" ErrorMessage="Company name cant be blank" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtComName" 
                                ErrorMessage="Company name can have only alphabets" Font-Italic="True" 
                                ForeColor="Red" ValidationExpression="[A-Za-z ]+" ValidationGroup="a">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left" valign="top">
                            <strong style="color: #000000">Address</strong></td>
                        <td style="width: 344px">
                            <asp:TextBox ID="txtAddress" runat="server" Rows="3" TextMode="MultiLine" 
                                Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Address cant be blank" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">City</strong></td>
                        <td style="width: 344px">
                            <asp:DropDownList ID="DDLcity" runat="server" Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToValidate="DDLcity" ErrorMessage="Select city" Font-Italic="True" 
                                ForeColor="Red" Operator="NotEqual" ValidationGroup="a" ValueToCompare="Select">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Mobile Number</strong></td>
                        <td style="width: 344px">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="+91"></asp:Label>&nbsp;&nbsp;
                            <asp:TextBox ID="txtMobileNo" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtMobileNo" ErrorMessage="Mobile no. cant be blank" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="txtMobileNo" 
                                ErrorMessage="Mobile no should consist of 10 digits" Font-Italic="True" 
                                ForeColor="Red" ValidationExpression="\d{10}" ValidationGroup="a">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Email Id</strong></td>
                        <td style="width: 344px">
                            <asp:TextBox ID="txtEmailId" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtEmailId" ErrorMessage="Enter email Id" Font-Italic="True" 
                                ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="txtEmailId" ErrorMessage="Invalid email ID format" 
                                Font-Italic="True" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="a">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Website Address</strong></td>
                        <td style="width: 344px">
                            <asp:TextBox ID="txtWebsite" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtWebsite" ErrorMessage="Enter Website Address" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                ControlToValidate="txtWebsite" ErrorMessage="Invalid website Address" 
                                Font-Italic="True" ForeColor="Red" 
                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                                ValidationGroup="a">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Registrated Date</strong></td>
                        <td style="width: 344px">
                            <asp:TextBox ID="txtDate" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtDate" ErrorMessage="Enter registered date" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px; font-weight: 700;" align="left">
                            &nbsp;</td>
                        <td style="width: 344px; color: #000000;">
                            Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            &nbsp;</td>
                        <td style="width: 344px">
                            <asp:Button ID="btnUpdate" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#33A0CB" Text="UPDATE" Width="140px" 
                                onclick="btnUpdate_Click" ValidationGroup="a" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#1C88B9" onclick="btnCancel_Click" Text="CANCEL" Width="140px" 
                                ValidationGroup="a" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            &nbsp;</td>
                        <td style="width: 344px">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="center">
                            &nbsp;</td>
                        <td style="width: 344px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 143px">
                            &nbsp;</td>
                        <td style="width: 344px">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </asp:Panel>
              </p>
              <p >
                  &nbsp;<asp:Panel ID="Panel2" runat="server">
                 
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                              <asp:DetailsView ID="DVcompany" runat="server" BackColor="White" 
                                  BorderColor="#329ECC" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Height="50px" Width="80%" AutoGenerateRows="False">
                                  <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                  <Fields>
                                      <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" />
                                      <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                                      <asp:BoundField DataField="Address" HeaderText="Address" />
                                      <asp:BoundField DataField="CityName" HeaderText="CityName" />
                                      <asp:BoundField DataField="MobileNo" HeaderText="Mobile Number" />
                                      <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                      <asp:BoundField DataField="WebsiteAddress" HeaderText="WebsiteAddress" />
                                      <asp:BoundField DataField="RegisteredDate" HeaderText="RegisteredDate" />
                                      <asp:BoundField DataField="Status" HeaderText="Status" />
                                      <asp:TemplateField HeaderText="Certificate" Visible="False">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <InsertItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </InsertItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_ViewCertificate" runat="server" 
                                                  CommandArgument='<%# Eval("CompanyId") %>' onclick="LB_ViewCertificate_Click">View Certificate</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Fields>
                                  <FooterStyle BackColor="White" ForeColor="#333333" />
                                  <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                  <RowStyle BackColor="White" ForeColor="#333333" />
                              </asp:DetailsView>
                          </td>
                      </tr>
                      <tr>
                          <td align="center">
                           <marquee direction="left" behavior="alternate" scrolldelay="25" ></marquee>
                             <asp:LinkButton ID="LB_UpdateProfile" runat="server" ForeColor="#CC0066" 
                                  onclick="LB_UpdateProfile_Click">Click Here to update your profile</asp:LinkButton>
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
                   </asp:Panel>
              </p>
          </div>
          <div class="clr"></div>
        </div>
        </form>
</asp:Content>
