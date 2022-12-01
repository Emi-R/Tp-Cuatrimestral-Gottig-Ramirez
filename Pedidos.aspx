<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TP_Cuatrimestral.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-5">
        <div class="col">

            <div class="row justify-content-center">
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
                            <div class="row">
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
                                    <asp:Button runat="server" CssClass="btn btn-success m-1" CommandArgument='<%#Eval("ID")%>' CommandName="idPedido" ID="btnVerPedido" OnClick="btnVerPedido_Click" Text="Ver Pedido" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
