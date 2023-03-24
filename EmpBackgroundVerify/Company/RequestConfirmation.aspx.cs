using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace EmpBackgroundVerify.Company
{
    public partial class RequestConfirmation : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string compId;
        static string ViwedCompId;
        static string v_compId;
        static string empID;
        static string compName;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                compId = Session["LoginId"].ToString();

                foreach (TableRow row in tblComapny.Rows)
                {
                    tblComapny.Rows.Remove(row);
                }

                DataTable tab_details = b.Request_GetDetails_CompId(compId);
                if (tab_details.Rows.Count > 0)
                {
                    DataTable tab_ReqCompName = b.Request_GetRequestCompName_CompIds(compId);
                    if (tab_ReqCompName.Rows.Count > 0)
                    {
                        DDLcomp.DataSource = tab_ReqCompName;
                        DDLcomp.DataTextField = "CompanyName";
                        DDLcomp.DataValueField = "CompanyId";
                        DDLcomp.DataBind();
                        DDLcomp.Items.Insert(0, "Select");
                    }
                    else
                    {
                        DDLcomp.Items.Insert(0, "None");
                        lblMsg.Text = "No Visitors.";
                    }
                }
                else
                {
                    DDLcomp.Items.Insert(0, "None");
                    lblMsg.Text = "No Visitors.";
                }

            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            CreateDynamicTable();
        }

        protected void DDLcomp_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblComapny.GridLines = GridLines.Both;
            tblComapny.BorderWidth = 2;
            tblComapny.BorderStyle = BorderStyle.Solid;
            tblComapny.BorderColor = System.Drawing.Color.Aqua;

            foreach (TableRow row in tblComapny.Rows)
            {
                tblComapny.Rows.Remove(row);
            }

            if (DDLcomp.SelectedIndex == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Select Company name.')</script>");
            }
            else
            {
                foreach (TableRow row in tblComapny.Rows)
                {
                    tblComapny.Rows.Remove(row);
                }

                v_compId = DDLcomp.SelectedItem.Value;
                compName = DDLcomp.SelectedItem.Text;
                CreateDynamicTable();

            }
        }

        private void CreateDynamicTable()
        {
            DataTable tab_empIds = b.Request_GetEmpIds_Rcompid(v_compId, compId);

            if (tab_empIds.Rows.Count > 0)
            {
                TableRow r1 = new TableRow();
                TableCell c1_1 = new TableCell();
                c1_1.Text = "<b>Visitor Company Name</b>";
                TableCell c1_2 = new TableCell();
                //c1_2.Text = DDLcomp.SelectedItem.Text;
                c1_2.Text = compName;
                r1.Controls.Add(c1_1);
                r1.Controls.Add(c1_2);
                tblComapny.Controls.Add(r1);

                TableRow r2 = new TableRow();
                TableCell c2_1 = new TableCell();
                c2_1.Text = "<b>Employee ID</b>";
                TableCell c2_2 = new TableCell();
                c2_2.Text = null;
                //foreach (DataRow r in tab_empIds.Rows)
                for (int i = 0; i < tab_empIds.Rows.Count; i++)
                {
                    empID = tab_empIds.Rows[i][0].ToString();
                    LinkButton LB = new LinkButton();
                    LB.ID = tab_empIds.Rows[i][0].ToString();
                    LB.Text = tab_empIds.Rows[i][0].ToString() + "<br>";
                    Session["EmpId"] = tab_empIds.Rows[i][0].ToString();
                    LB.Click += new EventHandler(LB_Click);
                    c2_2.Controls.Add(LB);
                }

                r2.Controls.Add(c2_1);
                r2.Controls.Add(c2_2);
                tblComapny.Controls.Add(r2);
            }
            //else
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('No Data');</script>");
        }

        static int flg = 0;

        protected void LB_Click(object sender, EventArgs e)
        {
            LinkButton lb=(LinkButton)sender;
            DataTable tab_reqId = b.Request_GetReqId(compId, v_compId, int.Parse(lb.ID));
            if (tab_reqId.Rows.Count > 0)
            {
                int reqId = int.Parse(tab_reqId.Rows[0]["RequestId"].ToString());
                Session["ReqId"] = reqId;
                Session["flg"] = "1";
            }
            flg = 1;
             Response.Redirect("SendConfirmation.aspx");
        }
    }
}