<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor/HomeMaster.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="EmpBackgroundVerify.Visitor.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
   <div class="article">
          <h2><span>Registration Form</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    
                    
                    style="width: 90%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 143px">
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px">
                            <strong style="color: #000000">Company Name</strong></td>
                        <td>
                            <asp:TextBox ID="txtComName" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtComName" ErrorMessage="Company name cant be blank" 
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtComName" ErrorMessage="Only Alphabets are allowed" 
                                Font-Italic="True" ForeColor="Red" ValidationExpression="[A-Za-z ]+">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left" valign="top">
                            <strong style="color: #000000">Address</strong></td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Rows="3" TextMode="MultiLine" 
                                Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Address cant be blank" 
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">City</strong></td>
                        <td>
                            <asp:DropDownList ID="DDLcity" runat="server" Width="200px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToValidate="DDLcity" ErrorMessage="Select City" Font-Italic="True" 
                                ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Mobile Number</strong></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" 
                                Text="+91"></asp:Label>&nbsp;&nbsp;
                            <asp:TextBox ID="txtMobileNo" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtMobileNo" ErrorMessage="Mobile no. cant be blank" 
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="txtMobileNo" 
                                ErrorMessage="Mobile no. should have only numbers" Font-Bold="False" 
                                Font-Italic="True" ForeColor="Red" ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Email Id</strong></td>
                        <td>
                            <asp:TextBox ID="txtEmailId" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtEmailId" ErrorMessage="Email ID cant be blank" 
                                ForeColor="Red" Font-Italic="True">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="txtEmailId" ErrorMessage="Invalid Email ID" 
                                Font-Italic="True" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Website Address</strong></td>
                        <td>
                            <asp:TextBox ID="txtWebsite" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtWebsite" 
                                ErrorMessage="Website address cant be blank" ForeColor="Red" Font-Italic="True">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="txtWebsite" ErrorMessage="Invalid Website address" 
                                Font-Italic="True" ForeColor="Red" 
                                ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            <strong style="color: #000000">Registrated Date</strong></td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtDate" ErrorMessage="Registered date cant be blank" 
                                ForeColor="Red" Font-Italic="True">*</asp:RequiredFieldValidator>
                        &nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                ControlToValidate="txtDate" ErrorMessage="mm/dd/yyyy" ForeColor="#CC0000" 
                                ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px; font-weight: 700; color: #000000;" align="left" 
                            valign="top">
                            Certificate Photo Copy</td>
                        <td>
                            <asp:FileUpload ID="FUphoto" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="FUphoto" 
                                ErrorMessage="Please upload scan copy of company certificate" ForeColor="Red" 
                                Font-Italic="True">*</asp:RequiredFieldValidator>
                        &nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                ControlToValidate="FUphoto" ErrorMessage="Upload image" ForeColor="#CC0000" 
                                ValidationExpression="^.*\.((j|J)(p|P)(e|E)?(g|G)|(g|G)(i|I)(f|F)|(p|P)(n|N)(g|G))"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 143px; font-weight: 700;" align="left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#33A0CB" Text="REGISTER" Width="140px" onclick="btnRegister_Click" 
                                />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#1C88B9" onclick="btnCancel_Click" Text="CANCEL" Width="140px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="left">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="center">
                            &nbsp;</td>
                        <td>
                           
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 143px" align="center">
                            &nbsp;</td>
                        <td>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                Font-Italic="True" ForeColor="Red" />
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
                              &nbsp;</td>
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
