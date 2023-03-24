<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="EmpBackgroundVerify.Admin.ViewCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form id="form1" runat="server">
<div class="article">
          <h2><span>Company Registration Certificate</span></h2>
          <%--<p class="infopost">Posted on <span class="date">11 sep 2018</span> by <a href="#">Admin</a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="#" class="com"><span>11</span></a></p>--%>
          <div class="clr"></div>
          
          <div class="post_content">
            <p >
            <br /><br /><br />
                <asp:Image ID="Image1" runat="server" Height="500px" Width="500px" />
              </p>
              <p >
                  <asp:Button ID="btnClose" runat="server" onclick="btnClose_Click" 
                      Text="Close" />
              </p>
          </div>
          <div class="clr"></div>
        </div>
        </form>
</asp:Content>
