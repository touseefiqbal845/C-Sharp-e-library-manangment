<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="admin book inventiry.aspx.cs" Inherits="WebApplication1.admin_book_inventiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                $('#imgview').attr('src', e.target.result);
                };

            reader.readAsDataURL(input.files[0]);
        }
        }
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
     
   

    </style>
    
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 ">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                       <img  id="imgview"  width="100px"  src="Book_inventiry/defaulters-list.png"  /> 
                                  </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                      <h1>Book Details</h1>
  
                                  </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Textbox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary " ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Textbox3" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">

                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                        <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">

                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Author 1" Value="Author 1"></asp:ListItem>
                                        <asp:ListItem Text="Author 2" Value="Author 2"></asp:ListItem>
                                        <asp:ListItem Text="Author 3" Value="Author 3"></asp:ListItem>


                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox class="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">

                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1"></asp:ListItem>
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2"></asp:ListItem>
                                        <asp:ListItem Text="Publisher 3" Value="Publisher 3"></asp:ListItem>


                                    </asp:DropDownList>
                                </div>

                            </div>
                            <div class="col-md-4">
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox Class="form-control" ID="Textbox6" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Edition</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox10" runat="server" placeholder="Edition"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Book(Cost per unit)</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox11" runat="server" placeholder="Book(Cost per unit)" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Pages</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox12" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Actual Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox7" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Current Stock</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox8" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label>Book Issued</label>
                                    <div class="form-group">
                                        <asp:TextBox Class="form-control" ID="Textbox9" runat="server" placeholder="Book Issued" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-12">

                                   
                                    <label>Book Description</label>
                                    <div class="Pages">
                                        <asp:TextBox Class="form-control" ID="Textbox2" runat="server" placeholder="Descprition"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4 mx-auto">
                                        <asp:Button ID="Button1" class="btn-btn-lg btn-block btn-primary" runat="server" Text="Add" Width="158px" OnClick="Button1_Click" />
                                    </div>
                                    <div class="col-4 mx-auto">
                                        <asp:Button ID="Button3" class="btn-btn-lg btn-block btn-warning" runat="server" Text="Update" Width="161px" OnClick="Button3_Click" />
                                    </div>
                                    <div class="col-4 mx-auto">
                                        <asp:Button ID="Button4" class="btn-btn-lg btn-block btn-danger" runat="server" Text="Delete" Width="162px" OnClick="Button4_Click" />
                                    </div>
                                     

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                </div>
              
                <div class="col-md-6">

                    <div class="col-md-7 ">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <center>
                                      <h1>Book Inventary List</h1>
                                  </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>
                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                    <div class="col">
                                       <asp:GridView Class="table table-stripped table-bordered" OnRowCommand="GridView1_RowCommand" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" Width="733px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
  
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
  
                                            <Columns>
                                                <asp:BoundField DataField="book_id" HeaderText="ID"  SortExpression="book_id" />
             

                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                     <div class="row">
                                                                       <div class="col-12">
                                                                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Size="X-Large" Font-Bold="True"></asp:Label>
                                                                       </div>
                                                                     </div>
                                                                     <div class="row">
                                                                       </div>

                                                                    <div class="row">
                                                                         <div class="col-12">
                                                                             Author-
                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                             &nbsp;| Genre-
                                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                             &nbsp;| Language-<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                     </div>
                                                                        </div>
                                                                    <div class="row">
                                                                       <div class="col-12">
                                                                       
                                                                           Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                           &nbsp;| Publish Date-<asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                           | Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                           -Edition<asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                       
                                                                       </div>
                                                                     </div>
                                                                    <div class="row">
                                                                       <div class="col-12">
                                                                       
                                                                           Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                           &nbsp;| Actual Stock -<asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                           &nbsp;| Available-<asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                           
                                                                       
                                                                       </div>
                                                                     </div>
                                                                     <div class="row">
                                                                       <div class="col-12">
                                                                       
                                                                           New York Comments-<asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                       
                                                                         
                                                                       
                                                                          
                                                                         
                                                                       
                                                                         
                                                                           </div>
                                                                     </div>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <asp:image Class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


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
</div>
</asp:Content>
