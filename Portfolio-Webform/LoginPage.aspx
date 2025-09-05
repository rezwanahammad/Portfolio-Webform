<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Portfolio_Webform.LoginPage" %>
<%@ Register Src="~/Controls/LoginControl.ascx" TagPrefix="uc" TagName="Login" %>
<%@ Register Src="~/Controls/SignupControl.ascx" TagPrefix="uc" TagName="Signup" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Admin Login</title>
    <link href="~/CSS/Site.css?v=<%: DateTime.Now.Ticks %>" rel="stylesheet" />
</head>
<body>
    <form runat="server">
        <div class="login-container">
            <div id="loginSection">
                <uc:Login ID="LoginControl1" runat="server" />
            </div>
            <div id="signupSection" style="display:none;">
                <uc:Signup ID="SignupControl1" runat="server" />
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function showSignup() {
            document.getElementById("loginSection").style.display = "none";
            document.getElementById("signupSection").style.display = "block";
        }
        function showLogin() {
            document.getElementById("signupSection").style.display = "none";
            document.getElementById("loginSection").style.display = "block";
        }
    </script>
</body>
</html>