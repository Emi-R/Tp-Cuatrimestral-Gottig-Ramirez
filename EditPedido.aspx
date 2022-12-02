<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditPedido.aspx.cs" Inherits="TP_Cuatrimestral.EditPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row mb-3 m-5 justify-content-center">
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



                    <div class="row mb-3 justify-content-end">
                        <div class="col-3">
                            <asp:Button runat="server" Text="Agregar Bebida" ID="btnAgregarBebida" OnClick="btnAgregarBebida_Click" CssClass=" btn btn-primary mb-1" />
                        </div>
                        <div class="col-3">
                            <asp:Button runat="server" Text="Agregar Plato" ID="btnAgregarPlato" OnClick="btnAgregarPlato_Click" CssClass=" btn btn-danger mb-1" />
                        </div>
                    </div>
                    <div class="row mb-3 mx-2">
                        <div class="col">
                            <div class="row headerTitleDetallePedido">
                                <div class="col-6">
                                    <asp:Label runat="server" Text="Nombre"></asp:Label>
                                </div>
                                <div class="col-2">
                                    <asp:Label runat="server" Text="Cantidad"></asp:Label>
                                </div>
                                <div class="col">
                                    <asp:Label runat="server" Text="Precio Unitario"></asp:Label>
                                </div>
                            </div>
                            <asp:Repeater runat="server" ID="repeaterDetallePedido">
                                <ItemTemplate>
                                    <div class="row itemDetallePedido">
                                        <div class="col-6 m-auto">
                                            <asp:Label runat="server" ID="txtNombreInsumo" Text='<%#Eval("Insumo.Nombre")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                                        </div>
                                        <div class="col-2 m-auto ">
                                            <asp:Label runat="server" ID="lblCantidad" Text='<%#Eval("Cantidad")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                                        </div>
                                        <div class="col m-auto ">
                                            <asp:Label runat="server" ID="lblPrecioUnitario" Text='<%#Eval("PrecioUnitario")%>' CssClass="text-dark" Enabled="false"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
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

            <div class="row m-5 mt-2 justify-content-center">
                <div class="col-6 text-end">
                    <asp:Button Visible="true" runat="server" Text="Agregar Pedido" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="w-200px btn btn-success mb-4" />
                </div>
            </div>

            <div id="rowAgregarInsumo" runat="server" visible="false" class="row justify-content-center m-auto" style="width: 100%; position: fixed; z-index: 100; top: 30%">
                <div class="col-6 p-5 container-bebidas_edit text-dark">
                    <div class="row">
                        <div class="col">
                            <asp:Label Text="Insumo" runat="server" ID="lblDetalleInsumo" />
                        </div>


                        <div class="col">
                            Precio Unitario
                        </div>
                        <div class="col">
                            Cantidad
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <asp:DropDownList OnSelectedIndexChanged="ddlDetalleInsumo_SelectedIndexChanged" AutoPostBack="true" CssClass="w-100 form-select btn btn-outline-dark dropwdown-toggle bg-light p-2" runat="server" ID="ddlDetalleInsumo"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" AutoPostBack="true" ID="txtPrecioUnitario" CssClass="form-label br-6 w-100 btn-outline-dark bg-light" Enabled="false" />
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" AutoPostBack="true" ID="txtCantidad" OnTextChanged="txtCantidad_TextChanged" CssClass="form-label br-6 w-100 btn-outline-dark bg-light" TextMode="Number" />
                        </div>

                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            Total 
                        </div>
                        <div class="col-6">
                            <asp:TextBox AutoPostBack="true" runat="server" ID="txtPrecioTotalInsumos" CssClass="form-label br-6 w-100 btn-outline-dark bg-light" Enabled="false" />
                        </div>
                    </div>
                    <div class="row mt-2 justify-content-end">
                        <div class="col-4 text-end">
                            <asp:Button Visible="true" runat="server" Text="Cancelar" OnClick="btnCancelarDetalle_Click" ID="btnCancelarDetalle" CssClass="w-200px btn btn-danger" />
                        </div>
                        <div class="col-4 text-end">
                            <asp:Button Visible="true" runat="server" Text="Agregar" ID="btnAgregarDetalle" OnClick="btnAgregarDetalle_Click" CssClass="w-200px btn btn-success" />
                        </div>
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
