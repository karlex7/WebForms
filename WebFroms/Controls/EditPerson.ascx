<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPerson.ascx.cs" Inherits="WebFroms.Controls.EditPerson" %>
<asp:Label ID="lblId" CssClass="hidden" runat="server" Text="Label"></asp:Label>
<div class="osoba">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblName" runat="server" Text="First name:" meta:resourcekey="lblNameResource1" />
            </td>
            <td>
                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="First name is required!" ControlToValidate="txtName" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSurname" runat="server" Text="Surname:" meta:resourcekey="lblSurnameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Surname is required!" ControlToValidate="txtSurname" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Email is required!" ControlToValidate="txtEmail" Display="Dynamic" meta:resourcekey="RequiredFieldValidator3Resource1" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Email is in wrong format!" ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTelephone" runat="server" Text="Telephone:" meta:resourcekey="lblTelephoneResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTelephone" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Telephone is required!" ControlToValidate="txtTelephone" Display="Dynamic" meta:resourcekey="RequiredFieldValidator4Resource1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password:" meta:resourcekey="lblPasswordResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Password is required!" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="Status:" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                    <asp:ListItem Text="User" Value="false" meta:resourcekey="ListItemResource1" />
                    <asp:ListItem Text="Admin" Value="true" meta:resourcekey="ListItemResource2" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="City:" meta:resourcekey="lblCityResource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="btnEdit" runat="server" ValidationGroup="MyValidationGroup" Text="Edit" CssClass="btn btn-primary btn-sm btnCtrl" OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1" />
                <asp:Button ID="btnDelete" runat="server" ValidationGroup="MyValidationGroup" Text="Delete" CssClass="btn btn-warning" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="MyValidationGroup" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>

</div>
    