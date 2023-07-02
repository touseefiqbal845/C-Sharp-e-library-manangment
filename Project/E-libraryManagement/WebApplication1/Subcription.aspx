<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="Subcription.aspx.cs" Inherits="WebApplication1.Subcription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    /* Sidebar styles */
    .sidebar {
        width: 250px;
        height: 100%;
        position: fixed;
        top: 108px;
        left: 0;
        background-color: #093245 ;
        color:  #be1558;
        transition: transform 0.3s ease-in-out;
        z-index: 9999;
    }

    .sidebar.collapsed {
        transform: translateX(-250px);
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .h1{
            margin-top: 11px;
            margin-left: 10px
    }
    .sidebar ul li {
        padding: 10px;
    }

    .sidebar ul li a {
        color: #fff;
        text-decoration: none;
          margin: 4;
    }

    .collapse-btn {
        position: absolute;
        top: 10px;
        right: -40px;
        background-color: #333;
        color: #fff;
        border: none;
        padding: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    .collapse-btn:hover {
        background-color: #555;
    }
</style>

<div class="sidebar" id="sidebar">
    <ul>   
        <h1 style="color:whitesmoke; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif ">Admin Dashbaoard</h1>
        <li><a href="author%20managment.aspx">Author Managment</a></li>
        <li><a href="publisher%20managment.aspx">Publisher Managment</a></li>
        <li><a href="book%20issuing.aspx">Issuing Book</a></li>
        <li><a href="admin%20book%20inventiry.aspx">Inventiry Book</a></li>
        <li><a href="admin%20member%20mang.aspx">Member Managment</a></li>
          <li><a href="Subcription.aspx">Subcriber Managment </a></li>
         <li><a href="Email Notification.aspx">Emailing Service(for any  queries)</a></li>
             <li><a href="Report Generator.aspx">Report Generator</a></li>
        <li><a href="WebFormPdf.aspx">PDF and Uploading</a></li>

    </ul>
    <button class="collapse-btn" onclick="toggleSidebar()">☰</button>
</div>

<script>
    function toggleSidebar() {
        var sidebar = document.getElementById("sidebar");
        sidebar.classList.toggle("collapsed");
    }

    // Add this event listener to collapse the sidebar on page load
    window.addEventListener('DOMContentLoaded', function () {
        var sidebar = document.getElementById("sidebar");
        sidebar.classList.add("collapsed");
    });
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <style>

      
    .container-fluid{
             border: hidden;
              background-position-x: left;
              background-color:#b2c6ff;
              border-bottom-width: 40px;       
                border-bottom-style: groove;
              border-radius: 60px;
              text-combine-upright: digits;
              border-top-width: 40px;
              border-top-style: groove;
              overflow-x: scroll;
         }
       
    
     .form-control{
             line-height: 2.5;
    width: 99%;
    padding: 12px 20px;
    margin: 11px -3px;
    display: grid;
 border-color:blueviolet;
    border-radius: 25px ;
    box-sizing: border-box;
}
     }
   

        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 10px;
            border-radius: 17px;
          
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            border-radius: 17px;
           

        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            border-radius: 17px;
             
        }

        .form-group button {
              --bs-button-spacer-y: 3rem;
            width: 50%;
            padding: 8px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            border-radius: 17px;
            
        }
           .form-control{
             line-height: 2.5;
    width: 99%;
    padding: 12px 20px;
    margin: 11px -3px;
    display: grid;
 border-color:blueviolet;
    border-radius: 25px ;
    box-sizing: border-box;
}
        .form-group button:hover {
            background-color: #45a049;
        }

    </style>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<center>
									<h1>Subcription</h1>
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<center>
									<img width="100px" src="img/books1.png" />
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Subcriber ID</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Member ID"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
											<asp:Button for="TextBox1" class="btn btn-dark" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
									</div>
								
							</div>
							<div class="row">
								<div class="col-md-12">
									<label>Subcriber Name</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Issue Date</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Due Date</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<asp:Button ID="Button2" class="btn btn-md btn-block btn-primary" runat="server" Text="Issue" OnClick="Button2_Click" />
								</div>
								<div class="col-6">
									<asp:Button ID="Button4" class="btn btn-md btn-block btn-success" runat="server" Text="Return" OnClick="Button4_Click" />
								</div>
  
							</div>
						</div>
					</div>
					<a href="homepage.aspx"><< Back to Home
					</a>
					<br>
						<br>
						</div>
						<div class="col-md-7">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<center>
												<h1>Subcriber Member List</h1>
											</center>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<hr>
											</div>
										</div>
										<div class="row">
  <asp:LinkButton ID="LinkButton4" runat="server" Text="Link2" OnClick="LinkButton4_Click">LinkButton</asp:LinkButton></br>
     <asp:LinkButton ID="LinkButton5" runat="server" Text="Link2" OnClick="LinkButton5_Click">LinkButton</asp:LinkButton></br>

<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

    <asp:View ID="View1" runat="server" >

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
                <asp:BoundField DataField="SelectedPlan" HeaderText="SelectedPlan" SortExpression="SelectedPlan" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [subscription]"></asp:SqlDataSource>

    </asp:View>
    </asp:MultiView>





											<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString %>' SelectCommand="SELECT * FROM [subcription_table]">
											</asp:SqlDataSource>
											<div class="col">
												<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
													<Columns>
														<asp:BoundField DataField="member_id" HeaderText="Subcriber ID" SortExpression="member_id"></asp:BoundField>
														<asp:BoundField DataField="member_name" HeaderText="Subcriber Name" SortExpression="member_name"></asp:BoundField>
														<asp:BoundField DataField="issue_date" HeaderText="Starting Subcription Date" SortExpression="issue_date"></asp:BoundField>
														<asp:BoundField DataField="due_date" HeaderText="Ending Subcription Date" SortExpression="due_date"></asp:BoundField>
													</Columns>

    
           
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</asp:Content>

