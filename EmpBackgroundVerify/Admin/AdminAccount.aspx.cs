using System;
using System.Collections.Generic;
////using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpBackgroundVerify.Admin
{
    public partial class AdminAccount : System.Web.UI.Page
    {
        DB2 b2 = new DB2();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (txtOld.Text == Session["Password"].ToString())
            {
                if (b2.Admin_ChangePassword(txtConfirm.Text, Session["LoginId"].ToString()) == 1)
                {
                    lblMsg.Text = "";
                    Session["Password"] = txtConfirm.Text;
                    txtOld.Text = "";
                    txtNew.Text = "";
                    txtConfirm.Text = "";
                    Response.Write("<script>alert('Password changed successfully.')</script>");
                }
                else
                    lblMsg.Text = "Error in chnaging password.";
            }
            else
                lblMsg.Text = "Please enter correct current password.";
        }
    }
}