<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.ascx.cs" Inherits="Portfolio_Webform.Controls.AdminPanel" %>

<div style="margin-bottom: 2rem; padding: 1.5rem; background: #f0fdfa; border: 1px solid #20B2AA; border-radius: 0.75rem;">
    <h3 style="color: #1e293b; margin-bottom: 1rem;">Add New Project</h3>
    <table style="width: 100%; border-spacing: 10px;">
        <tr>
            <td><label>Title:</label></td>
            <td><asp:TextBox ID="NewTitleTextBox" runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td><label>Description:</label></td>
            <td><asp:TextBox ID="NewDescriptionTextBox" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td><label>Image URL:</label></td>
            <td><asp:TextBox ID="NewImageUrlTextBox" runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td><label>Source URL:</label></td>
            <td><asp:TextBox ID="NewSourceUrlTextBox" runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td><label>Tech Stack:</label></td>
            <td><asp:TextBox ID="NewTechStackTextBox" runat="server" CssClass="form-control" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="AddProjectButton" runat="server" Text="Add Project" OnClick="AddProjectButton_Click" CssClass="btn-primary" />
            </td>
        </tr>
    </table>
</div>

<div class="admin-panel">
    <h2>Admin Panel</h2>
    <p>Welcome, <strong><%= Session["Username"] %></strong> | 
       <a href="Logout.aspx" onclick="return confirm('Are you sure you want to log out?');">Logout</a>
    </p>

    <asp:GridView 
        ID="ProjectsGrid" 
        runat="server" 
        AutoGenerateColumns="false"
        DataKeyNames="Id"
        CssClass="admin-table"
        OnRowDeleting="ProjectsGrid_RowDeleting"
        OnRowEditing="ProjectsGrid_RowEditing"
        OnRowUpdating="ProjectsGrid_RowUpdating"
        OnRowCancelingEdit="ProjectsGrid_RowCancelingEdit">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
            <asp:TemplateField HeaderText="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TitleTextBox" Text='<%# Bind("Title") %>' runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TitleLabel" Text='<%# Eval("Title") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tech">
                <EditItemTemplate>
                    <asp:TextBox ID="TechTextBox" Text='<%# Bind("TechStack") %>' runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TechLabel" Text='<%# Eval("TechStack") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Delete" />
        </Columns>
    </asp:GridView>

    <p><a href="../Default.aspx" class="admin-back-link">← Back to Portfolio</a></p>
</div>