<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="Portfolio_Webform.Controls.LoginControl" %>

<h2>Login</h2>
<asp:Label ID="MessageLabel" runat="server" CssClass="login-error" />

<label>Username:</label>
<asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" placeholder="Enter username" />

<label>Password:</label>
<asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" />

<asp:Button ID="LoginButton" runat="server" Text="Log In" OnClick="LoginButton_Click" CssClass="btn-primary" />

<p>
    <a href="#" onclick="showSignup(); return false;" class="login-toggle-link">Don't have an account? Sign up</a>
</p>