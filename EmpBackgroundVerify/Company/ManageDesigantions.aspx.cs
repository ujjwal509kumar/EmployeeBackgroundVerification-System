using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class ManageDesigantions : System.Web.UI.Page
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
            GVdepts.DataSource = b.Desg_Get_CompId(comId);
            GVdepts.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (b.Desg_Exists(txtDesg.Text.ToUpper(), comId) == 0)
            {
                if (btnAdd.Text == "ADD")
                {
                    if (b.Desg_Add(txtDesg.Text.ToUpper(), comId) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Desigantion Details inserted Successfully')</script>");
                        txtDesg.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding Desigantion details.')</script>");
                        txtDesg.Text = "";
                    }
                }
                else if (btnAdd.Text == "UPDATE")
                {
                    if (b.Desg_Update(txtDesg.Text.ToUpper(), deptid) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Desigantion Details updated Successfully')</script>");
                        txtDesg.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updating Desigantion details.')</script>");
                        txtDesg.Text = "";
                    }
                    btnAdd.Text = "ADD";
                }

                BindDepts();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Desigantion Details already exists.')</script>");
                //Response.Write("<script>alert('City Details already exists')</script>");
                txtDesg.Text = "";
            }
        }

        protected void LB_Edit_Click(object sender, EventArgs e)
        {
            deptid = int.Parse(((LinkButton)sender).CommandArgument);
            DataTable t_dept = b.Desg_Get_DesgId(deptid);
            if (t_dept.Rows.Count > 0)
            {
                txtDesg.Text = t_dept.Rows[0][2].ToString();
                btnAdd.Text = "UPDATE";
            }
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            deptid = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Desg_Delete(deptid) == 1)
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