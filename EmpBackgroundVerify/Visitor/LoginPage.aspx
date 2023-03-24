<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor/HomeMaster.Master" AutoEventWireup="true"
    CodeBehind="LoginPage.aspx.cs" Inherits="EmpBackgroundVerify.Visitor.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="article">
        <h2>
            <span>Login</span></h2>
        <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
        <div class="clr">
        </div>
        <div class="img">
        </div>
        <div class="post_content">
            <p>
                &nbsp;</p>
            <p>
                <table align="center" style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td align="center" style="width: 346px; font-size: large;">
                            <strong>Log In</strong>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            <hr />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                     <td style="width: 182px;">
                          <strong>Select User Type</strong>
                        </td>
                         <td>
                            &nbsp;
                        </td>
                    </tr>
                     <tr>
                       
                        <td style="width: 346px" align="right">
                            <asp:DropDownList ID="ddlUserType" runat="server" Width="300px">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>Company</asp:ListItem>
                                <asp:ListItem>Employee</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlUserType"
                                ErrorMessage="Select User Type" Font-Italic="True" ForeColor="Red" Operator="NotEqual"
                                ValueToCompare="Select">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            <strong>Login ID</strong>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                   
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtLoginId" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoginId"
                                ErrorMessage="Cant be blank" Font-Bold="False" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            <strong>Password</strong>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtPassword" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Cant be blank" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnLogin" runat="server" BackColor="White" Font-Bold="True" ForeColor="#33A0CB"
                                Text="LOGIN" Width="300px" OnClick="btnLogin_Click" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="left">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="center">
                            <asp:Label ID="lblMsg" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </p>
        </div>
        <div class="clr">
        </div>
    </div>
    </form>
</asp:Content>
