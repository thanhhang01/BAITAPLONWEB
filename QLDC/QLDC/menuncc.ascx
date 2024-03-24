<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menuncc.ascx.cs" Inherits="QLDC.menuncc" %>
<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "sptheoncc?mancc="+Eval("mancc") %>' Text='<%# Eval("tenncc") %>'></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>

