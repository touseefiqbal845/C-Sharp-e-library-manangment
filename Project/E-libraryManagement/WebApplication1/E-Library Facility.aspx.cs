using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
	public partial class E_Library_Facility : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack) //Used to Check whether the Page is loaded first time or not  
			{
				ListOfData(); //Custom Method Called  
			}
		}
		protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			string filePath = Server.MapPath("~/Uploads/") + e.CommandArgument;
			string fileExtension = Path.GetExtension(filePath);

			if (fileExtension.ToLower() == ".pdf")
			{
				Response.Clear();
				Response.ContentType = "application/pdf";
				Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
				Response.TransmitFile(filePath);
				Response.End();
			}
			else
			{
				// Redirect to a download page for non-PDF files
				Response.Redirect("DownloadPage.aspx?file=" + e.CommandArgument);
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			if (FileUpload1.HasFile) //If the used Uploaded a file  
			{
				string FileName = FileUpload1.FileName; //Name of the file is stored in local Variable  
				FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + FileName); //File is saved in the Physical folder  
			}
			ListOfData(); //Custom method is Called  
		}
		//Custom Methods used in the Above Code  
		private void ListOfData()
		{
			DataTable dt = new DataTable(); //Datatable is Created to Add Dynamic Columns  
											//Columns Added with the Same name as that of Eval Expression and the DataField Value of the Gridview  
			dt.Columns.Add("File");
			dt.Columns.Add("Size");
			dt.Columns.Add("Type");
			//Looping through Each file available in the MyUploads folder  
			foreach (string str in Directory.GetFiles(Server.MapPath("~/Uploads"))) //Directory.GetFiles Method is used to Get the files from the Folder  
			{
				FileInfo fileinfo = new FileInfo(str); //Fileinfo class is used to fetch the information about the Fetched file  
				string filename = fileinfo.Name; //Getting the Name of the File  
				string filesize = (fileinfo.Length / 1024).ToString(); //Getting the Size of the file and Converting it into KB from Bytes  
				string filetype = GetFileTypeByFileExtension(fileinfo.Extension); //Getting file Extension and Calling Custom Method  
				dt.Rows.Add(filename, filesize, filetype); //Adding Rows to the DataTable  
			}
			GridView1.DataSource = dt; // Setting the Values of DataTable to be Shown in Gridview  
			GridView1.DataBind(); // Binding the Data  
		}

		private string GetFileTypeByFileExtension(string fileExtension)
		{
			switch (fileExtension.ToLower()) //Checking the file Extension and Showing the Hard Coded Values on the Basis of Extension Type  
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