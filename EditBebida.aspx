﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditBebida.aspx.cs" Inherits="TP_Cuatrimestral.EditBebida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row m-5">
                <div class="col-3"></div>
                <div class="col-6 p-5 container-bebidas_edit">
                    <div class="row bg-light br-6">
                        <div class="col text-center">
                            <asp:Label runat="server" CssClass="form-label text-dark fw-semibold" Text="Id #"></asp:Label>
                            <asp:Label runat="server" ID="lblId" CssClass="form-label br-6 w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark fw-semibold" Text="Nombre"></asp:Label>
                        </div>

                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Precio"></asp:Label>
                        </div>

                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Capacidad"></asp:Label>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <div class="form-outline">
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-label br-6 w-100 btn-outline-dark bg-light"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-label br-6 w-100 btn-outline-dark bg-light"></asp:TextBox>

                        </div>

                        <div class="col ">
                            <asp:TextBox runat="server" ID="txtCapacidad" CssClass="form-label br-6 w-100 btn-outline-dark bg-light"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" ID="lblAlcoholica" CssClass="text-dark" Text="Es alcoholica?"></asp:Label>
                        </div>
                        <div class="col-2 p-0">
                            <asp:CheckBox runat="server" ID="ckxAlcoholica" />
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark fw-semibold" Text="Marca"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:DropDownList CssClass="form-select btn btn-outline-dark dropwdown-toggle bg-light" runat="server" ID="ddlMarcas">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row mt-5 justify-content-end">
                        <div class="col-3 text-end">
                             <asp:Button runat="server" Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click"  CssClass="btn btn-danger mb-4" />
                        </div>
                        <div class="col-3 text-end">
                            <asp:Button runat="server" Text="Agregar" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-warning mb-4" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
