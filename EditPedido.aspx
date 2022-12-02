<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditPedido.aspx.cs" Inherits="TP_Cuatrimestral.EditPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row m-5">
                <div class="col-3"></div>
                <div class="col-6 p-5 container-platos_edit">
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
                            <asp:DropDownList runat="server" ID="ddlMesas"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlMeseros"></asp:DropDownList>
                        </div>
                        <div class="col ">
                            <asp:TextBox runat="server" ID="txtFechaPedido" Enabled="false" Text="" TextMode="DateTime"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mt-1">
                        <div class="col">
                            <asp:Label runat="server" CssClass="form-label text-dark w-100 fw-semibold" Text="Total"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtPrecio" Enabled="false" Text="123" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
