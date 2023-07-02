<%@ Page Language="C#" AutoEventWireup="true" Codefile="The End.aspx.cs" Inherits="WebApplication1.The_End" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subscription Plans</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="radio"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
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
    </style>
</head>
<body>
    <h1>Select Subscription Plan</h1>
   <label>
    <input type="text" id="txtMemberName" runat="server" placeholder="Member Name" />
</label>

    <div class="form-group">
        <label>
            <input type="radio" id="rbPlan1" runat="server" name="plan" value="Plan 1" /> Plan 1 ($10/month)
        </label>
    </div>
    <div class="form-group">
        <label>
            <input type="radio" id="rbPlan2" runat="server" name="plan" value="Plan 2" /> Plan 2 ($20/six months)
        </label>
    </div>
    <div class="form-group">
        <label>
            <input type="radio" id="rbPlan3" runat="server" name="plan" value="Plan 3" /> Plan 3 ($30/yearly)
        </label>
    </div>
     <div>
        <asp:DropDownList ID="ddlPaymentMethod" runat="server">
            <asp:ListItem Text="Credit Card" Value="CreditCard"></asp:ListItem>
            <asp:ListItem Text="PayPal" Value="PayPal"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-primary" ID="btnSubscribe" runat="server" Text="Subscribe" OnClick="btnSubscribe_Click" />
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-secondary" ID="Button2" runat="server" Text="Back to User Login Page" OnClick="Button2_Click" />
    </div>
</body>
</html>
