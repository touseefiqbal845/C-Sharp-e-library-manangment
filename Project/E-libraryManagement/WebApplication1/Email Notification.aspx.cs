using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace WebApplication1
{
	public partial class Email_Notification : System.Web.UI.Page
	{
		protected void Btn_SendMail_Click(object sender, EventArgs e)
		{
			MailMessage mailObj = new MailMessage(
				txtFrom.Text, txtTo.Text, txtSubject.Text, txtBody.Text);
			SmtpClient SMTPServer = new SmtpClient("127.0.0.1");
			try
			{
				SMTPServer.Send(mailObj);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.ToString();
			}
		}

		protected void LinkButton1_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView2.DataBind();
			MultiView1.ActiveViewIndex = 0;
		}


		protected void LinkButton2_Click(object sender, EventArgs e)
		{
			//retrieve data
			GridView3.DataBind();
			MultiView1.ActiveViewIndex = 1;
		}
	}
}
	