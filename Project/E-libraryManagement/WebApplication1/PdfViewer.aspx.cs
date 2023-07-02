using System;
using System.Web.UI;

namespace WebApplication1
{
	public partial class PdfViewer : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			Page.ClientScript.RegisterForEventValidation("<btn>", "<Book_inventiry\\Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf>");

			// Optional: Retrieve the PDF file path dynamically
			
			string pdfFilePath = Request.QueryString["Book_inventiry\\Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf"];

			// Register the postback or callback data for event validation
			Page.ClientScript.RegisterForEventValidation("pdfFilePath", pdfFilePath);
			// Register the JavaScript code to load the PDF
			string script = $"loadPDF('Book_inventiry\\Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf');";
			ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadPDF", script, true);
		}

		// Optional: Implement a method to retrieve the PDF file path dynamically
		private string GetPdfFilePath()
		{
			// Add your logic to determine the PDF file path
			return "Book_inventiry\\Notice for BS IT and BSCS 2019-2023 for Submission of final Documentaion-1.pdf";
		}
	}
}
