<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="TP_Cuatrimestral.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <asp:ScriptManager runat="server"></asp:ScriptManager>--%>
    <div class="container mt-5">
        <div class="row m-2">
            <div class="col" style="background-color: #92aedb !important; border-radius: 50px">
                <div class="title-page">
                    <h1 class="mt-2 mb-2" style="color: #e2e1e5fc;">Reportes</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <asp:Label runat="server" ID="lblTotalRecaudado" Text=' Total recaudado: $' CssClass="text-dark" Enabled="false"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="row">
                    <div class="col text-center">
                        <%-- Promedio pedidos por Mesero: {aca promedio--%>
                    </div>
                </div>

                <div class="row headerTitleReporteMeseros">
                    <div class="col-1">
                        Legajo
                    </div>
                    <div class="col-3">
                        Mesero
                    </div>

                    <div class="col-3">
                        Total Pedidos
                    </div>

                    <div class="col-3">
                        Total Recaudado
                    </div>
                    <div class="col-2">
                        Dia
                    </div>
                </div>

                <%--  aca repeater--%>

                <asp:repeater runat="server" ID="repeaterReporteMeseros">
                    <itemtemplate>
                        <div class="row item-listaPedidos bg-light">
                            <div class="col-1 ">
                                <asp:Label runat="server" ID="lblLegajo" Text='<%#Eval("Legajo")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                            </div>

                            <div class="col-3 ">
                                <asp:Label runat="server" ID="lblMesero" Text='<%#Eval("Mesero")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                            </div>

                            <div class="col-3 ">
                                <asp:Label runat="server" ID="lblTotalPedidos" Text='<%# Eval("TotalPedidos") %>'></asp:Label>
                            </div>

                            <div class="col-3">
                                <asp:Label runat="server" ID="lblTotalRecaudado" Text='<%#Eval("TotalRecaudado")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                            </div>

                            <div class="col-2">
                                <asp:Label Text='<%# ((DateTime)Eval("FechaPedidos")).ToString("dd/MM/yyyy") %>' runat="server" ID="lblFechaPedidos" />
                            </div>

                        </div>
                    </itemtemplate>
                </asp:repeater>
            </div>


            <div class="col-6">
                <div class="row">
                    <div class="col">
                        Promedio pedidos por Mesa: {aca promedio
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        Mesa
                    </div>
                    <div class="col">
                        Total Pedidos
                    </div>

                    <div class="col">
                        Total Recaudado
                    </div>
                </div>

                <%--  aca repeater--%>
                <div class="row">
                    <div class="col">
                        Nombre Mesero
                    </div>
                    <div class="col">
                        Cantidad Pedidos
                    </div>
                    <div class="col">
                        Valor recaudado
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
