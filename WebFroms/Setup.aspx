<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="WebFroms.WebForm4" Culture="auto" UICulture="auto"%>
<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="col-lg-4 col-md-4 col-sm-4">
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4">
        <div class="form-group">
            <asp:Label ID="lblTheme" runat="server" Text="Theme:" meta:resorcekey="lblThemeResource1" Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="ddlTheme" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged">
                
                <asp:ListItem Text="---select---" Value="0" meta:resourcekey="ListItemResource10" />
                <asp:ListItem Text="Default" Value="default" meta:resourcekey="ListItemResource1" />
                <asp:ListItem Text="Blue" Value="blue" meta:resourcekey="ListItemResource2" />
                <asp:ListItem Text="Red" Value="red" meta:resourcekey="ListItemResource3" />
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="lblLanguage" runat="server" Text="Language:" meta:resourcekey="lblLanguageResource1" Font-Bold="true"/>
            <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged">
                <asp:ListItem Text="---select---" Value="0" meta:resourcekey="ListItemResource11" />
                <asp:ListItem Text="Croatian" Value ="hr" meta:resourcekey="ListItemResource6" />
                <asp:ListItem Text="English" Value="en" meta:resourcekey="ListItemResource7" />
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="lblRepo" runat="server" Text="Repo:" meta:resourcekey="lblRepoResource1" Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="ddlRepo" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlRepo_SelectedIndexChanged" runat="server">
                <asp:ListItem Text="---select---" Value="0" meta:resourcekey="ListItemResource12" />
                <asp:ListItem Text="DataBase" Value="1" meta:resourcekey="ListItemResource8" />
                <asp:ListItem Text="Text" Value="2" meta:resourcekey="ListItemResource9" />
            </asp:DropDownList>
        </div>
    </div>
</asp:Content>
