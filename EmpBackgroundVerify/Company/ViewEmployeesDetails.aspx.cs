using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class ViewEmployeesDetails : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string compId;
        static DataTable tab_emps = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                compId = Session["LoginId"].ToString();
                DataTable tab_dept = b.Dept_Get_CompId(compId);
                DDLdept.DataSource = tab_dept;
                DDLdept.DataTextField = "DeptName";
                DDLdept.DataValueField = "DeptId";
                DDLdept.DataBind();
                DDLdept.Items.Insert(0, "All");

                DDLdes.Items.Insert(0, "None");

                ViewAllEmps();
            }
        }

        protected void DDLdept_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLdes.Items.Clear();
            if (DDLdept.SelectedItem.Text != "All")
            {
                DataTable tab_des_dept = b.EmpView_Des_DeptId(int.Parse(DDLdept.SelectedItem.Value), compId);
                if (tab_des_dept.Rows.Count > 0)
                {
                    DDLdes.DataSource = tab_des_dept;
                    DDLdes.DataTextField = "Designation";
                    DDLdes.DataValueField = "DesId";
                    DDLdes.DataBind();
                    DDLdes.Items.Insert(0, "All");

                }
                else
                    DDLdes.Items.Insert(0, "None");
            }
            else
            {
                DDLdes.Items.Insert(0, "None");
                ViewAllEmps();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (DDLdept.SelectedIndex == 0 && DDLdes.SelectedIndex == 0)// view all emps details
            {
                ViewAllEmps();
            }
            else
                if (DDLdept.SelectedIndex != 0 && DDLdes.SelectedIndex == 0)// view particular dept emp details
                {
                    tab_emps = b.Employee_GetAll_CompId_DeptId(compId,int.Parse(DDLdept.SelectedItem.Value));
                    GVemps.EmptyDataText = "No Data";
                    GVemps.DataSource = tab_emps;
                    GVemps.DataBind();
                }
                else
                    if (DDLdept.SelectedIndex != 0 && DDLdes.SelectedIndex != 0)// view particular dept emp details
                    {
                        tab_emps = b.Employee_GetAll_CompId_DeptId_DesId(compId,int.Parse(DDLdept.SelectedItem.Value),int.Parse(DDLdes.SelectedItem.Value));
                        GVemps.EmptyDataText = "No Data";
                        GVemps.DataSource = tab_emps;
                        GVemps.DataBind();
                    }
        }

        private void ViewAllEmps()
        {
            tab_emps = b.Employee_GetAll_CompId(compId);
            GVemps.EmptyDataText = "No Data";
            GVemps.DataSource = tab_emps;
            GVemps.DataBind();
        }

        static int empId;
        protected void LB_UpdateProfile_Click(object sender, EventArgs e)
        {
            empId = int.Parse(((LinkButton)sender).CommandArgument);
            string info = empId + "_" + "profile";
            Response.Redirect(string.Format("EmployeeUpdateInfo.aspx?info={0}",info));
        }

        protected void LB_UpdateDes_Click(object sender, EventArgs e)
        {
            empId = int.Parse(((LinkButton)sender).CommandArgument);
            string info = empId + "_" + "designation";
            Response.Redirect(string.Format("EmployeeUpdateInfo.aspx?info={0}", info));
        }

        protected void LB_UpdateSalary_Click(object sender, EventArgs e)
        {
            empId = int.Parse(((LinkButton)sender).CommandArgument);
            string info = empId + "_" + "salary";
            Response.Redirect(string.Format("EmployeeUpdateInfo.aspx?info={0}", info));
        }

        protected void LB_UpdateStatus_Click(object sender, EventArgs e)
        {
            empId = int.Parse(((LinkButton)sender).CommandArgument);
            string info = empId + "_" + "status";
            Response.Redirect(string.Format("EmployeeUpdateInfo.aspx?info={0}", info));
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            empId = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Employee_DeleteEmp(empId) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(),"alert","<script>alert('Employee record deleted successfully.')</script>");
                ViewAllEmps();
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Error in deleting employee record.')</script>");
        }

       

    }
}