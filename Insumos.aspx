<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Insumos.aspx.cs" Inherits="TP_Cuatrimestral.Insumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row m-5">
        <div class="col mt-3">
            <div class="row">
                <div class="col">
                    <asp:Label runat="server" CssClass="fs-4 fw-bold" Text="Tipo de Insumo"></asp:Label>
                </div>
            </div>

            <div class="row me-5">
                <div class="col">
                    <asp:DropDownList CssClass="btn btn-outline-dark dropwdown-toggle w-100" runat="server" ID="ddlTipoInsumo"></asp:DropDownList>
                </div>
            </div>

        </div>
        <div class="col-10">
            <div class="row">
                <asp:Repeater runat="server" ID="repeaterInsumos">
                    <ItemTemplate>
                        <div class="col-4 mt-3">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-text"><%# Eval("Id") %></p>
                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>

</asp:Content>
