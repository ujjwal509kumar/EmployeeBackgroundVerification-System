<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/EmployeeHome.Master" AutoEventWireup="true" CodeBehind="EmployeeUpdateProfile.aspx.cs" Inherits="EmpBackgroundVerify.Employee.EmployeeUpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

    <div class="article">
          <h2><span>Employees Update Profile</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                     <tr>
                        <td style="width: 346px" align="right">
                           
                         </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="left">
                            <asp:Panel ID="Panel1" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Basic Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">
                            <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Select Company</td>
                                    <td style="width: 257px">
                                        <asp:DropDownList ID="ddlCompany" runat="server" Width="250px" 
                                            AutoPostBack="True" onselectedindexchanged="ddlCompany_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                            ControlToValidate="ddlCompany" ErrorMessage="Select Company" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                                    </td>
                                </tr>
                            <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                      Select Department</td>
                                    <td style="width: 257px">
                                        <asp:DropDownList ID="DDLdept" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                            ControlToValidate="DDLdept" ErrorMessage="Select Department" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;" valign="top">
                                       Select Designation</td>
                                    <td style="width: 257px">
                                        <asp:DropDownList ID="DDLdes" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                            ControlToValidate="DDLdes" ErrorMessage="Select Desigantion" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Employee Name</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtName" ErrorMessage="Enter Employee Name" 
                                            Font-Italic="True" ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtName" ErrorMessage="Employee must have only alphabets" 
                                            Font-Italic="True" ForeColor="Red" ValidationExpression="[A-Za-z ]+" 
                                              >*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;" valign="top">
                                        Address</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtAddress" runat="server" Rows="3" TextMode="MultiLine" 
                                            Width="250px"></asp:TextBox>
                                    </td>
                                    <td valign="top">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtAddress" ErrorMessage="Enter Address" Font-Italic="True" 
                                            ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Mobile Number</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtMobileNo" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtMobileNo" ErrorMessage="Enter Mobile Number" 
                                            Font-Italic="True" ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ControlToValidate="txtMobileNo" ErrorMessage="Enter 10 digit mobile number" 
                                            Font-Italic="True" ForeColor="Red" ValidationExpression="\d{10}" 
                                              >*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Email ID</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtEmailId" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtEmailId" ErrorMessage="Enter Email Id" Font-Italic="True" 
                                            ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="txtEmailId" ErrorMessage="Invalid Email ID" 
                                            Font-Italic="True" ForeColor="Red" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                              >*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Salary/Annum(CTC)</td>
                                    <td style="width: 257px">
                                        <asp:TextBox ID="txtSalary" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="txtSalary" ErrorMessage="Enter CTC" Font-Italic="True" 
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                               <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                       Total Experience</td>
                                    <td style="width: 257px">
                                        <asp:TextBox ID="txtExpr" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtExpr" ErrorMessage="Enter Experience" Font-Italic="True" 
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                               
                                
                                
                                
                                <tr>
                                    <td style="width: 178px; color: #FF0000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 263px">
                                        &nbsp;</td>
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
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnAdd" runat="server" BackColor="White" BorderColor="White" 
                                Font-Bold="True" ForeColor="#3AABD7" Text="ADD" Width="100px" 
                                onclick="btnAdd_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#3AABD7" Text="CANCEL" Width="100px" 
                                onclick="btnCancel_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                Font-Italic="True" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
              <p >
                  
              </p>
          </div>
          <div class="clr"></div>
        </div>
        </form>
</asp:Content>
