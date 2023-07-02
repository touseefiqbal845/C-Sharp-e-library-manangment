using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class Get_Subscription : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void Button1_Click(object sender, EventArgs e)
		{
			Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=zeeshan.arshad@pugc.edu.pk&item_name=thewayshopproducts&return=https://localhost:44386//home/orderconfirmation=");

		}


	}
}