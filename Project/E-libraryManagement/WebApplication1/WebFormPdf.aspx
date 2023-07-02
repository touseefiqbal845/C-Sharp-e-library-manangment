
<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="WebFormPdf.aspx.cs" Inherits="WebApplication1.WebFormPdf"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
   

<!DOCTYPE html>  
 
 
 
<body>  


    
 
        <div>  
            <%--ASP.NET control to upload a file--%>  
            <asp:FileUpload ID="FileUpload1" runat="server" />  
               
            <%--Button to Upload the file--%>  
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload File" />  
            <br />  
            <br />  
            <br />  
            <%--Gridview to Display the Available data with file Details--%>  
            <%--Generate the OnRowCommand Event Handler of the Gridview Control--%>  
        

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Width="1020px" Height="446px">  
                <AlternatingRowStyle BackColor="White" />  
                <Columns>  
                    <%--Item Template is used to Add a custom link button whose Eval Binding is "File"--%>  
                    <asp:TemplateField HeaderText="File Name">  
                        <ItemTemplate>  
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' Text='<%# Eval("File") %>'></asp:LinkButton>  
                        </ItemTemplate>  
                    </asp:TemplateField>  
                    <asp:BoundField DataField="Size" HeaderText="Size (KB)" />  
                
                        <asp:BoundField DataField="Type" HeaderText="File Type with Extension" HtmlEncode="false" />
                </Columns>  
                <EditRowStyle BackColor="#2461BF" />  
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
                <RowStyle BackColor="#EFF3FB" />  
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
                <SortedAscendingCellStyle BackColor="#F5F7FB" />  
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
                <SortedDescendingCellStyle BackColor="#E9EBEF" />  
                <SortedDescendingHeaderStyle BackColor="#4870BE" />  
            </asp:GridView>  
        </div>  
    
</body>  
</html>  
  </asp:Content>