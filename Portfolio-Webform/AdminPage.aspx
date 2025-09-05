<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Portfolio_Webform.AdminPage" %>
<%@ Register Src="~/Controls/AdminPanel.ascx" TagPrefix="uc" TagName="AdminPanel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Panel</title>
    <link href="styles/site.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <uc:AdminPanel ID="AdminPanel1" runat="server" />
    </form>
</body>
</html>