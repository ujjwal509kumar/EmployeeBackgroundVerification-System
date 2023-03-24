using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Employee
{
    public partial class EmployeeUpdateProfile : System.Web.UI.Page
    {
        DB2 b = new DB2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable tab_Company = b.GetCompanyDetails();
                ddlCompany.DataSource = tab_Company;
                ddlCompany.DataTextField = "CompanyName";
                ddlCompany.DataValueField = "CompanyId";
                ddlCompany.DataBind();
                ddlCompany.Items.Insert(0, "Select");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (b.Employee_SelfUpdateProfile(int.Parse(Session["LoginId"].ToString()),ddlCompany.SelectedItem.Value,int.Parse(DDLdept.SelectedItem.Value),int.Parse(DDLdes.SelectedItem.Value), txtName.Text.ToUpper(),txtAddress.Text, txtMobileNo.Text, txtEmailId.Text, int.Parse(txtExpr.Text),int.Parse(txtSalary.Text)) == 1)
            {
                txtAddress.Text = "";
                txtEmailId.Text = "";
                txtMobileNo.Text = "";
                txtName.Text = "";
                DDLdept.SelectedIndex = 0;
                DDLdes.SelectedIndex = 0;
                ddlCompany.SelectedIndex = 0;
                txtExpr.Text = "";
                lblMsg.Text = "";
                txtSalary.Text = "";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable tab_dept = b.Dept_Get_CompId(ddlCompany.SelectedItem.Value);
                DDLdept.DataSource = tab_dept;
                DDLdept.DataTextField = "DeptName";
                DDLdept.DataValueField = "DeptId";
                DDLdept.DataBind();
                DDLdept.Items.Insert(0, "Select");

                DataTable tab_des = b.Desg_Get_CompId(ddlCompany.SelectedItem.Value);
                DDLdes.DataSource = tab_des;
                DDLdes.DataTextField = "Designation";
                DDLdes.DataValueField = "DesId";
                DDLdes.DataBind();
                DDLdes.Items.Insert(0, "Select");
            }
            catch
            {
 
            }
        }
    }
}