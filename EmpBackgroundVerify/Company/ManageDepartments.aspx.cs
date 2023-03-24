using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class ManageDepartments : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static int deptid;
        static string comId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                comId = Session["LoginId"].ToString();
                BindDepts();
            }
        }

        private void BindDepts()
        {
            GVdepts.EmptyDataText = "No Data";
            GVdepts.DataSource = b.Dept_Get_CompId(comId);
            GVdepts.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (b.Dept_Exists(txtDept.Text.ToUpper(), comId) == 0)
            {
                if (btnAdd.Text == "ADD")
                {
                    if (b.Dept_Add(txtDept.Text.ToUpper(), comId) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Department Details inserted Successfully')</script>");
                        txtDept.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding Department details.')</script>");
                        txtDept.Text = "";
                    }
                }
                else if (btnAdd.Text == "UPDATE")
                {
                    if (b.Dept_Update(txtDept.Text.ToUpper(), deptid) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Department Details updated Successfully')</script>");
                        txtDept.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updating Department details.')</script>");
                        txtDept.Text = "";
                    }
                    btnAdd.Text = "ADD";
                }

                BindDepts();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Department Details already exists.')</script>");
                //Response.Write("<script>alert('City Details already exists')</script>");
                txtDept.Text = "";
            }
        }

        protected void LB_Edit_Click(object sender, EventArgs e)
        {
            deptid = int.Parse(((LinkButton)sender).CommandArgument);
            DataTable t_dept = b.Dept_Get_DeptId(deptid);
            if (t_dept.Rows.Count > 0)
            {
                txtDept.Text = t_dept.Rows[0][1].ToString();
                btnAdd.Text = "UPDATE";
            }
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            deptid = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Dept_Delete(deptid) == 1)
            {
                BindDepts();
                //Response.Write("<script>alert('Record deleted successfully.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Record deleted successfully.')</script>");
            }
            else
                //Response.Write("<script>alert('Error in deleting city details.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in deleting city details.')</script>");
        }
    }
}