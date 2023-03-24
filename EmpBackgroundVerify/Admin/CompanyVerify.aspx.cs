using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class CompanyVerify : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string comIds = null;

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
                DDLcity.Items.Insert(0, "All");

                btnApprove.Visible = false;
                btnReject.Visible = false;
                btnDelete.Visible = false;

                ViewCompanies_All();


            }
        }

        private void ViewCompanies_All()
        {
            DataTable tab_com = b.Company_GetAll();
            GVcompanies.EmptyDataText = "No Data";
            GVcompanies.DataSource = tab_com;
            GVcompanies.DataBind();
            if (tab_com.Rows.Count == 0)
                chkSelectAll.Visible = false;
            else
                chkSelectAll.Visible = true;
        }

        protected void LB_ViewMore_Click(object sender, EventArgs e)
        {
            Session["COMPID"] = ((LinkButton)sender).CommandArgument.ToString();
            Session["FLG"] = 1;
            Response.Redirect("CompanyDetails2.aspx");
        }

        protected void DDLcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLcity.SelectedItem.Text != "All")
            {
                DataTable tab_com = b.Company_Get_CityId(int.Parse(DDLcity.SelectedItem.Value));
                GVcompanies.EmptyDataText = "No Data";
                GVcompanies.DataSource = tab_com;
                GVcompanies.DataBind();
                if (tab_com.Rows.Count == 0)
                    chkSelectAll.Visible = false;
                else
                    chkSelectAll.Visible = true;
            }
            else
                ViewCompanies_All();

        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            comIds = comIds.Insert(0, "'");
            comIds = comIds.Insert(comIds.Length, "'");
            comIds = comIds.Replace(",", "','");
            if (b.Company_ChangeStatus(comIds, "Approved") == 0)
            {
                ViewCompanies_All();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request accepted successfully.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in accepting company request.')</script>");
                //Response.Write("<script>alert('Company request accepted successfully.')</script>");
            }
            else
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in accepting company request.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request accepted successfully.')</script>");
            //Response.Write("<script>alert('Error in accepting company request.')</script>");

            Reset();
        }

        private void Reset()
        {
            ViewCompanies_All();
            btnApprove.Visible = false;
            btnDelete.Visible = false;
            btnReject.Visible = false;
            comIds = null;
        }

        static int tmp = 0;
        protected void chkSelect_CheckedChanged(object sender, EventArgs e)
        {
            if (comIds != null)
                tmp = comIds.Split(',').Length;
            else
                tmp = 0;

            CheckBox chk = (CheckBox)sender;
            if (chk.Checked)
                tmp++;
            else
                tmp--;

            if (tmp > 0)
            {
                btnApprove.Visible = true;
                btnDelete.Visible = true;
                btnReject.Visible = true;
            }
            else
            {
                btnApprove.Visible = false;
                btnDelete.Visible = false;
                btnReject.Visible = false;
            }

            GridViewRow row = (GridViewRow)((CheckBox)sender).Parent.Parent;
            Label lblcomId = (Label)row.FindControl("lblCompanyId");
            //if (comIds!=null )
            //{

            //if (indx1 != -1)
            //{
            if (chk.Checked == false)
            {
                int indx1 = comIds.IndexOf(lblcomId.Text);
                if (indx1 != 0)
                {
                    if ((indx1 + lblcomId.Text.Length) == comIds.Length)
                        comIds = comIds.Remove(indx1 - 1, lblcomId.Text.Length + 1);
                    else
                        comIds = comIds.Remove(indx1, lblcomId.Text.Length + 1);
                }
                else
                {
                    if (indx1 + lblcomId.Text.Length == comIds.Length)
                    {
                        comIds = comIds.Remove(indx1, lblcomId.Text.Length);
                        comIds = null;
                        if (chkSelectAll.Checked)
                        {
                            chkSelectAll.Checked = false;
                            chkSelectAll.Text = "Select All";
                        }
                    }
                    else
                        comIds = comIds.Remove(indx1, lblcomId.Text.Length + 1);
                }
            }
            else
                if (chk.Checked == true)
                {
                    if (comIds != null)
                    {
                        comIds = comIds.Insert(comIds.Length, "," + lblcomId.Text);
                        if (GVcompanies.Rows.Count == comIds.Split(',').Length)
                        {
                            if (chkSelectAll.Checked == false)
                            {
                                chkSelectAll.Checked = true;
                                chkSelectAll.Text = "Deselect All";
                            }
                        }
                    }
                    else
                    {
                        comIds = lblcomId.Text;
                        chkSelectAll.Checked = false;
                        chkSelectAll.Text = "Select All";
                    }

                }
            //}
            //}
            //else
            //{
            //        comIds = comIds + lblcomId.Text + ",";

            //}
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < GVcompanies.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GVcompanies.Rows[i].FindControl("chkSelect");
                if (chkSelectAll.Text == "Select All")
                {
                    chk.Checked = true;
                    Label comid = (Label)GVcompanies.Rows[i].FindControl("lblCompanyId");
                    comIds = comIds + comid.Text + ",";
                }
                else
                {
                    chk.Checked = false;
                }

            }
            if (chkSelectAll.Text == "Select All")
            {
                chkSelectAll.Text = "Deselect All";
                chkSelectAll.Checked = true;
                comIds = comIds.Substring(0, comIds.Length - 1);
                btnApprove.Visible = true;
                btnDelete.Visible = true;
                btnReject.Visible = true;
            }
            else
            {
                chkSelectAll.Text = "Select All";
                chkSelectAll.Checked = false;
                comIds = null;
                btnApprove.Visible = false;
                btnDelete.Visible = false;
                btnReject.Visible = false;
            }


        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            comIds = comIds.Insert(0, "'");
            comIds = comIds.Insert(comIds.Length, "'");
            comIds = comIds.Replace(",", "','");
            if (b.Company_ChangeStatus(comIds, "Rejected") == 0)
            {
                ViewCompanies_All();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request accepted successfully.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in rejecting company request.')</script>");
                //Response.Write("<script>alert('Company request accepted successfully.')</script>");
            }
            else
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in accepting company request.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request rejected successfully.')</script>");
            //Response.Write("<script>alert('Error in accepting company request.')</script>");

            Reset();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            comIds = comIds.Insert(0, "'");
            comIds = comIds.Insert(comIds.Length, "'");
            comIds = comIds.Replace(",", "','");
            if (b.Company_Delete(comIds) == 0)
            {
                ViewCompanies_All();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request accepted successfully.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in deleting company request.')</script>");
                //Response.Write("<script>alert('Company request accepted successfully.')</script>");
            }
            else
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Error in accepting company request.')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('Company request deleted successfully.')</script>");
            //Response.Write("<script>alert('Error in accepting company request.')</script>");

            Reset();
        }

        protected void LB_ViewCertificate_Click(object sender, EventArgs e)
        {
            string comp_id2 = ((LinkButton)sender).CommandArgument;
            Session["comp_id2"] = comp_id2;
            Response.Redirect("ViewCertificate.aspx");
        }
    }
}