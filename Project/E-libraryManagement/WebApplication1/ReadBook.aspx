<%@ Page Language="C#" AutoEventWireup="true" Codefile="ReadBook.aspx.cs" Inherits="WebApplication1.ReadBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Read Book</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Read Book</h2>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <br />
            <iframe id="iframeBook" runat="server" style="width: 100%; height: 600px;"></iframe>
        </div>
    </form>
</body>
</html>
