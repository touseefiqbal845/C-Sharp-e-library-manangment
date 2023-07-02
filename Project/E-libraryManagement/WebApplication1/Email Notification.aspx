<%@ Page Language="C#" AutoEventWireup="true" Codefile="Email Notification.aspx.cs" Inherits="WebApplication1.Email_Notification" %>

<!DOCTYPE html>
<html>

<head id="Head1" runat="server">
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


    <title>Email Test Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
        }

        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container label.error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        #form1 {
            width: 383px;
            height: 427px;
        }
        .auto-style1 {}
    </style>
</head>

<body>
    <div class="form-container">
        <div class="row">
            <div class="col-md-6 ">
        
        <h2>Send Email If Payment Done</h2>
        <form id="form1" runat="server">
            <label for="txtTo">Message to:</label>
            <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" /><br>

            <label for="txtFrom">Message from:</label>
            <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" /><br>

            <label for="txtSubject">Subject:</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" /><br>

            <label for="txtBody">Message Body:</label><br>
            <asp:TextBox ID="txtBody" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" /><br>

            <asp:Button ID="Btn_SendMail" runat="server" OnClick="Btn_SendMail_Click" Text="Send Email"
                CssClass="btn btn-primary" /><br>

            <asp:Label ID="Label1" runat="server" Text="Responce" CssClass="result-label"></asp:Label>
     
    </div>
             <div class="col-md-6 ">
                 <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary"  Text="Check Email and Name" runat="server" OnClick="LinkButton1_Click"></asp:LinkButton>
    <br>
    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary" Text="Payment Report" OnClick="LinkButton2_Click"></asp:LinkButton></br>

<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

    <asp:View ID="View1" runat="server" >

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="member_id" DataSourceID="SqlDataSource3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="member_id" HeaderText="member_id" ReadOnly="True" SortExpression="member_id" />
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

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT [full_name], [email], [member_id] FROM [member_master_table]"></asp:SqlDataSource>

    </asp:View>

      <asp:View ID="View2" runat="server">
      <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style1" DataSourceID="SqlDataSource2" GridLines="Horizontal" Height="84px">
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



</div>
        </div>
        </div>
    </form>
    </body>

</html>
