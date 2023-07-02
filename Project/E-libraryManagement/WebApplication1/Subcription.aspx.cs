using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1
{
	public partial class Subcription : System.Web.UI.Page
	{
		string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			GridView1.DataBind();
		}

		// issue book
		protected void Button2_Click(object sender, EventArgs e)
		{
			if (checkIfMemberExist())
			{

				if (checkIfIssueEntryExist())
				{
					Response.Write("<script>alert('This Member already has this book');</script>");
				}
				else
				{
					IssueBook();
				}

			}
			else
			{
				Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
			}
		}
		// return book
		protected void Button4_Click(object sender, EventArgs e)
		{
			if (checkIfMemberExist())
			{

				if (checkIfIssueEntryExist())
				{
					returnBook();
				}
				else
				{
					Response.Write("<script>alert('This Entry does not exist');</script>");
				}

			}
			else
			{
				Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
			}
		}

		// go button click event
		protected void Button1_Click(object sender, EventArgs e)
		{
			getNames();
		}




		// user defined function

		void returnBook()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}


				SqlCommand cmd = new SqlCommand("DELETE FROM subcription_table WHERE  member_id='" + TextBox2.Text.Trim() + "' AND member_name='" + TextBox3.Text.Trim() + "'", con);

				cmd.ExecuteNonQuery();
				con.Close();
				Response.Write("<script>alert('Subcription Delete Successfully');</script>");

				GridView1.DataBind();
		
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('Error - Invalid details');</script>");
			}
		}

		void IssueBook()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("INSERT INTO subcription_table(member_id,member_name,issue_date,due_date) values(@member_id,@member_name,@issue_date,@due_date)", con);

				cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
				cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
						
				cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
				cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());
				cmd.ExecuteNonQuery();

				con.Close();
				Response.Write("<script>alert('Subcription Successfully');</script>");

				GridView1.DataBind();
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}

		
		

		bool checkIfMemberExist()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("select full_name from member_master_table WHERE member_id='" + TextBox2.Text.Trim() + "'", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				if (dt.Rows.Count >= 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				return false;
			}

		}
		protected void LinkButton4_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView1.DataBind();
			MultiView1.ActiveViewIndex = 0;
		}


		protected void LinkButton5_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView2.DataBind();
			MultiView1.ActiveViewIndex = 1;
		}
		bool checkIfIssueEntryExist()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("select * from subcription_table WHERE member_id='" + TextBox2.Text.Trim() + "'", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				if (dt.Rows.Count >= 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch (Exception ex)
			{
				return false;
			}

		}



		void getNames()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("select full_name from member_master_table WHERE member_id='" + TextBox2.Text.Trim() + "'", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				if (dt.Rows.Count >= 1)
				{
					TextBox3.Text = dt.Rows[0]["full_name"].ToString();
				}
				else
				{
					Response.Write("<script>alert('Wrong Member ID');</script>");
				}

			}
			catch (Exception ex)
			{

			}
		}

		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			try
			{
				if (e.Row.RowType == DataControlRowType.DataRow)
				{
					//Check your condition here
					DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
					DateTime today = DateTime.Today;
					if (today > dt)
					{
						e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
					}
				}
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}
	}
}


