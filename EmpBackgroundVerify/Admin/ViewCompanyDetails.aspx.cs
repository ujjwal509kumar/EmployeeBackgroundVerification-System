using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class ViewCompanyDetails : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static DataTable tab_city = new DataTable();
        static DataTable tab_comp = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                tab_city = b.Cities_GetAll();
                if (tab_city.Rows.Count > 0)
                {
                    DDLcity.DataSource = tab_city;
                    DDLcity.DataTextField = "CityName";
                    DDLcity.DataValueField = "CityId";
                    DDLcity.DataBind();
                    DDLcity.Items.Insert(0, "All");
                    lblMsg.Text = "";

                    ViewAllCompanies();
                }
                else
                {
                    DDLcity.Items.Insert(0, "None");
                    lblMsg.Text = "No Data.";
                }

                DDLcompany.Items.Insert(0, "None");
            }
        }

        protected void DDLcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLcity.SelectedIndex == 0)
            {
                ViewAllCompanies();
                DDLcompany.Items.Clear();
                DDLcompany.Items.Insert(0, "None");
            }
            else
            {
                tab_comp = b.Company_GetApproved_CityId(int.Parse(DDLcity.SelectedItem.Value));
                if (tab_comp.Rows.Count > 0)
                {
                    DDLcompany.DataSource = tab_comp;
                    DDLcompany.DataTextField = "CompanyName";
                    DDLcompany.DataValueField = "CompanyId";
                    DDLcompany.DataBind();
                    DDLcompany.Items.Insert(0, "All");

                    GVcompanies.EmptyDataText = "No Data.";
                    GVcompanies.DataSource = tab_comp;
                    GVcompanies.DataBind();
                }

            }
        }

        private void ViewAllCompanies()
        {
            tab_comp = b.Company_GetAll_Approved();
            if (tab_comp.Rows.Count > 0)
            {
                GVcompanies.EmptyDataText = "No Data.";
                GVcompanies.DataSource = tab_comp;
                GVcompanies.DataBind();

                lblMsg.Text = "";
            }
            else
            {
                lblMsg.Text = "No Data.";
            }
        }

        protected void DDLcompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLcity.SelectedIndex != 0 && DDLcompany.SelectedIndex == 0)
            {
                tab_comp = b.Company_GetApproved_CityId(int.Parse(DDLcity.SelectedItem.Value));
                if (tab_comp.Rows.Count > 0)
                {
                    GVcompanies.EmptyDataText = "No Data.";
                    GVcompanies.DataSource = tab_comp;
                    GVcompanies.DataBind();
                }
            }
            else
                if (DDLcity.SelectedIndex != 0 && DDLcompany.SelectedIndex != 0)
                {
                    tab_comp = b.Company_GetApproved_CityIdCompId(int.Parse(DDLcity.SelectedItem.Value), DDLcompany.SelectedItem.Value);
                    if (tab_comp.Rows.Count > 0)
                    {
                        GVcompanies.EmptyDataText = "No Data.";
                        GVcompanies.DataSource = tab_comp;
                        GVcompanies.DataBind();
                    }
                }
                else
                    if (DDLcity.SelectedIndex == 0 && DDLcompany.SelectedIndex == 0)
                    {
                        ViewAllCompanies();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Select City first, then select company.')<script>");
                    }

        }

        static string compId;

        protected void LB_CompanyId_Click(object sender, EventArgs e)
        {
            compId = ((LinkButton)sender).CommandArgument;
            Session["FLG"] = 0;
            Response.Redirect(string.Format("CompanyDetails2.aspx?cid={0}", compId));
        }

        protected void LB_ViewEmpDetails_Click(object sender, EventArgs e)
        {
            compId = ((LinkButton)sender).CommandArgument;
            Session["FLG"] = 0;
            Response.Redirect(string.Format("CompanyDetails2.aspx?cid={0}", compId));
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            compId = ((LinkButton)sender).CommandArgument;
            try
            {
                if (b.Request_Delete_CompId(compId) > 0)
                {
                    if (b.Company_Delete_CompId(compId) == 1)
                    {
                        ViewAllCompanies();
                        //resetting DLLs
                        tab_comp = b.Company_GetApproved_CityId(int.Parse(DDLcity.SelectedItem.Value));
                        if (tab_comp.Rows.Count > 0)
                        {
                            DDLcompany.DataSource = tab_comp;
                            DDLcompany.DataTextField = "CompanyName";
                            DDLcompany.DataValueField = "CompanyId";
                            DDLcompany.DataBind();
                            DDLcompany.Items.Insert(0, "All");

                            GVcompanies.EmptyDataText = "No Data.";
                            GVcompanies.DataSource = tab_comp;
                            GVcompanies.DataBind();
                        }

                        ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Record deleted successfully.')<script>");
                    }
                    else
                        ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting record.')<script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting record(company request).')<script>");
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting record.')<script>");
            }
        }
    }
}