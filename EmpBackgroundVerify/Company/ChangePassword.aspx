<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EmpBackgroundVerify.Company.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <form id="form1" runat="server">
    <div class="article">
          <h2><span>Change Password</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
                <table align="center" 
                    style="width: 70%; background-image: url('../images/swat_default_background.jpg');">
                    <tr>
                        <td style="width: 346px">
                             <br /><br /></td>
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
                            <strong>Current Password</strong></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtOld" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtOld" ErrorMessage="Cant be blank" Font-Italic="True" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px">
                            <strong>New Password</strong></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtNew" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtNew" ErrorMessage="Cant be blank" Font-Italic="True" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="left">
                            <strong>Confirm Password</strong></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:TextBox ID="txtConfirm" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtConfirm" ErrorMessage="Cant be blank" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtNew" ControlToValidate="txtConfirm" 
                                ErrorMessage="Password Mismatch" Font-Italic="True" ForeColor="Red"></asp:CompareValidator>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 346px" align="right">
                            <asp:Button ID="btnChange" runat="server" BackColor="White" Font-Bold="True" 
                                ForeColor="#33A0CB" Text="CHANGE PASSWORD" Width="300px" onclick="btnChange_Click" 
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
          </div>
          <div class="clr"></div>
        </div>
</form>
</asp:Content>
