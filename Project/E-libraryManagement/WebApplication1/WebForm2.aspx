<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <style>
 

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
       input#ContentPlaceHolder1_Button1 {
     --bs-btn-padding-x: 5.95rem;
}
        input#Button2 {
    --bs-btn-padding-x: 5.42rem;
}
        body {
            font-family: Arial, sans-serif;
            background-color:#fff ;
        }

        .container {
          
            width: 1150px;
            margin: 40px auto;
            padding: 30px;
            background-color:#17e5d2;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
    a{
            color: red;
    text-decoration: double;
    }
            .row {
                --bs-gutter-x: -9rem;
            }
        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .card{
            margin-left: 70px:
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            width: 50%;
            padding: 8px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 9px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }
    </style>
        <div class="container-fluid">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        Book Inventory List</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                    <div class="col">
                                     
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                            <Columns>
                                                <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id">
                                                    <ControlStyle Font-Bold="True" />
                                                    <ItemStyle Font-Bold="True" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-10">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <span>Author - </span>
                                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                            &nbsp;| <span><span>&nbsp;</span>Genre - </span>
                                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                            &nbsp;|
                                                                            <span>
                                                      Language -<span>&nbsp;</span>
                                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Publisher -
                                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                            &nbsp;| Publish Date -
                                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                            &nbsp;| Pages -
                                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                            &nbsp;| Edition -
                                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Cost -
                                                                            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                            &nbsp;| Actual Stock -
                                                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                            &nbsp;| Available Stock -
                                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            Description -
                                                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                            &nbsp;
                                                                            <asp:Button ID="Button1" runat="server" PostBackUrl="~/WebFormPdf.aspx" Text="Online Read" />
                                                                            <asp:Button ID="Button2" runat="server" PostBackUrl="~/subcription login.aspx" Text="GET YOUR PDF" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-2">
                                                                    <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
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
                <center>
                    <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
                            <center>
            </div>
        </div>
    </asp:Content>