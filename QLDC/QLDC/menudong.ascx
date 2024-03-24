<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menudong.ascx.cs" Inherits="QLDC.menudong1" %>
<p>
    <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "sptheoloai?maloai="+Eval("maloai") %>' Text='<%# Eval("tenloai") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:DataList>
</p>
