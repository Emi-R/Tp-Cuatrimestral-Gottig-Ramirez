<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mainmenu.aspx.cs" Inherits="TP_Cuatrimestral.mainmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="title-page">
                <h1 style="color:whitesmoke">Bienvenido</h1>
            </div>
            <div class="container pt-3">
                <div class="row">

                    <asp:Repeater ID="RepeaterMesas" runat="server">
                        <ItemTemplate>
                            <div class="col-4">

                                <div class="card text-white <%#: (bool)Eval("Ocupado") ? "bg-danger": ((bool)Eval("Reservado") ? "bg-warning" : "bg-success")%> mb-3 text-center cardMesas">
                                    <div class="card-title" style="margin-top:20px">Mesa #<%#: Eval("Numero") %></div>
                                    <div class="card-body" style="padding:0">
                                        <%--<h5 class="card-title">Primary card title</h5>--%>
                                        <p class="card-text" >Mesero: <%#: Eval("MeseroAsignado") %></p
                                        <p class="card-text" >Asientos: <%#: Eval("Capacidad") %></p>

                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <%--<asp:GridView runat="server" CssClass="table table-primary align-middle mb-0" ID="dgvMesas" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Nro. Mesa" HeaderStyle-CssClass="headerTitle" DataField="Numero"/>
                        <asp:BoundField HeaderText="Legajo"  HeaderStyle-CssClass="headerTitle" DataField="MeseroAsignado.Legajo" />
                        <asp:BoundField HeaderText="Apellido y Nombre"  HeaderStyle-CssClass="headerTitle" DataField="MeseroAsignado" />
                        <asp:BoundField HeaderText="Número de Asientos" HeaderStyle-CssClass="headerTitle" DataField="Capacidad" />
                        <asp:CheckBoxField HeaderText="Ocupada" HeaderStyle-CssClass="headerTitle" DataField="Ocupado" />
                        <asp:CheckBoxField HeaderText="Reservada" HeaderStyle-CssClass="headerTitle" DataField="Reservado" />
                        <asp:CheckBoxField HeaderText="Activa" HeaderStyle-CssClass="headerTitle" DataField="Activo" />
                    </Columns>
                </asp:GridView>--%>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</asp:Content>
