<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mainmenu.aspx.cs" Inherits="TP_Cuatrimestral.mainmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
                        <div class="title-page">
                <h1 style="color:palevioletred">Bienvenido</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-2 px-4 pt-5">
                        <div class="">
                <p>Mesas libres: <%: cont %></p>
                             
            </div>

            <div>
                 <p>Mesas ocupadas: <%: cont %></p>
            </div>

                        <div>
                 <p>Mesas reservadas: <%: cont %></p>
            </div>
        </div>
        <div class="col-8">

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
                                        <asp:Button ID="btnVerDetallePedido" CommandName="IdMesa" CommandArgument='<%#: Eval("Numero") %>' cssclass="btn btn-secondary btn-rounded" runat="server" Text="Ver Pedidos" OnClick="btnVerDetallePedido_Click" />

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</asp:Content>
