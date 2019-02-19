<%@ Page Title="Add a person" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="WebFroms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="add-person-container">

        <div class="add-person-form">
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="Name:" meta:resourcekey="lblNameResource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required!" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" meta:resourcekey="RequiredFieldValidator1Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname:" meta:resourcekey="lblSurnameResource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname is required!" ControlToValidate="txtSurname" Display="Dynamic" ForeColor="Red" meta:resourcekey="RequiredFieldValidator2Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lvlEmail" runat="server" Text="Email:" meta:resourcekey="lblEmailResource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtEmail1" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is requred!" ControlToValidate="txtEmail1" ForeColor="Red" Display="Dynamic" meta:resourcekey="RequiredFieldValidator3Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is in wrong format!" ControlToValidate="txtEmail1" Display="Dynamic" ForeColor="Red" meta:resourcekey="RegularExpressionValidator1Resource1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="MyValidationGroup">*</asp:RegularExpressionValidator>
                    <asp:LinkButton ID="btnAddMoreEmail" runat="server" Text="Add more emil adresses..." meta:resorucekey="btnAddMoreEmailResource1" />
                </div>
            </div>
            <% //Druga kolona %>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="lblTelephone" runat="server" Text="Telephone:" meta:resourcekey="lblTelephoneResource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtTelephone" CssClass="form-control" runat="server"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Telephone is required!" ControlToValidate="txtTelephone" Display="Dynamic" ForeColor="Red" meta:resourcekey="RequiredFieldValidator4Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCity" runat="server" Text="City:" meta:resourcekey="lblCityResource1" Font-Bold="true"/></asp:Label>
                    <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblStatus" runat="server" Text="Status:" meta:resourcekey="lblStatusResource1" Font-Bold="true"></asp:Label>
                    <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                        <asp:ListItem Text="User" Value="false" meta:resourcekey="ListItemResource1"/>
                        <asp:ListItem Text="Admin" Value="true" meta:resourcekey="ListItemResource2" />
                    </asp:DropDownList>
                </div>
            </div>
            <% //Treca kolona %>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="lblPassword1" runat="server" Text="Password:" meta:resourcekey="lblPassword1Resource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtPassword1" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is required!" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPassword1" meta:resourcekey="RequiredFieldValidator5Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPassword2" runat="server" Text="Confirm password:" meta:resourcekey="lblPassword2Resource1" Font-Bold="true"></asp:Label>
                    <asp:TextBox ID="txtPassword2" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password confirm is required!" Display="Dynamic" ForeColor="Red" ControlToValidate="txtPassword2" meta:resourcekey="RequiredFieldValidator6Resource1" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match!" Display="Dynamic" ControlToValidate="txtPassword2" ControlToCompare="txtPassword1" ForeColor="Red" meta:resourcekey="CompareValidator1Resource1" ValidationGroup="MyValidationGroup">*</asp:CompareValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Add" meta:resourcekey="btnAddResource1" OnClick="btnAdd_Click" ValidationGroup="MyValidationGroup" />
                </div>
            </div>
            <% //Validacije %>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" ForeColor="Red" runat="server" BackColor="White" BorderColor="White" ValidationGroup="MyValidationGroup" />
            </div>
        </div>

    </div>
</asp:Content>
