using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace EmpBackgroundVerify.Company
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string compId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Panel1.Visible = true;
                Panel2.Visible = true;
                Panel3.Visible = false;

                compId = Session["LoginId"].ToString();
                DataTable tab_dept = b.Dept_Get_CompId(compId);
                DDLdept.DataSource = tab_dept;
                DDLdept.DataTextField = "DeptName";
                DDLdept.DataValueField = "DeptId";
                DDLdept.DataBind();
                DDLdept.Items.Insert(0, "Select");

                DataTable tab_des = b.Desg_Get_CompId(compId);
                DDLdes.DataSource = tab_des;
                DDLdes.DataTextField = "Designation";
                DDLdes.DataValueField = "DesId";
                DDLdes.DataBind();
                DDLdes.Items.Insert(0, "Select");

            }
        }

        protected void RBfresher_CheckedChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = true;
            Panel3.Visible = false;
        }

        protected void RBexperienced_CheckedChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Panel3.Visible = true;
        }

        static int empId = 0;

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            if (RBfresher.Checked)
            {
                if (FUphoto.HasFile)
                {
                    //if (b.Employee_Count() == 0)
                    //    empId = 1;
                    //else
                    //    empId = b.Employee_GetMaxId() + 1;

                    //if (b.Employee_EmpId_Exists(empId) == 0)
                    if (b.Employee_CardNo_Exists(txtCardNo.Text) == 0)
                    {
                        #region adding employee details
                        txtAddress.Text = txtAddress.Text.Replace("'", "''");
                        txtAddress.Text = txtAddress.Text.Replace("\n", "<br>");


                        string Password = Guid.NewGuid().ToString();
                        Password = Password.Substring(0, 5);
                        if (b.Employee_Add_New_Basic(txtName.Text.ToUpper(),Password, txtAddress.Text, txtMobileNo.Text, txtEmailId.Text, txtDOB.Text, txtQuali.Text, txtCardNo.Text) == 1)
                        {
                            empId = b.Employee_GetMaxId();
                            string fiename = FUphoto.PostedFile.FileName;
                            string extn = Path.GetExtension(fiename);

                            FUphoto.PostedFile.SaveAs(Server.MapPath("../EmployeePhotos/Emp" + empId + extn));
                            string photopath = "../EmployeePhotos/Emp" + empId + extn;

                           
                            if (b.Employee_UpdatePhoto(photopath, empId) == 1)
                            {
                                //ClientScript.RegisterStartupScript(this.GetType(), "alert", ",<script>alert('Employee's basic details added succesdfully.')</script>");
                                if (b.Employee_Add_New_Job(empId, int.Parse(DDLdept.SelectedItem.Value), int.Parse(DDLdes.SelectedItem.Value), txtDOJ.Text, int.Parse(DDLrating.SelectedItem.Text), compId) == 1)
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Employee's job details added successfully.')</script>");
                                    if (b.Employee_Add_New_Salary(empId, int.Parse(txtSalary.Text), txtSalaryAssignedDate.Text, compId, int.Parse(DDLrating.SelectedItem.Text)) == 1)
                                    {
                                        Clear();
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Employee's details and salary details added successfully.')</script>");
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee details added successfully.')", true);
                                    }
                                    else
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee's salary details.')</script>");
                                }
                                else
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee's job details.')</script>");
                            }
                            else
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee photo.')</script>");
                        }
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Error in adding employee's basic details.')", true);
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee's basic details.')</script>");
                        #endregion
                    }
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee ID already exists.')", true);
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Employee ID already exists.')</script>");
                }
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Select photo.')", true);
                // ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Please Select photo.')</script>");

            }
            else // only job details
            {
                if (b.EmployeeDtails_EmpId_Exists2(int.Parse(txtEmpId.Text)) == 1)
                {
                    if (b.Employee_Add_New_Job(int.Parse(txtEmpId.Text), int.Parse(DDLdept.SelectedItem.Value), int.Parse(DDLdes.SelectedItem.Value), txtDOJ.Text, int.Parse(DDLrating.SelectedItem.Text), compId) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Employee's job details added successfully.')</script>");
                        if (b.Employee_Add_New_Salary(int.Parse(txtEmpId.Text), int.Parse(txtSalary.Text), txtSalaryAssignedDate.Text, compId, int.Parse(DDLrating.SelectedItem.Text)) == 1)
                        {
                            Clear();
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Employee's salary details added successfully.')</script>");
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee details updated successfully.')", true);
                        }
                        else
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee's salary details.')</script>");
                    }
                    else
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding employee's job details.')</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Error in adding employee's job details.')", true);
                }
                else
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert","<script>alert('Employee ID not exists/Still Employee status not updated in the company.')</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee ID not exists/Still Employee status not updated in the company..')", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void Clear()
        {
            txtAddress.Text = "";
            txtCardNo.Text = "";
            txtDOB.Text = "";
            txtDOJ.Text = "";
            txtEmailId.Text = "";
            txtMobileNo.Text = "";
            txtName.Text = "";
            txtQuali.Text = "";
            DDLdept.SelectedIndex = 0;
            DDLdes.SelectedIndex = 0;
            lblMsg2.Text = "";
            lblMsg.Text = "";
            txtEmpId.Text = "";
            txtSalaryAssignedDate.Text = "";
            txtSalary.Text = "";
            DDLrating.SelectedIndex = 0;
            lblCardStatus.Text = "";
        }

        protected void txtEmpId_TextChanged(object sender, EventArgs e)
        {
            if (b.EmployeeDtails_EmpId_Exists2(int.Parse(txtEmpId.Text)) == 1)
            {
                lblMsg2.Text = "Employee ID  exists(employee has experience). You can continue with this ID.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee ID  exists(employee has experience). You can continue with this ID.')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Employee ID not exists/Still Employee status not updated in the company.')", true);
                lblMsg2.Text = "Employee ID not exists/Still Employee status not updated in the company.";
                return;
            }
        }

        protected void txtCardNo_TextChanged(object sender, EventArgs e)
        {
            if (b.Employee_CardNo_Exists(txtCardNo.Text) == 0)
            {
                lblCardStatus.Text = "You can continue with the registration.. This aadhar card number not exists.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('You can continue with the registration.. This aadhar card number not exists.')", true);
            }
            else
            {
                lblCardStatus.Text = "Aadhar card number already exists.Employee details already exist.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Aadhar card number already exists.Employee details already exist.')", true);
            }
        }
    }
}       