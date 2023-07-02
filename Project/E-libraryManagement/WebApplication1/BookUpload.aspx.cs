using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class BookUpload : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				ListOfData();
			}
		}

		protected void LinkButton1_Click(object sender, EventArgs e)
		{
			LinkButton linkButton = (LinkButton)sender;
			string fileName = linkButton.CommandArgument;
			DownloadFile(fileName);
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			if (FileUpload1.HasFile)
			{
				string fileName = FileUpload1.FileName;
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
			}
			ListOfData();
		}

		private void ListOfData()
		{
			DataTable dt = new DataTable();
			dt.Columns.Add("File");
			dt.Columns.Add("Size");
			dt.Columns.Add("Type");

			foreach (string filePath in Directory.GetFiles(Server.MapPath("~/Uploads")))
			{
				FileInfo fileInfo = new FileInfo(filePath);
				string fileName = fileInfo.Name;
				string fileSize = (fileInfo.Length / 1024).ToString();
				string fileType = GetFileTypeByFileExtension(fileInfo.Extension);
				dt.Rows.Add(fileName, fileSize, fileType);
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

		private void DownloadFile(string fileName)
		{
			string filePath = Server.MapPath("~/Uploads/") + fileName;

			if (File.Exists(filePath))
			{
				Response.Clear();
				Response.ContentType = "application/octet-stream";
				Response.AppendHeader("Content-Disposition", "filename=" + fileName);
				Response.TransmitFile(filePath);
				Response.End();
			}
		}
	}
}
