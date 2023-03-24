using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class VisitorDetails : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string compId;
        static string ViwedCompId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                compId = Session["LoginId"].ToString();

                DataTable tab_details = b.Visitor_GetDetails_CompId(compId);
                if (tab_details.Rows.Count > 0)
                {
                    DataTable tab_visitorName = b.Visitor_GetViewerCompName_CompIds(compId);
                    if (tab_visitorName.Rows.Count > 0)
                    {
                        DDLcomp.DataSource = tab_visitorName;
                        DDLcomp.DataTextField = "CompanyName";
                        DDLcomp.DataValueField = "CompanyId";
                        DDLcomp.DataBind();
                        DDLcomp.Items.Insert(0, "Select");
                    }
                }
                else
                {
                    DDLcomp.Items.Insert(0, "None");
                    lblMsg.Text = "No Visitors.";
                }

            }
        }

        protected void DDLcomp_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblComapny.GridLines = GridLines.Both;
            tblComapny.BorderWidth = 2;
            tblComapny.BorderStyle = BorderStyle.Solid;
            tblComapny.BorderColor = System.Drawing.Color.Aqua;

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

                string v_compId = DDLcomp.SelectedItem.Value;
                DataTable tab_empIds = b.Visitor_GetEmpIds_Vcompid(v_compId, compId);

                if (tab_empIds.Rows.Count > 0)
                {
                    TableRow r1 = new TableRow();
                    TableCell c1_1 = new TableCell();
                    c1_1.Text="<b>Visitor Company Name</b>";
                    TableCell c1_2 = new TableCell();
                    c1_2.Text = DDLcomp.SelectedItem.Text;
                    r1.Controls.Add(c1_1);
                    r1.Controls.Add(c1_2);
                    tblComapny.Controls.Add(r1);

                    TableRow r2 = new TableRow();
                    TableCell c2_1 = new TableCell();
                    c2_1.Text = "<b>Employee ID</b>";
                    TableCell c2_2 = new TableCell();
                    c2_2.Text=null;
                    //foreach (DataRow r in tab_empIds.Rows)
                    for(int i=0;i<tab_empIds.Rows.Count;i++)
                    {
                        //c2_2.Text = c2_2.Text + tab_empIds.Rows[i][0].ToString()+"<br>";
                        HyperLink h = new HyperLink();
                        h.ID = "h" + (i + 1);
                        h.Text = tab_empIds.Rows[i][0].ToString()+"<br>";
                        Session["EmpId"]=tab_empIds.Rows[i][0].ToString();
                        h.NavigateUrl = "EmployeeDetails.aspx";
                        c2_2.Controls.Add(h);
                    }

                    r2.Controls.Add(c2_1);
                    r2.Controls.Add(c2_2);
                    tblComapny.Controls.Add(r2);
                }
                else
                    ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('No Data');</script>");

            }
        }
    }
}