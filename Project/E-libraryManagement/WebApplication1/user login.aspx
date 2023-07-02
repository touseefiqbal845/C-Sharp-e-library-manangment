
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="user login.aspx.cs" Inherits="WebApplication1.user_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .container-fluid{
             border: hidden;
              background-position-x: left;
              background-color: whitesmoke;
              border-bottom-width: 40px;       
                border-bottom-style: groove;
              border-radius: 60px;
              text-combine-upright: digits;
              border-top-width: 40px;
              border-top-style: groove;
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
        .container {
          
            width: 600px;
            margin: 68px auto;
            padding: 30px;
            background-color:#ccc;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
    a{
            color: red;
    text-decoration: double;
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
    <div class="container-fluid" >
        
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="img/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>Member Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Member ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                         <center>
                             
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-md" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
                        <div class="form-group">
                           <a href="user signup.aspx"><input class="btn btn-info btn-block btn-md" id="Button2" type="button" value="Sign Up" /></a>
                            </center>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx" > << Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
