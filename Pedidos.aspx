<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TP_Cuatrimestral.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="scrpManager"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" ID="updatePanel">
        <ContentTemplate>
            <div class="row m-5">
                <div class="col">
                    <div class="row">
                        <div class="col-2">
                            <div class="row mb-2">
                                <div class="col">
                                    <asp:Label runat="server" CssClass="text-dark" Text="Filtrar Pedidos por:"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="btn-group-vertical w-200px" role="group" aria-label=" Basic radio toggle button group">

                                    <asp:Button CssClass="w-200px btn btn-outline-primary bg-light p-2" OnClick="btnTodosLosEstados_Click" Text="Todos los Pedidos" runat="server" ID="btnTodosLosEstados"></asp:Button>

                                    <asp:Button CssClass="w-200px btn btn-outline-success bg-light p-2" OnClick="btnEstadoEntregados_Click" Text="Pedidos Entregados" runat="server" ID="btnEstadoEntregados"></asp:Button>

                                    <asp:Button CssClass="w-200px btn btn-outline-danger bg-light p-2" OnClick="btnEstadoPendiente_Click" Text="Pedidos Pendientes" runat="server" ID="btnEstadoPendiente"></asp:Button>

                                </div>
                            </div>
                        </div>

                        <div class="col-8">
                            <div class="row headerTitleMarcas">
                                <div class="col-2">
                                    <asp:Label runat="server" Text="Pedido N°"></asp:Label>
                                </div>
                                <div class="col-2">
                                    <asp:Label runat="server" Text="Total"></asp:Label>
                                </div>
                                <div class="col-2">
                                    <asp:Label runat="server" Text="Mesa N°"></asp:Label>
                                </div>
                                <div class="col-2">
                                    <asp:Label runat="server" Text="Entregado"></asp:Label>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>
                            <asp:Repeater runat="server" ID="repeaterPedidos">
                                <ItemTemplate>
                                    <div class="row item-listaPedidos">
                                        <div class="col-2 ">
                                            <asp:Label runat="server" ID="txtIdPedido" Text='<%#Eval("ID")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                                        </div>

                                        <div class="col-2 ">
                                            <asp:Label runat="server" ID="lblTotal" Text='<%#Eval("Total")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                                        </div>

                                        <div class="col-2 ">
                                            <asp:Label runat="server" ID="lblNumeroMesa" Text='<%# Eval("Mesa.Numero") %>'></asp:Label>
                                            <%--                                    <asp:CheckBox runat="server" ID="cbxEntregado" Enabled="false" Checked='<%#Eval("Entregado") %>' />--%>
                                        </div>

                                        <div class="col-2">
                                            <asp:Label runat="server" ID="lblEntregado" Text='<%# (bool)Eval("Entregado") ? "Entregado" : "Pendiente"%>'></asp:Label>
                                            <%--                                    <asp:CheckBox runat="server" ID="cbxEntregado" Enabled="false" Checked='<%#Eval("Entregado") %>' />--%>
                                        </div>

                                        <div class="col-4 m-auto">
                                            <asp:Button runat="server" CssClass="btn btn-warning m-1" CommandArgument='<%#Eval("ID")%>' CommandName="idPedido" ID="btnVerPedido" OnClick="btnVerPedido_Click" Text="Ver Pedido" />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="col-2">
                            <asp:Button runat="server" Text="Agregar Pedido" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="w-200px btn btn-success mb-4" />
                        </div>
                    </div>


                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
