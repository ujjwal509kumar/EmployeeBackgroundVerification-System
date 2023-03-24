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
    public partial class EmployeeUpdateInfo : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static int empId;
        static string type;
        static string compId;
        static DataTable tab_emp = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                compId = Session["LoginId"].ToString();
                empId = int.Parse(Request.QueryString["info"].ToString().Split('_')[0]);
                type = Request.QueryString["info"].ToString().Split('_')[1];
                tab_emp = b.Employee_Get_EmpId(empId);

                if (type == "profile")
                {
                    #region profile
                    MultiView1.SetActiveView(View1);
                    lblPhoto.Visible = false;
                    FUphoto.Visible = false;
                    LB_ChangePhoto.Visible = true;
                    
                    if (tab_emp.Rows.Count > 0)
                    {
                        txtName.Text = tab_emp.Rows[0]["EmpName"].ToString();
                        txtAddress.Text = tab_emp.Rows[0]["Address"].ToString();
                        txtAddress.Text = txtAddress.Text.Replace("'", "''");
                        txtAddress.Text = txtAddress.Text.Replace("<br>", "\n");
                        txtMobileNo.Text = tab_emp.Rows[0]["MobileNo"].ToString();
                        txtEmailId.Text = tab_emp.Rows[0]["EmailId"].ToString();
                        txtQuali.Text = tab_emp.Rows[0]["Qualification"].ToString();
                        txtCardNo.Text = tab_emp.Rows[0]["AadharCardNo"].ToString();
                        txtDOB.Text = tab_emp.Rows[0]["DOB"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>window.alert('Error in loading employee information.')lwindow.location='ViewEmployeesDetails.aspx'</script>");
                    }
                    #endregion
                }
                else
                    if (type == "designation")
                    {
                        #region designation
                        MultiView1.SetActiveView(View2);

                        DataTable tab_dept = b.Dept_Get_CompId(compId);
                        DDLdept.DataSource = tab_dept;
                        DDLdept.DataTextField = "DeptName";
                        DDLdept.DataValueField = "DeptId";
                        DDLdept.DataBind();
                        DDLdept.Items.Insert(0, "Select");
                        //int cnt1 = tab_dept.Rows.Count;
                        //ListItem L1 = new ListItem(tab_emp.Rows[cnt1 - 1]["DeptName"].ToString(), tab_emp.Rows[cnt1 - 1]["DeptId"].ToString());
                        //DDLdept.SelectedIndex = DDLdept.Items.IndexOf(L1);

                        //DataTable tab_des_dept = b.EmpView_Des_DeptId(int.Parse(tab_emp.Rows[0]["DeptId"].ToString()), compId);
                        DDLdept.Items.FindByText(tab_emp.Rows[0]["DeptName"].ToString()).Selected = true;
                        DataTable tab_des_dept = b.Desg_Get_CompId(compId);
                        if (tab_des_dept.Rows.Count > 0)
                        {
                            DDLdes.DataSource = tab_des_dept;
                            DDLdes.DataTextField = "Designation";
                            DDLdes.DataValueField = "DesId";
                            DDLdes.DataBind();
                            DDLdes.Items.Insert(0, "Select");

                        }

                        //int cnt2 = tab_des_dept.Rows.Count;
                        //ListItem L2 = new ListItem(tab_emp.Rows[cnt2]["Designation"].ToString(), tab_emp.Rows[cnt2]["DesId"].ToString());
                        //DDLdes.SelectedIndex = DDLdes.Items.IndexOf(L2);
                        DDLdes.Items.FindByText(tab_emp.Rows[0]["Designation"].ToString()).Selected = true;
                        txtDOJ.Text = tab_emp.Rows[0]["DOJ"].ToString();
                        #endregion
                    }
                    else
                        if (type == "salary")
                        {
                            #region Salary
                            MultiView1.SetActiveView(View3);
                            txtSalary.Text = tab_emp.Rows[0]["CTC"].ToString();
                            txtSalaryAssignedDate.Text = tab_emp.Rows[0]["HikeDate"].ToString();

                            #endregion
                        }
                        else
                            if (type == "status")
                            {
                                #region status
                                MultiView1.SetActiveView(View4);
                                Panel_UpdateStatus.Visible = false;
                                LB_Left.Visible = true;
                                #endregion
                            }

            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (type == "profile")
            {
                txtAddress.Text = txtAddress.Text.Replace("'", "''");
                txtAddress.Text = txtAddress.Text.Replace("\n", "<br>");

                if (FUphoto.Visible == false)//without phot
                {
                    if (b.Employee_Update_Profile(txtName.Text, txtAddress.Text, txtMobileNo.Text, txtEmailId.Text, txtDOB.Text, txtQuali.Text, txtCardNo.Text, empId) == 1)
                    {
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Profile updated successfully.')</script>");
                        Response.Write("<script>window.alert('Profile updated successfully.');window.location('ViewEmployeesDetails.aspx')</script>");
                    }
                    else
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updatng Profile.')</script>");
                        Response.Write("<script>window.alert('Error in updatng Profile.');window.location('ViewEmployeesDetails.aspx')</script>");
                }
                else//without photo
                {
                    string photopath = tab_emp.Rows[0]["Photo"].ToString();
                    if (File.Exists(Server.MapPath("../EmployeePhotos/" + photopath)) == true)
                        File.Delete(Server.MapPath("../EmployeePhotos/" + photopath));

                    string path = FUphoto.PostedFile.FileName;
                    string extn = Path.GetExtension(path);
                    FUphoto.PostedFile.SaveAs(Server.MapPath("../EmployeePhotos/Emp" + empId + extn));
                    photopath = "../EmployeePhotos/Emp" + empId + extn;

                    if (b.Employee_Update_Profile_Photo(txtName.Text, txtAddress.Text, txtMobileNo.Text, txtEmailId.Text, txtDOB.Text, txtQuali.Text, txtCardNo.Text,photopath, empId) == 1)
                    {
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Profile updated successfully(with photo).')</script>");
                        Response.Write("<script>window.alert('Profile updated successfully(with photo).');window.location='ViewEmployeesDetails.aspx'</script>");
                    }
                    else
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updatng Profile(with photo).')</script>");
                        Response.Write("<script>window.alert('Error in updatng Profile(with photo).');window.location='ViewEmployeesDetails.aspx'</script>");

                }
                txtAddress.Text = "";
                txtName.Text = "";
                txtMobileNo.Text = "";
                txtEmailId.Text = "";
                txtDOB.Text = "";
                txtQuali.Text = "";
                txtCardNo.Text = "";
                
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEmployeesDetails.aspx");
        }

        protected void LB_ChangePhoto_Click(object sender, EventArgs e)
        {
            lblPhoto.Visible = true;
            FUphoto.Visible = true;
            LB_ChangePhoto.Visible = false;
        }

        protected void DDLdept_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDLdes.Items.Clear();
            if (DDLdept.SelectedItem.Text != "Select")
            {
                DataTable tab_des_dept = b.EmpView_Des_DeptId(int.Parse(DDLdept.SelectedItem.Value), compId);
                if (tab_des_dept.Rows.Count > 0)
                {
                    DDLdes.DataSource = tab_des_dept;
                    DDLdes.DataTextField = "Designation";
                    DDLdes.DataValueField = "DesId";
                    DDLdes.DataBind();
                    DDLdes.Items.Insert(0, "Select");

                }
                else
                    DDLdes.Items.Insert(0, "None");
            }
            else
            {
                DDLdes.Items.Insert(0, "None");
            }
        }

        protected void btnUpdateSalary_Click(object sender, EventArgs e)
        {
            if (type == "salary")
            {
                if (b.Employee_UpdateSalaryStatus(empId, compId) == 1)
                {
                    if (b.Employee_UpdateSalary(empId, int.Parse(txtSalary.Text), txtSalaryAssignedDate.Text, int.Parse(DDLrating.SelectedItem.Text), compId) == 1)
                    {
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Profile updated successfully(with photo).')</script>");
                        Response.Write("<script>window.alert('Salary updated successfully.');window.location='ViewEmployeesDetails.aspx'</script>");
                    }
                    else
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updatng Profile(with photo).')</script>");
                        Response.Write("<script>window.alert('Error in updatng Salary.');window.location='ViewEmployeesDetails.aspx'</script>");
                }
                else
                    Response.Write("<script>window.alert('Error in updatng Salary status.');window.location='ViewEmployeesDetails.aspx'</script>");
            }
        }

        protected void LB_Left_Click(object sender, EventArgs e)
        {
            Panel_UpdateStatus.Visible = true;
            LB_Left.Visible = false;
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            if (type == "status")
            {
                if(b.Employee_UpdateWorkStatus(empId,txtQuitDate.Text,txtQuitReason.Text,int.Parse(DDLrating2.SelectedItem.Text))==1)
                {
                    if(b.Employee_UpdateSalaryStatus_OnLeft(empId)==1)
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Profile updated successfully(with photo).')</script>");
                        Response.Write("<script>window.alert('Work status updated as LEFT(along with salary status)  successfully.');window.location='ViewEmployeesDetails.aspx'</script>");
                    else
                        Response.Write("<script>window.alert('Work status updated as LEFT(along with salary status) successfully.');window.location='ViewEmployeesDetails.aspx'</script>");
                }
                else
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updatng Profile(with photo).')</script>");
                    Response.Write("<script>window.alert('Error in updating work status as LEFT.');window.location='ViewEmployeesDetails.aspx'</script>");
            }
        }


        protected void btnUpdateDesignation_Click(object sender, EventArgs e)
        {
            if (type == "designation")
            {
                if (DDLdept.SelectedIndex != 0 && DDLdes.SelectedIndex != 0)
                {
                    int detailid = int.Parse(tab_emp.Rows[0]["DetailId"].ToString());

                    if (b.Employee_Update_WorkStatus(detailid) == 1)
                    {
                        if (b.Employee_Update_Designation2(empId, int.Parse(DDLdept.SelectedItem.Value), int.Parse(DDLdes.SelectedItem.Value), txtDOJ.Text,compId) == 1)
                        {
                            Response.Write("<script>window.alert('Employee desigantion details updated successfully.'); window.location='ViewEmployeesDetails.aspx';</script>");
                            //Response.Write("<script>window.alert('Registered successfullly.Login to add your family members details.');window.location='LoginPage.aspx';</script>");
                        }
                        else
                            Response.Write("<script>window.alert('Error in updating designation.'); window.location='ViewEmployeesDetails.aspx';</script>");
                    }
                    else
                        Response.Write("<script>window.alert('Error in updating designation.'); window.location='ViewEmployeesDetails.aspx';</script>");

                }
            }
        }

        

      
        


     
    }
}