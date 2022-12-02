<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditPedido.aspx.cs" Inherits="TP_Cuatrimestral.EditPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row m-5 justify-content-center">          
                <div class="col-6 p-5 container-pedidos_edit">
                    <div class="row bg-light br-6">
                        <div class="col text-center">
                            <asp:Label runat="server" CssClass="form-label text-dark fw-semibold" Text="Pedido N°"></asp:Label>
                            <asp:Label runat="server" ID="lblId" CssClass="form-label br-6 w-100"></asp:Label>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark fw-semibold" Text="Mesa N°"></asp:Label>
                        </div>

                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Mesero Asignado"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Fecha Pedido"></asp:Label>
                        </div>

                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <asp:DropDownList CssClass="w-100 form-select btn btn-outline-dark dropwdown-toggle bg-light p-2" runat="server" ID="ddlMesas"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:DropDownList CssClass="w-100 form-select btn btn-outline-dark dropwdown-toggle bg-light p-2" runat="server" ID="ddlMeseros"></asp:DropDownList>
                        </div>
                        <div class="col ">
                            <asp:TextBox runat="server" CssClass="form-label br-6 w-100 btn-outline-dark bg-light p-1" ID="txtFechaPedido" Enabled="false" Text="" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Total"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:TextBox runat="server" CssClass="form-label br-6 w-100 btn-outline-dark bg-light" ID="txtPrecio" Enabled="false" Text=""></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row m-5 justify-content-center">
                <div class="col-6 text-end">
                    <asp:Button Visible="true" runat="server" Text="Agregar Pedido" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="w-200px btn btn-success mb-4" />
                </div>
            </div>

            <div class="row" runat="server" ID="sectionInsumos" Visible="false">
                <div class="col" >
                    asdsad
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
