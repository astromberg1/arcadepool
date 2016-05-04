using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArcadePool
    {
    public partial class WebForm1 : System.Web.UI.Page
        {
        protected void Page_Load(object sender, EventArgs e)
            {

            }

        protected void Button1_Click(object sender, EventArgs e)
            {
            Panel2.Visible = false;
            GridView1.Visible = false;
            //GridView1.AutoGenerateColumns = true;
           //GridView1.DataSource = SqlDataSource2;
            //GridView1.DataBind();

         //   GridView2.Visible = false;
           // GridView1.DataSource = null;
      

            
            }


        protected void Button2_Click(object sender, EventArgs e)
            {
            Panel2.Visible = true;
            GridView1.Visible = true;
            //GridView1.AutoGenerateColumns = true;
            //GridView1.Visible = false;

            //GridView2.DataSource = SqlDataSource3;
            //GridView2.DataBind();

            // GridView1.DataSource = null;



            }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
            {
          
            }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
            {

            }
        }
    }