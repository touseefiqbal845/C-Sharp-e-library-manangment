<%@ Page Language="C#" AutoEventWireup="true" Codefile="Report Generator.aspx.cs" Inherits="WebApplication1.Report_Generator" %>

<!DOCTYPE html>
<html>
<head>
    <title>Report</title>
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


    <style>
        /* Define your CSS styles for the report */
        body {
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

        .report {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="report">
        <h1>Report</h1>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>John Doe</td>
                    <td>johndoe@example.com</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>janesmith@example.com</td>
                    <td>25</td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>

        <script>
            function printReport() {
                window.print();
            }
        </script>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="book_id" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
        <p>
        <button onclick="printReport()">Print</button>

        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

