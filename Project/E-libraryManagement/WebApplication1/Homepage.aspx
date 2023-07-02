<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
     .container-fluid{
             border: hidden;
              background-position-x: left;
              background-color: #b2c6ff;
              border-bottom-width: 40px;       
                border-bottom-style: groove;
              border-radius: 60px;
              text-combine-upright: digits;
              border-top-width: 40px;
              border-top-style: groove;
              margin-top: 130px;
             
         }
        .form-control{
             line-height: 2.5;
    width: 99%;
    padding: 12px 20px;
    margin: 11px -3px;
    display: grid;
 border-color:blueviolet;
    border-radius: 2px ;
        background-color: white;
    box-sizing: border-box;
}

</style>
   <section>
      <img src="img/home-bg.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                 
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/digital-inventory.png"/>
                  <h4>Digital Book Inventory</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/search-online.png"/>
                  <h4>Search Books</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/digital-inventory.png"/>
                  <h4>Defaulter List</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
         </div>
      </div>
   </section>
   <section>
      <img src="img/in-homepage-banner.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                 
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/sign-up.png" />
                  <h4>Sign Up</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/search-online.png"/>
                  <h4>Search Books</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="img/library.png"/>
                  <h4>Visit Us</h4>
                  <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
               </center>
            </div>
         </div>
      </div>
   </section>
</asp:Content>
