<%@ Page Language="C#" AutoEventWireup="true" Codefile="subs.aspx.cs" Inherits="WebApplication1.subs" %>

<!DOCTYPE html>
<html>
<head>

    <title>Subscription Management</title>
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

    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #b2c6ff;
}
        }

        .form {
            background-color: #b2c6ff;
            padding: 20px;
            border-radius: 5px;
        }

        .auto-style1 {
            width: 156px;
        }

        .auto-style2 {
            color: #FF3399;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #b2c6ff;
            color: #fff;
        }

        .print-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" Text="Link1" OnClick="LinkButton1_Click"></asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" Text="Link2" OnClick="LinkButton2_Click"></asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" Text="Link2" OnClick="LinkButton3_Click"></asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" Text="Link2" OnClick="LinkButton5_Click"></asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton6" runat="server" Text="Link2" OnClick="LinkButton6_Click"></asp:LinkButton>
        <br />

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div class="form">
                    <h2>Book Issues</h2>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_table]"></asp:SqlDataSource>
                </div>
            </asp:View>

            <asp:View ID="View2" runat="server">
                <div class="form">
                    <h2>Subscriptions</h2>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" SortExpression="PaymentMethod" />
                            <asp:BoundField DataField="SelectedPlan" HeaderText="Selected Plan" SortExpression="SelectedPlan" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="MemberName" HeaderText="Member Name" SortExpression="MemberName" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [subscription]"></asp:SqlDataSource>
                </div>
            </asp:View>

            <asp:View ID="View3" runat="server">
                <div class="form">
                    <h2>Member Details</h2>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource3">
                        <Columns>
                            <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                            <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                            <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode" />
                            <asp:BoundField DataField="full_address" HeaderText="Full Address" SortExpression="full_address" />
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" ReadOnly="True" SortExpression="member_id" />
                            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                            <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_table]"></asp:SqlDataSource>
                </div>
            </asp:View>

            <asp:View ID="View4" runat="server">
                <div class="form">
                    <!-- Content of View4 -->
                </div>
            </asp:View>

            <asp:View ID="View5" runat="server">
                <div class="form">
                    <h2>Admin Users</h2>
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="SqlDataSource6">
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="Username" ReadOnly="True" SortExpression="username" />
                            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                            <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [admin_table]"></asp:SqlDataSource>
                </div>
            </asp:View>

            <asp:View ID="View6" runat="server">
                <div class="form">
                    <h2>Issued Books</h2>
                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                </div>
            </asp:View>
        </asp:MultiView>
        
        <button onclick="printReport()" >Print</button>
   
    </form>
    
</body>
</html>
