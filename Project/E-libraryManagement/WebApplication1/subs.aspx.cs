using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class subs : System.Web.UI.Page
	{
		protected void LinkButton1_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView1.DataBind();
			MultiView1.ActiveViewIndex = 0;
		}


		protected void LinkButton2_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView2.DataBind();
			MultiView1.ActiveViewIndex = 1;
		}
		protected void LinkButton3_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView3.DataBind();
			MultiView1.ActiveViewIndex = 2;
		}
		
		protected void LinkButton5_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView5.DataBind();
			MultiView1.ActiveViewIndex = 4;
		}
		protected void LinkButton6_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView6.DataBind();
			MultiView1.ActiveViewIndex = 5;
		}
	}
}




