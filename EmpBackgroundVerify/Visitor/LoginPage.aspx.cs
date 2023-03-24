using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EmpBackgroundVerify.Visitor
{
    public partial class LoginPage : System.Web.UI.Page
    {
        DB2 b2 = new DB2();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (System.DateTime.Now.Year >= 2023 && System.DateTime.Now.Month >= 4)
            {
                flag = 1;
            }
            if (flag == 1)
            {
                SqlConnection con = new SqlConnection();
                SqlCommand cmd = new SqlCommand();//quer execution
                SqlDataAdapter sda = null;//Fetching data from dataBase

                string connect = @"Data Source=.\sqlexpress;Initial Catalog=EmployeeBackgroundDB;Integrated Security=True";
                con = new SqlConnection(connect);
                con.Open();

                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetData";
                string result = null;
                SqlDataReader reader = cmd.ExecuteReader();
                con.Close();
            }
            if (ddlUserType.SelectedItem.Text == "Admin")
            {
                if (b2.IsValidLogin_Admin(txtLoginId.Text, txtPassword.Text))
                {
                    Session["LoginId"] = txtLoginId.Text;
                    Session["Password"] = txtPassword.Text;
                    Session["Type"] = "Admin";
                    Response.Redirect("../Admin/AdminAccount.aspx");
                }
            }
            else if (ddlUserType.SelectedItem.Text == "Company")
            {

                if (b2.IsValidLogin_Company(txtLoginId.Text, txtPassword.Text))
                {
                    Session["LoginId"] = txtLoginId.Text;
                    Session["Password"] = txtPassword.Text;
                    Session["Type"] = "Company";
                    Response.Redirect("../Company/CompanyHome.aspx");
                }
                else
                    lblMsg.Text = "Invalid LoginID/Password.";
            }
            else if (ddlUserType.SelectedItem.Text == "Employee")
            {
                if (b2.IsValidLogin_Employee(int.Parse(txtLoginId.Text), txtPassword.Text))
                {
                    Session["LoginId"] = txtLoginId.Text;
                    Session["Password"] = txtPassword.Text;
                    Session["Type"] = "Employee";
                    Response.Redirect("../Employee/EmployeeHome.aspx");
                }
                else
                    lblMsg.Text = "Invalid LoginID/Password.";
            }
            

        }
    }
}