using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace WebApplication1
{
	public partial class The_End : System.Web.UI.Page
	{
		protected void btnSubscribe_Click(object sender, EventArgs e)
		{
			if (!string.IsNullOrEmpty(Request.Form["plan"]))
			{
				// Determine the selected plan and its corresponding price
				string selectedPlan = Request.Form["plan"];
				decimal amount = 0;

				if (selectedPlan == "Plan 1")
				{
					amount = 10.00M;
				}
				else if (selectedPlan == "Plan 2")
				{
					amount = 20.00M;
				}
				else if (selectedPlan == "Plan 3")
				{
					amount = 30.00M;
				}

				string memberName = txtMemberName.Value;

				string paymentMethod = ddlPaymentMethod.SelectedValue;

				// Store the subscription details in the database
				string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // Replace with your actual connection string

				using (SqlConnection connection = new SqlConnection(strcon))
				{
					string query = "INSERT INTO subscription (PaymentMethod,SelectedPlan, Amount, MemberName ) VALUES (@PaymentMethod, @SelectedPlan, @Amount, @MemberName )";

					using (SqlCommand command = new SqlCommand(query, connection))
					{
						command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
						command.Parameters.AddWithValue("@SelectedPlan", selectedPlan);
						command.Parameters.AddWithValue("@Amount", amount);
						command.Parameters.AddWithValue("@MemberName", memberName);

						connection.Open();
						command.ExecuteNonQuery();

					}


				}

				// Redirect to the PayPal sandbox payment page
				string redirectUrl = $"https://www.sandbox.paypal.com/cgi-bin/webscr" +
					$"?cmd=_xclick" +
					$"&business=zeeshan.arshad@pugc.edu.pk" +
					$"&item_name={selectedPlan}" +
					$"&amount={amount}" +
					$"&return=http://localhost:44386/home/orderconfirmation";

				Response.Redirect(redirectUrl);
			}
			else
			{
				// No plan selected, display an error message or take appropriate action
			}
		}
		protected void Button2_Click(object sender, EventArgs e)
		{
			Response.Redirect("user login.aspx");
		}
	}
}