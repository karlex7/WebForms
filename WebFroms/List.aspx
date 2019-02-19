<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebFroms.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-container">
        <div id="accordion" class="panel-group">
            <%//grid view %>
            <div class="panel panel-default">
                <%//header %>
                <div class="panel-heading">
                    <div class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <asp:Label runat="server" Text="GridView"></asp:Label>
                        </a>
                    </div>
                </div>
                <%//content %>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">

                        <asp:GridView ID="GwPersons" CssClass="table table-hover" runat="server" AutoGenerateColumns="false" OnRowEditing="GwPersons_RowEditing" OnRowUpdating="GwPersons_RowUpdating" OnRowCancelingEdit="GwPersons_RowCancelingEdit" BorderStyle="None" BorderColor="White">
                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" runat="server" Text='<%# Bind("IDPerson") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FirstName" HeaderText="First name" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="Black" />
                                <asp:BoundField DataField="Surname" HeaderText="Surname" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="Black" />
                                <asp:BoundField DataField="Telephone" HeaderText="Telephone" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="Black" />
                                <asp:BoundField DataField="Admin" HeaderText="Is Admin" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="Black" />
                                <asp:CommandField ShowEditButton="true" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="Black" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="panle panel-default">
                <%//header %>
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-togle="collapse" data-parent="#accordion" href="#collapseTwo">
                            <asp:Label runat="server" Text="Repeater"></asp:Label>
                        </a>
                    </h4>
                </div>
                <%//content %>
                <div id="collapseTwo" class="panel-collapse collapse in">
                    <div class="panel-body">

                        <asp:Repeater ID="RepeaterPerson" runat="server" OnItemDataBound="RepeaterPerson_ItemDataBound">
                                <headertemplate>
                                <table class=""table table-condensed table-hover">
                                    <tr style="background:#333; color:white;">
                                        <th>
                                            <asp:Label Text="Name" runat="server" meta:resourcekey="LabelResource3" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Surname" runat="server" meta:resourcekey="LabelResource4" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Email" runat="server" meta:resourcekey="LabelResource5" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Telephone" runat="server" meta:resourcekey="LabelResource6" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Is Admin" runat="server" meta:resourcekey="LabelResource7" />
                                        </th>
                                        <th>
                                            <asp:Label Text="City" runat="server" meta:resourcekey="LabelResource8" />
                                        </th>
                                        <th></th>
                                    </tr>                                
                            </headertemplate>

                                <itemtemplate>
                                    
                                    <tr>
                                        <asp:Label ID="lblIDPerson" CssClass="hidden" runat="server" Text='<%# Eval("IDPerson") %>'/>
                                        <td>
                                            <%# Eval("FirstName") %>
                                        </td>
                                        <td>
                                            <%# Eval("Surname") %>
                                        </td>
                                            <td id="tdEmail" runat="server"></td>
                                        <td>
                                            <%# Eval("Telephone") %>
                                        </td>
                                        <td>
                                            <%# Eval("Admin") %>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("CityID") %>' CssClass="hidden"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:HyperLink runat="server" Text="Edit" CssClass="btn btn-primary"/>
                                        </td>
                                    </tr>

                            </itemtemplate>

                                <footertemplate>
                                </table>
                            </footertemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
