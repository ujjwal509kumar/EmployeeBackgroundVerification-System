using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class CompanyDetails2 : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string compId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Panel2.Visible = false;
                Panel3.Visible = false;
                DataTable tab_comp = new DataTable();
                if (int.Parse(Session["FLG"].ToString()) != 1)
                {
                    compId = Request.QueryString["cid"].ToString();
                    Panel2.Visible = true;
                    Panel3.Visible = true;
                    tab_comp = b.Company_Get_ComId(compId);
                }
                else
                {
                    compId = Session["COMPID"].ToString();
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    tab_comp = b.Company_Get_ComId_Pending(compId);
                }

               
                if (tab_comp.Rows.Count > 0)
                {
                    lblCompanyName.Text = tab_comp.Rows[0]["CompanyName"].ToString();
                    DVcompanyDetails.DataSource = tab_comp;
                    DVcompanyDetails.DataBind();

                    DataTable tab_emp = b.Employee_GetAll_CompId(compId);
                    GVempDetails.EmptyDataText = "No Employees.";
                    GVempDetails.DataSource = tab_emp;
                    GVempDetails.DataBind();
                }

            }
        }

        protected void LB_EmpId_Click(object sender, EventArgs e)
        {
            int empId = int.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect(string.Format("EmployeeDetails2.aspx?id={0}",empId));
        }
    }
}