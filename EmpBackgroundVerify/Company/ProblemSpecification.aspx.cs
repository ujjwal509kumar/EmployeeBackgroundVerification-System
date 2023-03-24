using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EmpBackgroundVerify.Company
{
    public partial class ProblemSpecification : System.Web.UI.Page
    {
        DB2 b = new DB2();
        static string comId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                comId = Session["LoginId"].ToString();

                for (int i = 1; i < 10; i++)
                {
                    ListItem l = new ListItem(i.ToString());
                    DDLyears.Items.Add(l);
                }
                DDLyears.Items.Insert(0, "Select");

                
            }
            Data();
        }

        protected void DDLyears_SelectedIndexChanged(object sender, EventArgs e)
        {
            Data();
        }


        private void Data()
        {
            DataTable tab = new DataTable();

            try
            {
                if (DDLyears.SelectedIndex > 0)
                {
                    int serialNo = 1;

                    Table1.Rows.Clear();
                    Table1.GridLines = GridLines.Both;
                    Table1.BorderColor = System.Drawing.Color.Black;

                    TableHeaderRow mainrow = new TableHeaderRow();
                    mainrow.BackColor = System.Drawing.Color.Gray;
                    mainrow.ForeColor = System.Drawing.Color.WhiteSmoke;

                    TableHeaderCell cell1 = new TableHeaderCell();
                    cell1.Text = "Year";
                    mainrow.Controls.Add(cell1);

                    TableHeaderCell cell2 = new TableHeaderCell();
                    cell2.Text = "% of Employees who left up to the end of the Year";
                    mainrow.Controls.Add(cell2);

                    Table1.Controls.Add(mainrow);

                    string date = DateTime.Now.ToShortDateString();
                    string[] s = date.Split('/');
                    int currentyear = int.Parse(s[2].ToString());
                    int dec = 1;

                    for (int i = 0; i < int.Parse(DDLyears.SelectedValue.ToString()); i++)
                    {
                        int year = currentyear - dec;

                        tab.Rows.Clear();
                        tab = b.SP_GetEmp_CompId_Left(comId);
                        int cnt = 0;

                        if (tab.Rows.Count > 0)
                        {
                            for (int j = 0; j < tab.Rows.Count; j++)
                            {
                                string[] z = tab.Rows[j]["QuitDate"].ToString().Split('/');

                                if (int.Parse(z[2].ToString()) == year)

                                    ++cnt;
                            }

                            TableRow row = new TableRow();

                            TableCell cellSerialNo = new TableCell();
                            cellSerialNo.Text = year.ToString();
                            row.Controls.Add(cellSerialNo);

                            double percentage = (double.Parse(cnt.ToString()) / double.Parse(txtCRP.Text.ToString())) * 100;

                            TableCell cellPercentage = new TableCell();
                            TextBox txt = new TextBox();
                            txt.ID = (serialNo + i).ToString();
                            txt.Text = percentage.ToString();
                            txt.Enabled = false;
                            txt.Font.Bold = true;
                            txt.ForeColor = System.Drawing.Color.Green;
                            cellPercentage.Controls.Add(txt);
                            row.Controls.Add(cellPercentage);

                            Table1.Controls.Add(row);
                        }

                        ++dec;

                    }
                }

            }
            catch
            {

            }
        }

        protected void btnSolution_Click(object sender, EventArgs e)
        {
            try
            {
                double sum = 0;

                if (DDLyears.SelectedIndex > 0)
                {
                    int serialNo = 0;

                    Table2.Rows.Clear();
                    Table2.GridLines = GridLines.Both;
                    Table2.BorderColor = System.Drawing.Color.Black;

                    TableHeaderRow mainrow = new TableHeaderRow();
                    mainrow.BackColor = System.Drawing.Color.Gray;
                    mainrow.ForeColor = System.Drawing.Color.WhiteSmoke;

                    TableHeaderCell cell1 = new TableHeaderCell();
                    cell1.Text = "Year(A)";
                    mainrow.Controls.Add(cell1);

                    TableHeaderCell cell2 = new TableHeaderCell();
                    cell2.Text = "Number of Employees who leave at the end of the Year(B)";
                    mainrow.Controls.Add(cell2);

                    TableHeaderCell cell3 = new TableHeaderCell();
                    cell3.Text = "Number of Employees in service at the end of the Year(C)";
                    mainrow.Controls.Add(cell3);

                    TableHeaderCell cell4 = new TableHeaderCell();
                    cell4.Text = "Probability of Employees leaving at the end of the Year(D)";
                    mainrow.Controls.Add(cell4);

                    TableHeaderCell cell5 = new TableHeaderCell();
                    cell5.Text = "Probability of Employees in service at the end of the Year(E)";
                    mainrow.Controls.Add(cell5);

                    Table2.Controls.Add(mainrow);

                    string date = DateTime.Now.ToShortDateString();
                    //02/22/2015
                    string[] s = date.Split('/');
                    int currentyear = int.Parse(s[2].ToString());
                    int dec = 0;

                    for (int i = 0; i <= int.Parse(DDLyears.SelectedValue.ToString()); i++)
                    {
                        int year = currentyear - dec;

                        TableRow row = new TableRow();

                        TableCell cellSerialNo = new TableCell();
                        cellSerialNo.Text = year.ToString();
                        row.Controls.Add(cellSerialNo);

                        TableCell cellB = new TableCell();

                        if (i == 0)
                        {
                            cellB.Text = "0";
                            row.Controls.Add(cellB);
                        }
                        else
                        {
                            TextBox txt = (TextBox)Table1.FindControl((serialNo + i).ToString());

                            double per = double.Parse(txt.Text.ToString());
                            double CRP = double.Parse(txtCRP.Text.ToString());

                            double div = per / 100.00;

                            double B = div * CRP;

                            cellB.Text = B.ToString();
                            row.Controls.Add(cellB);

                        }

                        TableCell cellC = new TableCell();
                        double cB = double.Parse(cellB.Text.ToString());
                        double res1 = 100.00 - cB;
                        sum += res1;
                        cellC.Text = res1.ToString();
                        row.Controls.Add(cellC);

                        TableCell cellD = new TableCell();
                        double res2 = cB / 100.00;
                        cellD.Text = res2.ToString();
                        row.Controls.Add(cellD);

                        TableCell cellE = new TableCell();
                        double cC = double.Parse(cellC.Text.ToString());
                        double res3 = cC / 100.00;
                        cellE.Text = res3.ToString();
                        row.Controls.Add(cellE);

                        Table2.Controls.Add(row);

                        ++dec;

                    }

                    txtCRP.ForeColor = System.Drawing.Color.Red;
                    txtRaise.ForeColor = System.Drawing.Color.Red;

                    double current = double.Parse(txtCRP.Text.ToString());
                    double strength = double.Parse(txtRaise.Text.ToString());

                    double result = (current * strength) / sum;

                    lblTotal.Text = "From table 1, we find that with a recruitment policy of " + txtCRP.Text + " persons every year, the total number of persons serving in the organization would have been " + sum + " . Hence, if we want to rise a strength of " + txtRaise.Text + " persons then we should recruit " + result + " Employees.";

                }
            }
            catch
            {

            }
        }

    }
}