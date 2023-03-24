using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class CompanyHome : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string comId;
        static DataTable tab = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                    DataTable tab_City = b.Cities_GetAll();
                    if (tab_City.Rows.Count > 0)
                    {
                        DDLcity.DataSource = tab_City;
                        DDLcity.DataTextField = "CityName";
                        DDLcity.DataValueField = "CityId";
                        DDLcity.DataBind();
                    }
                    DDLcity.Items.Insert(0, "Select");

               Panel1.Visible = false;
               Panel2.Visible = true;
               comId=Session["LoginId"].ToString();
               BindCompany();
            }
        }

        private void BindCompany()
        {
            tab = b.Company_Get_ComId(comId);
            if (tab.Rows.Count > 0)
            {
                DVcompany.DataSource = tab;
                DVcompany.DataBind();
            }
        }

        protected void LB_ViewCertificate_Click(object sender, EventArgs e)
        {

        }

        protected void LB_UpdateProfile_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            txtComName.Text = tab.Rows[0]["CompanyName"].ToString();
            txtAddress.Text = tab.Rows[0]["Address"].ToString();
            txtAddress.Text = txtAddress.Text.Replace("<br>","\n");
            txtAddress.Text = txtAddress.Text.Replace("''", "'");
            txtEmailId.Text = tab.Rows[0]["EmailId"].ToString();
            txtMobileNo.Text = tab.Rows[0]["MobileNo"].ToString();
            txtWebsite.Text = tab.Rows[0]["WebsiteAddress"].ToString();
            txtDate.Text = tab.Rows[0]["RegisteredDate"].ToString();
            string cityid = tab.Rows[0]["CityId"].ToString();
            string cityname = tab.Rows[0]["CityName"].ToString();
            ListItem L = new ListItem(cityname,cityid);
            DDLcity.SelectedIndex = DDLcity.Items.IndexOf(L);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            txtAddress.Text = txtAddress.Text.Replace("'", "''");
            txtAddress.Text = txtAddress.Text.Replace("\n", "<br>");

            if (b.Company_Update(comId,txtComName.Text.ToUpper(), txtAddress.Text, txtMobileNo.Text, int.Parse(DDLcity.SelectedItem.Value), txtEmailId.Text, txtWebsite.Text, txtDate.Text) == 1)
            {
                Clear();
                BindCompany();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company profile updated successfully')</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updating company profile.')</script>");

            Panel1.Visible = false;
            Panel2.Visible = true;

        }

        private void Clear()
        {
            txtAddress.Text = "";
            txtComName.Text = "";
            txtDate.Text = "";
            txtEmailId.Text = "";
            txtMobileNo.Text = "";
            txtWebsite.Text = "";
            DDLcity.SelectedIndex = 0;
        }
    }
}