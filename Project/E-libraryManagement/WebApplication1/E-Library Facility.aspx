<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" Codefile="E-Library Facility.aspx.cs" Inherits="WebApplication1.E_Library_Facility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
<!DOCTYPE html>  
 
<html>
    
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
        

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand" Width="1020px" Height="446px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">  
                <AlternatingRowStyle BackColor="#F7F7F7" />  
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

</html>  
    </asp:Content>