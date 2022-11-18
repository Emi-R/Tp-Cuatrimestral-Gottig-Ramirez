<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="TP_Cuatrimestral.Marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-5">
        <div class="col p-5">
            <div class="row m-3 justify-content-center">
                <div class="col-6">
                    <asp:TextBox runat="server" CssClass="w100 form-control" ID="txtFiltroNombre" AutoPostBack="true" OnTextChanged="txtFiltroNombre_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-6">
                    <asp:GridView runat="server" ID="gdvMarcas" CssClass="table table-light align-middle" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" HeaderStyle-CssClass="headerTitleMarcas" DataField="Nombre" />

                            <asp:CheckBoxField ReadOnly="false" HeaderText="Activo" HeaderStyle-CssClass="headerTitleMarcas" DataField="Activo" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="row justify-content-center m-3">

                <div class="col-6 text-end">
                    <div class="row justify-content-end pe-5">
                        <div class="col-1">
                            <asp:Label runat="server" ID="lblNuevaMarca" CssClass="fs-5 fw-normal text-dark" Text="Nombre"></asp:Label>
                        </div>
                        <div class="col-4">
                            <asp:TextBox runat="server" ID="txtNuevaMarcaNombre" CssClass="w100 form-control"></asp:TextBox>
                        </div>
                        <div class="col-1">
                            <asp:Button runat="server" ID="btnAceptar" CssClass="btn btn-success " OnClick="btnAceptar_Click" Text="Aceptar" />
                        </div>
                    </div>
                    <asp:Button runat="server" ID="btnAgregar" CssClass="btn btn-primary " OnClick="btnAgregar_Click" Text="Agregar Marca" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
