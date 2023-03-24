using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Admin
{
    public partial class ViewCertificate : System.Web.UI.Page
    {
        DB2 b = new DB2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string compid = Session["comp_id2"].ToString();
                DataTable tab_comp = b.Company_Get_ComId2(compid);
                if (tab_comp.Rows.Count > 0)
                {
                    Image1.ImageUrl = tab_comp.Rows[0]["Certificate"].ToString();
                }
                else
                {
                    Response.Write("<script>window.alert('Certificate not uploaded.'); window.location='CompanyVerify.aspx'</script>");
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyVerify.aspx");
        }
    }
}