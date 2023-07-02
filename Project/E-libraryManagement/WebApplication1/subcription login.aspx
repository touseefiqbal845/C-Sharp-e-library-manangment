<%@ Page Language="C#" AutoEventWireup="true"   MasterPageFile="~/Site1.Master"  Codefile="subcription login.aspx.cs" Inherits="WebApplication1.subcription_login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                           <asp:Button class="btn btn-success btn-block btn-md" ID="Button1" runat="server" Text="Login"  OnClick="Button1_Click"/>
                        </div>
                        <div class="form-group">
                           <a href="Get Subscription.aspx"><input class="btn btn-info btn-block btn-md" id="Button2" type="button" value="Sign Up" /></a>
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