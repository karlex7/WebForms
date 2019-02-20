<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFroms.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="col-lg-4 col-md-4 col-sm-4"></div>

    <div class="col-lg-4 col-md-4 col-sm-4">

        <div class="form-group">
            <asp:Label runat="server" Text="Email:" Font-Bold="true"/>
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is required!" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="userExists" runat="server" ErrorMessage="User does not exist!" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Password:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is required!" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="passwordWrong" runat="server" ErrorMessage="Wrong password!" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
        </div>
        <div class="form-group">
            <asp:CheckBox ID="chbRemember" Text="Remember me" runat="server" Font-Bold="false" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Enter" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
        </div>
        <div class="form-group">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        </div>
    </div>
</asp:Content>
