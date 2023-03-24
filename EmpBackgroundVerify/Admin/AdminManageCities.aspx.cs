//using System;
//using System.Collections.Generic;
////using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using EmpBackgroundVerify.Presenter.PresenterAdmin.ManageCity;
//using EmpBackgroundVerify.Model.ModelAdmin;
//using System.Data;
using System;
using System.Collections.Generic;
////using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class AdminManageCities : System.Web.UI.Page
    {

        DB2 b = new DB2();
        static int cityid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gridbind();
            }
        }

        public void gridbind()
        {
            DataTable tab = new DataTable();
            tab = b.Cities_GetAll();
            GVcities.EmptyDataText="No Data.";
            GVcities.DataSource = tab;
            GVcities.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "ADD")
            {
                if (b.Cities_Exist(txtCity.Text.ToUpper()) == 0)
                {
                    if (b.Cities_Add(txtCity.Text.ToUpper()) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('City Details inserted Successfully')</script>");
                        txtCity.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in adding city details.')</script>");
                        txtCity.Text = "";
                    }
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('City Details already exists.')</script>");
                    //Response.Write("<script>alert('City Details already exists')</script>");
                    txtCity.Text = "";

                }
            }
            else if (btnAdd.Text == "UPDATE")
            {
                if (b.Cities_Exist(txtCity.Text.ToUpper()) == 0)
                {
                    if (b.Cities_Update(txtCity.Text.ToUpper(), cityid) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('City Details updated Successfully')</script>");
                        txtCity.Text = string.Empty;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in updating city details.')</script>");
                        txtCity.Text = "";
                    }
                    btnAdd.Text = "ADD";
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('City Details already exists.')</script>");
                    //Response.Write("<script>alert('City Details already exists')</script>");
                    txtCity.Text = "";

                }
            }
            gridbind();
        }

        protected void LB_Edit_Click(object sender, EventArgs e)
        {
            cityid = int.Parse(((LinkButton)sender).CommandArgument);
            DataTable t_city=b.Cities_Get_CityId(cityid);
            if (t_city.Rows.Count > 0)
            {
                txtCity.Text = t_city.Rows[0][1].ToString();
                btnAdd.Text = "UPDATE";
            }
        }

        protected void LB_Delete_Click(object sender, EventArgs e)
        {
            cityid = int.Parse(((LinkButton)sender).CommandArgument);
            if (b.Cities_Delete(cityid) == 1)
            {
                gridbind();
                //Response.Write("<script>alert('Record deleted successfully.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Record deleted successfully.')</script>");
            }
            else
                //Response.Write("<script>alert('Error in deleting city details.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in deleting city details.')</script>");
        }


        
    }

   
}