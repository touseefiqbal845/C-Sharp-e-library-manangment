using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
	public partial class ReadBook : Page
	{
		string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string bookId = Request.QueryString["bookId"];
				// ...
				if (!string.IsNullOrEmpty(bookId))
				{
					LoadBook(Convert.ToInt32(bookId)); // Convert the bookId to an integer
				}
				// ...
			}
		}

		private void LoadBook(int bookId)
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == System.Data.ConnectionState.Closed)
				{
					con.Open();
				}

				string selectQuery = "SELECT FilePath FROM Books WHERE BookId = @BookId";
				SqlCommand cmd = new SqlCommand(selectQuery, con);
				cmd.Parameters.AddWithValue("@BookId", bookId);
				string filePath = cmd.ExecuteScalar()?.ToString();

				con.Close();

				if (!string.IsNullOrEmpty(filePath))
				{
					iframeBook.Attributes[ "src"] = "~/Uploads/" + filePath;
				}
				else
				{
					lblMessage.Text = "Book not found.";
					lblMessage.ForeColor = System.Drawing.Color.Red;
				}
			}
			catch (Exception ex)
			{
				lblMessage.Text = "Error loading book: " + ex.Message;
				lblMessage.ForeColor = System.Drawing.Color.Red;
			}
		}
	}
}
