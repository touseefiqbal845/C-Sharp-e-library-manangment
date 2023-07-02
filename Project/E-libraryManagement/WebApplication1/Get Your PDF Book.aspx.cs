using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
namespace WebApplication1
{
	public partial class Get_Your_PDF_Book : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				ListOfData();
			}
		}

		protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "DownloadFile")
			{
				string fileName = e.CommandArgument.ToString();
				string filePath = Server.MapPath("~/Uploads/") + fileName;

				Response.Clear();
				Response.ContentType = "application/octet-stream";
				Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
				Response.TransmitFile(filePath);
				Response.End();
			}
		}

		protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			string fileName = GridView1.DataKeys[e.RowIndex].Value.ToString();
			string filePath = Server.MapPath("~/Uploads/") + fileName;

			File.Delete(filePath);
			ListOfData();
		}


		protected void Button1_Click(object sender, EventArgs e)
		{
			if (FileUpload1.HasFile)
			{
				string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
				string filePath = Server.MapPath("~/Uploads/") + fileName;
				FileUpload1.PostedFile.SaveAs(filePath);
				ListOfData();
			}
		}

		private void ListOfData()
		{
			DataTable dt = new DataTable();
			dt.Columns.Add("File", typeof(string));
			dt.Columns.Add("Size", typeof(string));
			dt.Columns.Add("Type", typeof(string));

			string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
			foreach (string filePath in filePaths)
			{
				FileInfo fi = new FileInfo(filePath);
				dt.Rows.Add(fi.Name, (fi.Length / 1024).ToString(), GetFileTypeByFileExtension(fi.Extension));
			}

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		private string GetFileTypeByFileExtension(string fileExtension)
		{
			switch (fileExtension.ToLower())
			{
				case ".doc":
				case ".docx":
					return "Microsoft Word Document";
				case ".xls":
				case ".xlsx":
					return "Microsoft Excel Document";
				case ".txt":
					return "Text File";
				case ".png":
				case ".jpg":
					return "Windows Image file";
				default:
					return "Unknown file type";
			}
		}
	}
}