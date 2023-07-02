<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="author managment.aspx.cs" Inherits="WebApplication1.author_managment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    
   
    <script type="text/javascript">

    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
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
        <li><a href="subs.aspx">Report Generator</a></li>
         
        <li><a href="BookUpload.aspx">PDF and Uploading</a></li>

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
   .footer {
  background-color: #333;
  color: #fff;
  transition: height 0.3s;
  overflow: hidden;
  position: fixed;
  bottom: 0;
  width: 100%;
  height: 40px;
}

.footer-content {
  max-width: 960px;
  margin: 0 auto;
  padding: 10px;
}

.collapse-button {
  text-align: center;
  padding: 5px;
}

#toggle-footer {
  width: 100%;
}

.collapsed {
  height: 0;
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
                                        <h1>Author Details</h1>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="img/writer.png" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-md btn-block btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-md btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-md btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h1>Author List</h1>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="Author ID" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
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
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>

</asp:Content>