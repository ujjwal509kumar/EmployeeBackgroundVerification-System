using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class ConfirmRequest_Outbox : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string FcompId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FcompId = Session["LoginId"].ToString();

                DataTable tab_Tcomp = b.ConfirmOutbox_GetAllReqComp(FcompId);
                if (tab_Tcomp.Rows.Count > 0)
                {
                    DLcompany.DataSource = tab_Tcomp;
                    DLcompany.DataBind();

                    foreach (DataListItem item in DLcompany.Items)
                    {
                        Label Rcompid = (Label)item.FindControl("lblCompId");
                        Label Rcompname = (Label)item.FindControl("lblCompName");
                        DataTable tab_compName = b.Company_Get_ComId(Rcompid.Text);
                        Rcompname.Text = tab_compName.Rows[0]["CompanyName"].ToString();
                        DataList dl_reply = (DataList)item.FindControl("DLreply");

                        DataTable tab_reply = b.ConfirmOutbox_GetAllReq_compId(FcompId, Rcompid.Text);
                        if (tab_reply.Rows.Count > 0)
                        {
                            dl_reply.DataSource = tab_reply;
                            dl_reply.DataBind();
                        }
                    }
                }
                else
                    lblMsg.Text = "No Reply";
            }
        }

        protected void LB_EmpId_Click(object sender, EventArgs e)
        {
            LinkButton lb_empid = (LinkButton)sender;
            Session["EmpId"] = lb_empid.Text;
            Session["flg"] = "3";
            Response.Redirect("EmployeeDetails.aspx");
        }


    }
}