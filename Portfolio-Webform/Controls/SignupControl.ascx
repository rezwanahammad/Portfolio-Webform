<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignupControl.ascx.cs" Inherits="Portfolio_Webform.Controls.SignupControl" %>

<h2>Sign Up</h2>
<asp:Label ID="MessageLabel" runat="server" CssClass="login-error" />

<label>Username:</label>
<asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" placeholder="Choose a username" />

<label>Password:</label>
<asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="form-control" placeholder="Choose a password" />

<asp:Button ID="SignUpButton" runat="server" Text="Sign Up" OnClick="SignUpButton_Click" CssClass="btn-primary" />

<p>
    <a href="#" onclick="showLogin(); return false;" class="login-toggle-link">Already have an account? Log in</a>
</p>