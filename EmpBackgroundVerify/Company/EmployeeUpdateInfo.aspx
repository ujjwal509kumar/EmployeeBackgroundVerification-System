<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeUpdateInfo.aspx.cs" Inherits="EmpBackgroundVerify.Company.EmployeeUpdateInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <form id="form1" runat="server">
       
    
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;<asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                     <div class="article">
          <h2>Update<span> Employee profile</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
             <br /><br />
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    
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
                                    <td style="width: 149px; font-weight: bold;">
                                        Employee Name</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtName" ErrorMessage="Employee name cant be blank" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="txtName" 
                                            ErrorMessage="Employee name must consist of only alphabets" Font-Italic="True" 
                                            ForeColor="Red" ValidationExpression="[A-Za-z ]+" ValidationGroup="a">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;" valign="top">
                                        Address</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtAddress" runat="server" Rows="3" TextMode="MultiLine" 
                                            Width="250px" style="color: #000000"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="txtAddress" ErrorMessage="Address cant be blank" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        Mobile Number</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtMobileNo" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="txtMobileNo" ErrorMessage="Mobile No. cant be blank" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                            ControlToValidate="txtMobileNo" 
                                            ErrorMessage="Mobile no. must consist to 10 digitd" Font-Italic="True" 
                                            ForeColor="Red" ValidationExpression="\d{10}" ValidationGroup="a">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        Email ID</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtEmailId" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="txtEmailId" ErrorMessage="Email ID cant be blank" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            ControlToValidate="txtEmailId" ErrorMessage="Invalid Email Id" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a" 
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        Date of birth</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtDOB" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtDOB" ErrorMessage="DOB cant be blank" Font-Italic="True" 
                                            ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 263px">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        Qualification</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtQuali" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtQuali" ErrorMessage="Enter Qualification" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; font-weight: bold;">
                                        Aadhar Card Number</td>
                                    <td style="width: 263px">
                                        <asp:TextBox ID="txtCardNo" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtCardNo" ErrorMessage="Enter Aadhar card number" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                        &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                            ControlToValidate="txtCardNo" 
                                            ErrorMessage="Aadhar card number must contain only numbers" Font-Italic="True" 
                                            ForeColor="Red" ValidationExpression="[0-9]+" ValidationGroup="a">*</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; color: #800000; font-weight: bold;">
                                        <asp:Label ID="lblPhoto" runat="server" Text="Photo" style="color: #000000"></asp:Label>
                                    </td>
                                    <td style="width: 263px">
                                        <asp:FileUpload ID="FUphoto" runat="server" Width="248px" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="FUphoto" ErrorMessage="Select Photo" Font-Italic="True" 
                                            ForeColor="Red" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 149px; color: #FF0000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 263px">
                                        <asp:LinkButton ID="LB_ChangePhoto" runat="server" Font-Bold="True" 
                                            ForeColor="White" onclick="LB_ChangePhoto_Click">Change Photo</asp:LinkButton>
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
                        <td style="width: 346px" align="left">
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnUpdateProfile" runat="server" BackColor="White" BorderColor="White" 
                                Font-Bold="True" ForeColor="#3AABD7" Text="UPDATE PROFILE" Width="150px" 
                                onclick="btnUpdateProfile_Click" ValidationGroup="a" 
                                 />
&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#3AABD7" Text="CANCEL" Width="100px" 
                                onclick="btnCancel_Click" ValidationGroup="a" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 346px">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="a" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 346px">
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
              
          </div>
          <div class="clr"></div>
        </div>
                    </asp:View>
                    <br />
                    <br />
                    <asp:View ID="View2" runat="server">
                        <div class="article">
          <h2><span>update Employee designation</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                   
                    <tr>
                        <td style="width: 346px" align="left">
                            <asp:Panel ID="Panel3" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>
                            Desigantion Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">
                                <tr>
                                    <td style="width: 151px; color: #800000; font-weight: bold;">
                                        Department</td>
                                    <td style="width: 265px">
                                        <asp:DropDownList ID="DDLdept" runat="server" Width="250px" 
                                            onselectedindexchanged="DDLdept_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToValidate="DDLdept" ErrorMessage="Select Department" Font-Bold="False" 
                                            Font-Italic="True" ForeColor="Red" Operator="NotEqual" ValidationGroup="b" 
                                            ValueToCompare="Select"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 151px; color: #800000; font-weight: bold;" valign="top">
                                        Designation</td>
                                    <td style="width: 265px">
                                        <asp:DropDownList ID="DDLdes" runat="server" Width="250px">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                            ControlToValidate="DDLdes" ErrorMessage="Select Designation" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValidationGroup="b" ValueToCompare="Select"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 151px; color: #800000; font-weight: bold;">
                                        Promoted Data and Year</td>
                                    <td style="width: 265px">
                                        <asp:TextBox ID="txtDOJ" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="txtDOJ" ErrorMessage="Enter promoted date" 
                                            Font-Italic="True" ForeColor="Red" ValidationGroup="b"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 151px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 265px">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
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
                            <asp:Button ID="btnUpdateDesignation" runat="server" Font-Bold="True" 
                                onclick="btnUpdateDesignation_Click" Text="UPDATE DESIGNATION" 
                                BackColor="White" BorderColor="White" ForeColor="#42A8D0" 
                                ValidationGroup="b" />
                            &nbsp; &nbsp;&nbsp;
                            <asp:Button ID="Button1" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#3AABD7" Text="CANCEL" Width="100px" 
                                onclick="btnCancel_Click" ValidationGroup="b" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
                    
                    </asp:View>
                    <br />
                    <br />
                    <asp:View ID="View3" runat="server">
                        <div class="article">
          <h2><span>Update employee Salary</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    
                    <tr>
                        <td style="width: 346px" align="left">
                            <asp:Panel ID="Panel4" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Salary Details</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">
                               
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Salary/Annum(CTC)</td>
                                    <td style="width: 259px">
                                        <asp:TextBox ID="txtSalary" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                            ControlToValidate="txtSalary" ErrorMessage="Enter Salary" Font-Italic="True" 
                                            ForeColor="Red" ValidationGroup="c"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Salary Assigned Data and Year</td>
                                    <td style="width: 259px">
                                        <asp:TextBox ID="txtSalaryAssignedDate" runat="server" Width="250px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="txtSalaryAssignedDate" 
                                            ErrorMessage="Enter Salary assigned Date" Font-Italic="True" ForeColor="Red" 
                                            ValidationGroup="c"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        &nbsp;</td>
                                    <td style="width: 259px">
                                        Date format- mm/dd/yyyy [ex:3/12/2015]</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;">
                                        Ratings</td>
                                    <td style="width: 259px">
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
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                            ControlToValidate="DDLrating" ErrorMessage="Select ratings" Font-Italic="True" 
                                            ForeColor="Red" Operator="NotEqual" ValidationGroup="c" ValueToCompare="Select"></asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnUpdateSalary" runat="server" BackColor="White" BorderColor="White" 
                                Font-Bold="True" ForeColor="#3AABD7" Text="UPDATE SALARY" Width="150px" 
                                onclick="btnUpdateSalary_Click" ValidationGroup="c" 
                               />
&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#3AABD7" Text="CANCEL" Width="100px" 
                                onclick="btnCancel_Click" ValidationGroup="c" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="Label2" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
                        <br />
                        <br />
                    </asp:View>
                    <br />
                    <br />
                    <asp:View ID="View4" runat="server">
                        <div class="article">
          <h2><span>Update employee Status</span></h2>
          
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    
                    <tr>
                        <td style="width: 346px" align="left">
                            <asp:Panel ID="Panel2" runat="server">
                            
                        <fieldset style="width:550px">
                        <legend style="color:Black;">
                            <span style="background-color:#7cb4c2; color:Black; font-size: medium;"><strong>Update Employee Status</strong></span>
                        </legend>
                            <br />
                            <table style="width:100%;">
                               
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LB_Left" runat="server" Font-Bold="True"  
                                            onclick="LB_Left_Click">Click here update work status as LEFT</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 182px; color: #800000; font-weight: bold;" colspan=2>
                                        <asp:Panel ID="Panel_UpdateStatus" runat="server" Width="547px">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="width: 169px">
                                                        Quit Date</td>
                                                    <td>
                                                        <asp:TextBox ID="txtQuitDate" runat="server" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                            ControlToValidate="txtQuitDate" ErrorMessage="Enter quit date" 
                                                            Font-Italic="True" ForeColor="Red" ValidationGroup="d">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 169px">
                                                        &nbsp;</td>
                                                    <td style="color: #000000">
                                                        <span style="font-weight: normal">Date format- mm/dd/yyyy [ex:3/12/2015]</span></td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 169px" valign="top">
                                                        Quit Reason</td>
                                                    <td>
                                                        <asp:TextBox ID="txtQuitReason" runat="server" Height="106px" Rows="5" 
                                                            TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                    </td>
                                                    <td valign="top">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                                            ControlToValidate="txtQuitReason" ErrorMessage="Enter quit reason" 
                                                            Font-Italic="True" ForeColor="Red" ValidationGroup="d">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 169px">
                                                        Over all performance rating</td>
                                                    <td>
                                                     <asp:DropDownList ID="DDLrating2" runat="server">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                        </asp:DropDownList>
                                                     </td>
                                                    <td>
                                                        <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                                            ControlToValidate="DDLrating2" ErrorMessage="Select overall performance rating" 
                                                            Font-Italic="True" ForeColor="#CC0000" Operator="NotEqual" ValidationGroup="d" 
                                                            ValueToCompare="Select">*</asp:CompareValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </fieldset>
                        </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnUpdateStatus" runat="server" BackColor="White" BorderColor="White" 
                                Font-Bold="True" ForeColor="#3AABD7" Text="UPDATE STATUS" Width="150px" 
                                onclick="btnUpdateStatus_Click" ValidationGroup="d" 
                               />
&nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#3AABD7" Text="CANCEL" Width="100px" 
                                onclick="btnCancel_Click" ValidationGroup="d" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="Label3" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 346px">
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                Font-Italic="True" ForeColor="Red" ValidationGroup="d" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 346px">
                            &nbsp;</td>
                    </tr>
                </table>
              </p>
          </div>
          <div class="clr"></div>
        </div>
                        <br />
                        <br />
                    </asp:View>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</form>
</asp:Content>
