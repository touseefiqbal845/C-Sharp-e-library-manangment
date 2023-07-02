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
	public partial class admin_book_inventiry : System.Web.UI.Page
	{
		string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		
	 static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
		protected void Page_Load(object sender, EventArgs e)
		{
			

			if (!IsPostBack)
			{
				fillAuthorPublisherValues();
			}

			GridView1.DataBind();
			
		}

		// go button click
		protected void Button2_Click(object sender, EventArgs e)
		{
			getBookByID();
		}


		// update button click
		protected void Button3_Click(object sender, EventArgs e)
		{
			updateBookByID();
		}
		// delete button click
		protected void Button4_Click(object sender, EventArgs e)
		{
			deleteBookByID();
		}
		// add button click
		protected void Button1_Click(object sender, EventArgs e)
		{
			if (checkIfBookExists())
			{
				Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
			}
			else
			{
				addNewBook();
			}
		}

		protected void Button5_Click(object sender, EventArgs e)
		{
			readBook();
		}

		// user defined functions

		void deleteBookByID()
		{
			if (checkIfBookExists())
			{
				try
				{
					SqlConnection con = new SqlConnection(strcon);
					if (con.State == ConnectionState.Closed)
					{
						con.Open();
					}

					SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + Textbox1.Text.Trim() + "'", con);

					cmd.ExecuteNonQuery();
					con.Close();
					Response.Write("<script>alert('Book Deleted Successfully');</script>");

					GridView1.DataBind();

				}
				catch (Exception ex)
				{
					Response.Write("<script>alert('" + ex.Message + "');</script>");
				}

			}
			else
			{
				Response.Write("<script>alert('Invalid Member ID');</script>");
			}
		}

		void updateBookByID()
		{
			if (checkIfBookExists())
			{
				try
				{
					int actual_stock = Convert.ToInt32(Textbox7.Text.Trim());
					int current_stock = actual_stock;
					//Textbox8.Text = current_stock.ToString();

					string genres = "";
					foreach (int i in ListBox1.GetSelectedIndices())
					{
						genres = genres + ListBox1.Items[i] + ",";
					}
					genres = genres.Remove(genres.Length - 1);

					string filepath = "~/Book_inventiry/Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf";
					string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
					if (filename == "" || filename == null)
					{
						filepath = global_filepath;
					}
					else
					{
						FileUpload1.SaveAs(Server.MapPath("Book_inventiry/" + filename));
						filepath = "~/Book_inventiry/" + filename;
					}

					SqlConnection con = new SqlConnection(strcon);
					if (con.State == ConnectionState.Closed)
					{
						con.Open();
					}
					SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link where book_id='" + Textbox1.Text.Trim() + "'", con);

					cmd.Parameters.AddWithValue("@book_name", Textbox3.Text.Trim());
					cmd.Parameters.AddWithValue("@genre", genres);
					cmd.Parameters.AddWithValue("@author_name", DropDownList4.SelectedItem.Value);
					cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
					cmd.Parameters.AddWithValue("@publish_date", Textbox6.Text.Trim());
					cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
					cmd.Parameters.AddWithValue("@edition", Textbox10.Text.Trim());
					cmd.Parameters.AddWithValue("@book_cost", Textbox11.Text.Trim());
					cmd.Parameters.AddWithValue("@no_of_pages", Textbox12.Text.Trim());
					cmd.Parameters.AddWithValue("@book_description", Textbox2.Text.Trim());
					cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
					cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
					cmd.Parameters.AddWithValue("@book_img_link", filepath);

					cmd.ExecuteNonQuery();
					con.Close();
					GridView1.DataBind();
					Response.Write("<script>alert('Book Updated Successfully');</script>");
				}
				catch (Exception ex)
				{
					Response.Write("<script>alert('" + ex.Message + "');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('Book ID does not exist');</script>");
			}
		}


		void getBookByID()
		{
			try
			{

				
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + Textbox1.Text.Trim() + "';", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				if (dt.Rows.Count >= 1)
				{
					Textbox3.Text = dt.Rows[0]["book_name"].ToString();
					Textbox6.Text = dt.Rows[0]["publish_date"].ToString();
					Textbox10.Text = dt.Rows[0]["edition"].ToString();
					Textbox11.Text = dt.Rows[0]["book_cost"].ToString().Trim();
					Textbox12.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
					Textbox7.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
					Textbox8.Text = dt.Rows[0]["current_stock"].ToString().Trim();
					Textbox2.Text = dt.Rows[0]["book_description"].ToString();
					Textbox9.Text ="" +(Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
					DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
					DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
					DropDownList4.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

					ListBox1.ClearSelection();
					string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
					for (int i = 0; i < genre.Length; i++)
					{
						for (int j = 0; j < ListBox1.Items.Count; j++)
						{
							if (ListBox1.Items[j].ToString() == genre[i])
							{
								ListBox1.Items[j].Selected = true;

							}
						}
					}

					global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
					global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
				global_issued_books = global_actual_stock - global_current_stock;
					global_filepath = dt.Rows[0]["book_img_link"].ToString();

				}
				else
				{
					Response.Write("<script>alert('Invalid Book ID');</script>");
				}

			}
			catch (Exception ex)
			{

			}
		}

		void fillAuthorPublisherValues()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}
				SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				DropDownList4.DataSource = dt;
				DropDownList4.DataValueField = "author_name";
				DropDownList4.DataBind();

				cmd = new SqlCommand("SELECT publisher_name from publisher_master_table;", con);
				da = new SqlDataAdapter(cmd);
				dt = new DataTable();
				da.Fill(dt);
				DropDownList2.DataSource = dt;
				DropDownList2.DataValueField = "publisher_name";
				DropDownList2.DataBind();

			}
			catch (Exception ex)
			{

			}
		}

		bool checkIfBookExists()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + Textbox1.Text.Trim() + "' OR book_name='" + Textbox2.Text.Trim() + "';", con);
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
				Response.Write("<script>alert('" + ex.Message + "');</script>");
				return false;
			}
		}

		void addNewBook()
		{
			try
			{
				string genres = "";
				foreach (int i in ListBox1.GetSelectedIndices())
				{
					genres = genres + ListBox1.Items[i] + ",";
				}
				// genres = Adventure,Self Help,
				genres = genres.Remove(genres.Length - 1);

				string filepath = "~/Book_inventiry/writer.png";
				string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
				FileUpload1.SaveAs(Server.MapPath("Book_inventiry/" + filename));
				filepath = "~/Book_inventiry/" + filename;


				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

				cmd.Parameters.AddWithValue("@book_id", Textbox1.Text.Trim());
				cmd.Parameters.AddWithValue("@book_name", Textbox3.Text.Trim());
				cmd.Parameters.AddWithValue("@genre", genres);
				cmd.Parameters.AddWithValue("@author_name", DropDownList4.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@publish_date", Textbox6.Text.Trim());
				cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@edition", Textbox10.Text.Trim());
				cmd.Parameters.AddWithValue("@book_cost", Textbox11.Text.Trim());
				cmd.Parameters.AddWithValue("@no_of_pages", Textbox12.Text.Trim());
				cmd.Parameters.AddWithValue("@book_description", Textbox2.Text.Trim());
				cmd.Parameters.AddWithValue("@actual_stock", Textbox7.Text.Trim());
				cmd.Parameters.AddWithValue("@current_stock", Textbox8.Text.Trim());
				cmd.Parameters.AddWithValue("@book_img_link", filepath);

				cmd.ExecuteNonQuery();
				con.Close();
				Response.Write("<script>alert('Book added successfully.');</script>");
				GridView1.DataBind();

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}
		void readBook()
		{
			try
			{
				string filePath = Server.MapPath(global_filepath); // Assuming global_filepath contains the path to the book file

				// Read the contents of the book file
				string bookContents = File.ReadAllText("Book_inventiry/Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf");

				// Display the book contents
				Response.Write("<script>alert('" + bookContents + "');</script>");
			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}



		protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "Select")
			{
				// Command argument contains the book_id value
				string bookId = e.CommandArgument.ToString();

				// Perform the desired action with the bookId
				// For example, redirect to another page passing the bookId as a query parameter
				Response.Redirect("user login.aspx?bookId=" + bookId);
			}
		}



	}
}





















/* using System;
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
	public partial class admin_book_inventiry : System.Web.UI.Page
	{
		string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			GridView1.DataBind();
			fillAuthorPublisherValues();

		}
		// Go
		protected void Button2_Click(object sender, EventArgs e)
		{

		}
		// Add
		protected void Button1_Click(object sender, EventArgs e)
		{

			if (checkIfBookExists())
			{
				Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
			}
			else
			{
				addNewBook();
			}

		}
		// Update
		protected void Button3_Click(object sender, EventArgs e)
		{

		}
		// Delete
		protected void Button4_Click(object sender, EventArgs e)
		{

		}
		// User-Defined Functions

		void fillAuthorPublisherValues()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				da.Fill(dt);
				DropDownList4.DataSource = dt;
				DropDownList4.DataValueField = "author_name";
				DropDownList4.DataBind();

				cmd = new SqlCommand("SELECT publisher_name from publisher_master_table;", con);
				da = new SqlDataAdapter(cmd);
				dt = new DataTable();
				da.Fill(dt);
				DropDownList2.DataSource = dt;
				DropDownList2.DataValueField = "publisher_name";
				DropDownList2.DataBind();

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");

			}
		}

		void addNewBook()
		{
			try
			{
				string genres = "";
				foreach (int i in ListBox1.GetSelectedIndices())
				{
					genres = genres + ListBox1.Items[i] + ",";
				}
				// genres = Adventure,Self Help,
				genres = genres.Remove(genres.Length - 1);

				string filepath = "~/Book_inventiry/writer.png";
				string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
				FileUpload1.SaveAs(Server.MapPath("Book_inventiry/" + filename));
				filepath = "~/Book_inventiry/" + filename;


				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

				cmd.Parameters.AddWithValue("@book_id", Textbox1.Text.Trim());
				cmd.Parameters.AddWithValue("@book_name", Textbox2.Text.Trim());
				cmd.Parameters.AddWithValue("@genre", genres);
				cmd.Parameters.AddWithValue("@author_name", DropDownList4.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@publish_date", Textbox6.Text.Trim());
				cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
				cmd.Parameters.AddWithValue("@edition", Textbox10.Text.Trim());
				cmd.Parameters.AddWithValue("@book_cost", Textbox11.Text.Trim());
				cmd.Parameters.AddWithValue("@no_of_pages", Textbox12.Text.Trim());
				cmd.Parameters.AddWithValue("@book_description", Textbox2.Text.Trim());
				cmd.Parameters.AddWithValue("@actual_stock", Textbox7.Text.Trim());
				cmd.Parameters.AddWithValue("@current_stock", Textbox8.Text.Trim());
				cmd.Parameters.AddWithValue("@book_img_link", filepath);

				cmd.ExecuteNonQuery();
				con.Close();
				Response.Write("<script>alert('Book added successfully.');</script>");
				GridView1.DataBind();

			}
			catch (Exception ex)
			{
				Response.Write("<script>alert('" + ex.Message + "');</script>");
			}
		}

		bool checkIfBookExists()
		{
			try
			{
				SqlConnection con = new SqlConnection(strcon);
				if (con.State == ConnectionState.Closed)
				{
					con.Open();
				}

				SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + Textbox1.Text.Trim() + "' OR book_name='" + Textbox2.Text.Trim() + "';", con);
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
				Response.Write("<script>alert('" + ex.Message + "');</script>");
				return false;
			}
		}





		
	}
}







	  /*  static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            GridView1.DataBind();
        }

        // go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }


        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }
        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
            }
            else
            {
                addNewBook();
            }
        }



        // user defined functions

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + Textbox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void updateBookByID()
        {

            if (checkIfBookExists())
            {
                try
                {

                    int actual_stock = int.TryParse()(Textbox4.Text.Trim());
                    int current_stock = int.TryParse()(Textbox5.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            Textbox5.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link where book_id='" + Textbox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", Textbox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", Textbox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", Textbox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", Textbox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", Textbox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", Textbox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }
        }


        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + Textbox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Textbox2.Text = dt.Rows[0]["book_name"].ToString();
                    Textbox3.Text = dt.Rows[0]["publish_date"].ToString();
                    Textbox9.Text = dt.Rows[0]["edition"].ToString();
                    Textbox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    Textbox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    Textbox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    Textbox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    Textbox6.Text = dt.Rows[0]["book_description"].ToString();
                    Textbox7.Text = "" + (int.TryParse()(dt.Rows[0]["actual_stock"].ToString()) - int.TryParse()(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = int.TryParse()(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = int.TryParse()(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_table;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + Textbox1.Text.Trim() + "' OR book_name='" + Textbox2.Text.Trim() + "';", con);
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
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", Textbox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", Textbox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", Textbox3.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", Textbox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", Textbox10.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", Textbox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", Textbox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", Textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", Textbox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
 */
