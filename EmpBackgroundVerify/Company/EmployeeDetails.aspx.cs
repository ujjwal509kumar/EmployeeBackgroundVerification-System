using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        DB2 b = new DB2();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                int empId = int.Parse(Session["EmpId"].ToString());
                DataTable tab_empDetails = b.BG_GetEmpWorkDetails_EmpId(empId);
                if (tab_empDetails.Rows.Count > 0)
                {
                    //foreach (TableRow row in tblWork.Rows)
                    //{
                    //    tblWork.Rows.Remove(row);
                    //}

                    //basic details
                    DataTable tab_basicDetails = b.BG_GetEmpBasicDetails_EmpId(empId);
                    ImgEmp.ImageUrl = tab_basicDetails.Rows[0]["Photo"].ToString();
                    lblEmpId.Text = tab_basicDetails.Rows[0]["EmpId"].ToString();
                    lblName.Text = tab_basicDetails.Rows[0]["EmpName"].ToString();
                    DVemp.DataSource = tab_basicDetails;
                    DVemp.DataBind();

                    //DataTable tab_compIds = b.BG_GetEmp_CompIds(empId);
                    DataTable tab_compIds = b.BG_GetEmp_OverAllDetails(empId);
                    if (tab_compIds.Rows.Count > 0)
                    {

                        DVEmpOverallDetails.DataSource = tab_compIds;
                        DVEmpOverallDetails.DataBind();
                    }
                    //if (tab_compIds.Rows.Count > 0)
                    //{
                    //    #region displaying employee details
                    //    tblWork.BorderWidth = 2;
                    //    tblWork.GridLines = GridLines.Both;
                    //    tblWork.BorderStyle = BorderStyle.Solid;

                    //    for (int i = 0; i < tab_compIds.Rows.Count; i++)
                    //    {
                    //        DataTable tab_emp = b.BG_GetEmpDetails_EmpId_CompId(empId, tab_compIds.Rows[i]["CompanyId"].ToString());
                    //        DataTable tab_compName = b.Company_Get_ComId(tab_compIds.Rows[i]["CompanyId"].ToString());
                    //        TableRow row = new TableRow();
                    //        TableRow row2 = new TableRow();
                    //        TableCell c_1 = new TableCell();
                    //        c_1.Width = 100;
                    //        c_1.Text = "<b>COMPANY NAME :</b>";
                    //        TableCell c_2 = new TableCell();
                    //        c_2.Text = tab_compName.Rows[0]["CompanyName"].ToString();
                    //        TableCell c2_1 = new TableCell();
                    //        c2_1.Width = 100;
                    //        c2_1.Text = "";
                    //        TableCell c2_2 = new TableCell();
                    //        GridView gv = new GridView();
                    //        gv.ID = gv + "_" + i;
                    //        gv.DataSource = tab_emp;
                    //        gv.DataBind();

                    //        c2_2.Controls.Add(gv);

                    //        row2.Controls.Add(c_1);
                    //        row2.Controls.Add(c_2);
                    //        row.Controls.Add(c2_1);
                    //        row.Controls.Add(c2_2);
                    //        tblWork.Controls.Add(row2);
                    //        tblWork.Controls.Add(row);
                    //    }
                    //    #endregion
                    //}
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            string tmp=Session["flg"].ToString();
            if (tmp == "1")
                Response.Redirect("VisitorDetails.aspx");
            else
                if (tmp == "2")
                    Response.Redirect("ConfirmRequest_Inbox.aspx");
                else
                    Response.Redirect("ConfirmRequest_Outbox.aspx");

        }
    }
}