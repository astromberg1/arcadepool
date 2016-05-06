using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ArcadePool
    {
    public partial class WebForm1 : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {
           
            }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
            {

            }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
            {

            }


        protected void Button3_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = true;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                GridView1.DataSource = SqlDataSource2;
                GridView1.DataBind();
                }
            }

        protected void Button2_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = true;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
                }
            }

        protected void Button5_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = true;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
                }
            }
        protected void Button6_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = true;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource4;
                GridView1.DataBind();
                }
            }

        protected void Button7_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = true;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource9;
                GridView1.DataBind();
                }
            }

        protected void Button8_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = true;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource6;
                GridView1.DataBind();
                }
            }

        protected void Button9_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = true;
                GridView8.Visible = false;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource7;
                GridView1.DataBind();
                }
            }

        protected void Button10_Click(object sender, EventArgs e)
            {
            if (Automatic.Checked)
                {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = true;
                GridView9.Visible = false;
                }
            else
                {
                GridView1.Visible = true;
                GridView2.Visible = false;
                GridView3.Visible = false;
                GridView4.Visible = false;
                GridView5.Visible = false;
                GridView6.Visible = false;
                GridView7.Visible = false;
                GridView8.Visible = false;
                GridView9.Visible = false;

                GridView1.DataSource = SqlDataSource8;
                GridView1.DataBind();
                }
            }

     

        protected void Automatic_CheckedChanged1(object sender, EventArgs e)
            {

            }
        }
    }