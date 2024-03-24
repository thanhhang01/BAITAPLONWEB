<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="QLDC.WebForm1" %>

<%@ Register Src="~/menudong.ascx" TagPrefix="uc1" TagName="menudong" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:menudong runat="server" ID="menudong" />
    </form>
</body>
</html>
