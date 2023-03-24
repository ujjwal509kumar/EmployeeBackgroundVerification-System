using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class ReplyToQueries : System.Web.UI.Page
    {
        DB2 b = new DB2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                MultiView1.SetActiveView(View1);
                DataTable tab_comp = b.Reply_GetPostesCompId();
                if (tab_comp.Rows.Count > 0)
                {
                    DDLcompany.DataSource = tab_comp;
                    DDLcompany.DataTextField = "CompanyName";
                    DDLcompany.DataValueField = "CompanyId";
                    DDLcompany.DataBind();
                    DDLcompany.Items.Insert(0,"All");

                    

                    ViewAllPostedQueries();
                }
                else
                    DDLcompany.Items.Insert(0, "None");
            }
        }

        protected void btnPostedQueries_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);

            ViewAllPostedQueries();
        }

        private void ViewAllPostedQueries()
        {
            GVqueries1.EmptyDataText = "No Queries";
            GVqueries1.DataSource = b.Reply_GetAllQueries();
            GVqueries1.DataBind();
        }

        protected void btnAnsweresQueries_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
            DataTable tab_comp = b.Reply_GetAnsQueryCompId();
            if (tab_comp.Rows.Count > 0)
            {
                DDLcompany2.DataSource = tab_comp;
                DDLcompany2.DataTextField = "CompanyName";
                DDLcompany2.DataValueField = "CompanyId";
                DDLcompany2.DataBind();
                DDLcompany2.Items.Insert(0, "All");

                ViewAllPostedQueries();
            }
            else
                DDLcompany2.Items.Insert(0, "None");

            ViewAllAnsweredQueries();
        }

        private void ViewAllAnsweredQueries()
        {
            GVansweredQueries.EmptyDataText = "No Queries";
            GVansweredQueries.DataSource = b.Reply_GetAllAnsQueries();
            GVansweredQueries.DataBind();
        }

        protected void DDLcompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLcompany.SelectedIndex == 0)
            {
                ViewAllPostedQueries();
            }
            else
            {
                GVqueries1.EmptyDataText = "No Queries";
                GVqueries1.DataSource = b.Reply_GetQueries_compId(DDLcompany.SelectedItem.Value);
                GVqueries1.DataBind();
            }
        }

        static int qId;

        protected void LB_Reply_Click(object sender, EventArgs e)
        {
            qId = int.Parse(((LinkButton)sender).CommandArgument);
            DataTable tab_query = b.Reply_GetQueries_QueryId(qId);
            if (tab_query.Rows.Count > 0)
            {
                lblCompanyName.Text = tab_query.Rows[0]["CompanyName"].ToString();
                lblPostedDate.Text = tab_query.Rows[0]["PostedDate"].ToString();
                lblQuery.Text = tab_query.Rows[0]["Query"].ToString();
                lblQuery.Text = lblQuery.Text.Replace("''", "'");
                lblQuery.Text = lblQuery.Text.Replace("<br>", "\n");
                MultiView1.SetActiveView(View3);
            }
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            qId = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Reply_Delete_QueryId(qId) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Record deleted successfully.')</script>");
                ViewAllPostedQueries();
                DDLcompany.SelectedIndex = 0;
                MultiView1.SetActiveView(View1);
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting record.')</script>");
        }

        protected void LB_Delete2_Click(object sender, EventArgs e)
        {
            qId = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Reply_Delete_QueryId(qId) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Record deleted successfully.')</script>");
                ViewAllAnsweredQueries();
                DDLcompany2.SelectedIndex = 0;
                MultiView1.SetActiveView(View2);
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting record.')</script>");
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            txtReply.Text=txtReply.Text.Replace("'","''");
            txtReply.Text=txtReply.Text.Replace("<br>","\n");

            if (b.Reply_SendReply(qId, txtReply.Text) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Reply sent successfully.')</script>");
                ViewAllAnsweredQueries();
                DDLcompany.SelectedIndex = 0;
                MultiView1.SetActiveView(View2);
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in sending reply.')</script>");

        }

        protected void DDLcompany2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLcompany2.SelectedIndex == 0)
            {
                ViewAllAnsweredQueries();
            }
            else
            {
                GVansweredQueries.EmptyDataText = "No Queries";
                GVansweredQueries.DataSource = b.Reply_GetAnsQueries_compId(DDLcompany2.SelectedItem.Value);
                GVansweredQueries.DataBind();
            }
        }
    }
}