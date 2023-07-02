using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (Session["role"].Equals(""))
				{
					LinkButton1.Visible = true; // user login link button
					LinkButton2.Visible = true; // sign up link button

					LinkButton3.Visible = false; // logout link button
					LinkButton7.Visible = false; // hello user link button
					LinkButton4.Visible = false;
			


					LinkButton6.Visible = true; // admin login link button
					LinkButton11.Visible = false; // author management link button
					LinkButton12.Visible = false; // publisher management link button
					LinkButton8.Visible = false; // book inventory link button
					LinkButton9.Visible = false; // book issuing link button
					LinkButton10.Visible = false; // member management link button



				}
				else if (Session["role"].Equals("user"))
				{
					LinkButton1.Visible = false; // user login link button
					LinkButton2.Visible = false; // sign up link button

					LinkButton3.Visible = true; // logout link button
					LinkButton7.Visible = true; // hello user link button
					LinkButton7.Text = "Hello " + Session["username"].ToString();


					LinkButton6.Visible = true; // admin login link button
					LinkButton11.Visible = false; // author management link button
					LinkButton12.Visible = false; // publisher management link button
					LinkButton8.Visible = false; // book inventory link button
					LinkButton9.Visible = false; // book issuing link button
					LinkButton10.Visible = false; // member management link button

				}

				else if (Session["role"].Equals("admin"))
				{
					LinkButton1.Visible = false; // user login link button
					LinkButton2.Visible = false; // sign up link button

					LinkButton3.Visible = true; // logout link button
					LinkButton7.Visible = true; // hello user link button
					LinkButton7.Text = "Hello Admin";


					LinkButton6.Visible = false; // admin login link button
					LinkButton11.Visible = false; // author management link button
					LinkButton12.Visible = false;// publisher management link button
					LinkButton8.Visible = false; // book inventory link button
					LinkButton9.Visible = false; // book issuing link button
					LinkButton10.Visible = false; // member management link button
				}
			}
			catch (Exception ex)
			{

			}

		}

		protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin login.aspx");
        }
	
		protected void LinkButton13_Click(object sender, EventArgs e)
		{
			Response.Redirect("Subcription.aspx");
		}
		protected void LinkButton5_Click(object sender, EventArgs e)
		{

			Response.Redirect("user profile.aspx");
		}
		protected void LinkButton15_Click(object sender, EventArgs e)
		{

			Response.Redirect("BookUpload.aspx");
		}
		protected void LinkButton14_Click(object sender, EventArgs e)
		{ 

			Response.Redirect("Report Generator.aspx");
		}
		protected void LinkButton16_Click(object sender, EventArgs e)
		{

				Response.Redirect("Get Your PDF Book.aspx");
	     }
		protected void LinkButton17_Click(object sender, EventArgs e)
		{

			Response.Redirect("user login.aspx");
		}
		protected void LinkButton18_Click(object sender, EventArgs e)
		{

			Response.Redirect("subcription login.aspx");
		}
		protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("author managment.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("publisher managment.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin book inventiry.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("book issuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin member mang.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("webform2.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("user login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("user signup.aspx");
        }

		//logout button
		protected void LinkButton3_Click(object sender, EventArgs e)
		{
			Session["username"] = "";
			Session["fullname"] = "";
			Session["role"] = "";
			Session["status"] = "";

			LinkButton1.Visible = true; // user login link button
			LinkButton2.Visible = true; // sign up link button

			LinkButton3.Visible = false; // logout link button
			LinkButton7.Visible = false; // hello user link button


			LinkButton6.Visible = true; // admin login link button
			LinkButton11.Visible = false; // author management link button
			LinkButton12.Visible = false; // publisher management link button
			LinkButton8.Visible = false; // book inventory link button
			LinkButton9.Visible = false; // book issuing link button
			LinkButton10.Visible = false; // member management link button

			Response.Redirect("homepage.aspx");
		}

		// view profile
		protected void Page_Init(object sender, EventArgs e)
		{
			Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
		}

	}
}
       




		






