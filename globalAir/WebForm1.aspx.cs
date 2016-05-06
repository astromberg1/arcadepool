using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication3
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
            GridView1.DataSource = SqlDataSource2;
            GridView1.DataBind();

            }

        protected void Button2_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

            }

        protected void Button5_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource3;
            GridView1.DataBind();

            }
        protected void Button6_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource4;
            GridView1.DataBind();

            }

        protected void Button7_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource5;
            GridView1.DataBind();

            }

        protected void Button8_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource6;
            GridView1.DataBind();

            }

        protected void Button9_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource7;
            GridView1.DataBind();

            }

        protected void Button10_Click(object sender, EventArgs e)
            {
            GridView1.DataSource = SqlDataSource8;
            GridView1.DataBind();

            }

  

        }
    }