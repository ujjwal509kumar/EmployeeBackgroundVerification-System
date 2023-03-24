<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="EmpBackgroundVerify.Company.ManageEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">

    <div class="article">
          <h2><span>Manage Employees</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                     <tr>
                        <td style="width: 346px" align="right">
                            <table style="width: 100%">
                                <tr>
                                    <td colspan=2>
                                        &nbsp;</td>
                                   
                                </tr>
                                <tr>
                                    <td colspan=2>
                                        &nbsp;</td>
                                   
                                </tr>
                                <tr>
                                    <td colspan=2>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                                            ForeColor="Black" NavigateUrl="~/Company/ViewEmployeesDetails.aspx">Click here view EMPLOYEES details</asp:HyperLink>
                                    </td>
                                   
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="RBfresher" runat="server" Checked="True" Font-Bold="True" 
                                            ForeColor="#7F1110" GroupName="a" Text="Fresher" AutoPostBack="True" 
                                            oncheckedchanged="RBfresher_CheckedChanged" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="RBexperienced" runat="server" Font-Bold="True" 
                                            ForeColor="#831312" GroupName="a" Text="Experience" AutoPostBack="True" 
                                            oncheckedchanged="RBexperienced_CheckedChanged" />
                                    </td>
                                </tr>
                            </table>
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
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Date of birth</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtDOB" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtDOB" ErrorMessage="Enter Date of Birth" 
                                            Font-Italic="True" ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                        &nbsp; </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 263px; color: #000000;">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Qualification</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtQuali" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtQuali" ErrorMessage="Enter Qualification" 
                                            Font-Italic="True" ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Aadhar Card Number</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtCardNo" runat="server" Width="250px" 
                                            ontextchanged="txtCardNo_TextChanged" AutoPostBack="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtCardNo" ErrorMessage="Enter Aadhar card Number" 
                                            Font-Italic="True" ForeColor="Red"   >*</asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                            ControlToValidate="txtCardNo" 
                                            ErrorMessage="Aadharcard number must have only numbers" Font-Italic="True" 
                                            ForeColor="Red" ValidationExpression="[0-9 ]+"   >*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 263px">
                                        <asp:Label ID="lblCardStatus" runat="server" Font-Italic="True" 
                                            ForeColor="#FF6600"></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 178px; color: #800000; font-weight: bold;">
                                        Photo</td>
                                    <td style="width: 263px">
                                        <asp:FileUpload ID="FUphoto" runat="server" Width="248px" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="FUphoto" ErrorMessage="Select Photo" Font-Italic="True" 
                                            ForeColor="Red"   >*</asp:RequiredFieldValidator>
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
                        <td style="width: 346px" align="left">
                            <asp:Panel ID="Panel2" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Job Details</strong></span>
                        </legend>
                            <br />
                            <asp:Panel ID="Panel3" runat="server">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 179px; color: #800000; font-weight: bold;">
                                            Employee ID</td>
                                        <td style="width: 260px">
                                            <asp:TextBox ID="txtEmpId" runat="server" Width="250px" AutoPostBack="True" 
                                                ontextchanged="txtEmpId_TextChanged"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                ControlToValidate="txtEmpId" ErrorMessage="Employee ID cant be blank" 
                                                Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 179px; color: #800000; font-weight: bold;">
                                            &nbsp;</td>
                                        <td style="width: 260px">
                                            <asp:Label ID="lblMsg2" runat="server" Font-Italic="True" ForeColor="#CC0066"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <br />
                            <table style="width:100%;">
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Department</td>
                                    <td style="width: 257px">
                                        <asp:DropDownList ID="DDLdept" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToValidate="DDLdept" ErrorMessage="Select Department" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;" valign="top">
                                        Designation</td>
                                    <td style="width: 257px">
                                        <asp:DropDownList ID="DDLdes" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                            ControlToValidate="DDLdes" ErrorMessage="Select Desigantion" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValueToCompare="Select">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Date of joining</td>
                                    <td style="width: 257px">
                                        <asp:TextBox ID="txtDOJ" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="txtDOJ" ErrorMessage="Enter joining date" Font-Italic="True" 
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 257px; color: #000000;">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                                    <td>
                                        &nbsp;</td>
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
                                        Salary Assigned Data and Year</td>
                                    <td style="width: 257px">
                                        <asp:TextBox ID="txtSalaryAssignedDate" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="txtSalaryAssignedDate" 
                                            ErrorMessage="Enter Salary assigned date" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 257px; color: #000000;">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Ratings</td>
                                    <td style="width: 257px">
                                      <asp:DropDownList ID="DDLrating" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                        </asp:DropDownList>
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
                  <table align="center" style="width: 70%;">
                      <tr>
                          <td>
                              <%--<asp:GridView ID="GVdepts" runat="server" BackColor="White" 
                                  BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                                  GridLines="Horizontal" Width="80%" AutoGenerateColumns="False">
                                  <Columns>
                                      <asp:BoundField DataField="DeptId" HeaderText="DeptId" />
                                      <asp:BoundField DataField="DeptName" HeaderText="Dept Name" />
                                      <asp:TemplateField HeaderText="Edit">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Edit" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Edit_Click">EDIT</asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Delete">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LB_Delete" runat="server" 
                                                  CommandArgument='<%# Eval("DeptId") %>' onclick="LB_Delete_Click" OnClientClick="reurn confirm('Are you sure do you want to delete record?')">DELETE</asp:LinkButton>
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
                              </asp:GridView>--%>
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
