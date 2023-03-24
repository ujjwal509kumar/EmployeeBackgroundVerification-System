using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpBackgroundVerify.Company
{
    public partial class PostQueries : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string comId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                comId = Session["LoginId"].ToString();

                BindQueries();
            }
        }

        private void BindQueries()
        {
            GVqueries.EmptyDataText = "No Query";
            GVqueries.DataSource = b.Query_GetAll(comId);
            GVqueries.DataBind();
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            txtQuery.Text = txtQuery.Text.Replace("'", "''");
            txtQuery.Text = txtQuery.Text.Replace("\n", "<br>");
            if (b.Query_Post(comId, txtQuery.Text) == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Query posted successfully.')<script>");
                txtQuery.Text = "";
                BindQueries();
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "<script>alert('Query posted successfully.')<script>");
        }
    }
}