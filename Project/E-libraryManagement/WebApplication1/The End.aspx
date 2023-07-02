<%@ Page Language="C#" AutoEventWireup="true" Codefile="The End.aspx.cs" Inherits="WebApplication1.The_End" %>
<!DOCTYPE html>
<html>
<head>

    <title>Subscription Plans</title>
    <!-- Include any required CSS or JavaScript files -->
</head>
<body class="auto-style2">
    <style>
        
        <style>

        .body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-{
            margin-bottom: 15px;
            background-color:antiquewhite;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 700;
            font-style: italic;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: #007bff;
            margin-right: 0px;
            margin-top: 48px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }

        #formSubscription {
    height: 472px;
    background-color: #b2c6ff;
}
        .auto-style1 {}
        .auto-style2 {
            height: 624px;
            width: 804px;
            margin-left: 329px;
        }
        #formSubscription {
            height: 462px;
            width: 853px;
        }
        #txtMemberName {
            width: 194px;
            height: 40px;
              background-color:#b2c6ff;
        }
        .form{
            background-color:#b2c6ff;
        }
         .form1{
            background-color:#b2c6ff;
        }


        .auto-style3 {
            color: #0066FF;
        }


    </style>
    <center>
    <form id="formSubscription" runat="server">
        <h1>Select Subscription Plan</h1>
        <div>
        <label>
            <input type="text" id="txtMemberName" runat="server" placeholder="Member Name" />
        </label>
    </div>
        <div>
            <label>
                <input type="radio" id="rbPlan1" runat="server" name="plan" value="Plan 1" /> Plan 1 ($10/month)
            </label>
        </div>
        <div>
            <label aria-selected="undefined">
                <input type="radio" id="rbPlan2" runat="server" name="plan" value="Plan 2" /> Plan 2 ($20/six month)
            </label>
        </div>
        <div>
            <label>
                <input type="radio" id="rbPlan3" runat="server" name="plan" value="Plan 3" /> Plan 3 ($30/Yearly)
            </label>
        </div>
        <div>
        <asp:DropDownList ID="ddlPaymentMethod" runat="server" Font-Names="Bahnschrift SemiBold" Font-Size="X-Large" CssClass="auto-style3" Height="47px">
            <asp:ListItem Text="Credit Card" Value="CreditCard"></asp:ListItem>
            <asp:ListItem Text="PayPal" Value="PayPal"></asp:ListItem>
        </asp:DropDownList>
    </div>
        <div>
        </div>
            <asp:Button ID="btnSubscribe" runat="server" Text="Go to Premium Subscription" OnClick="btnSubscribe_Click" BackColor="Lime" BorderColor="#6600FF" BorderStyle="Solid" CssClass="container" Height="96px" Width="224px" />
        <asp:Button class="btn btn-primary " ID="Button2" runat="server" Text="&lt;&lt; Back to User Login Page" OnClick="Button2_Click" Height="98px" />
    </form>
        </center>


      



</body>
</html>