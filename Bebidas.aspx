<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Bebidas.aspx.cs" Inherits="TP_Cuatrimestral.Bebidas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row m-5">
                <div class="col mt-3">
                    <div class="row">
                        <div class="col">
                            <asp:Label runat="server" CssClass="fs-5 fw-bold text-dark" Text="Marca"></asp:Label>
                        </div>
                    </div>

                    <div class="row me-5">
                        <div class="col">
                           <asp:DropDownList OnSelectedIndexChanged="ddlMarcas_SelectedIndexChanged" AutoPostBack="true" CssClass="btn btn-outline-dark bg-light dropwdown-toggle w-100" runat="server" ID="ddlMarcas"></asp:DropDownList>
                        </div>
                    </div>

                </div>

                <div class="col-8">
                    <div class="row  row-cols-1 row-cols-md-3 g-4">
                        <asp:Repeater runat="server" ID="repeaterBebidas">
                            <ItemTemplate>
                                <div class="col-4 mt-3">
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <p class="card-text">#<%# Eval("Id") %></p>
                                            <div class="row">
                                                <div class="col">
                                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                </div>
                                                <div class="col text-end">
                                                    <h5 class="card-title">$ <%#Eval("Precio") %></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer bg-primary p-2 text-dark bg-opacity-25 text-end">
                                            <asp:LinkButton ID="linkBtnDetalle" OnClick="linkBtnDetalle_Click" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="IdBebida" CssClass="color-black fs-6 fw-semibold  m-3" Text="Ver Detalle"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                         <div class="col text-center ">
                            <asp:Button OnClick="btnAgregar_Click" runat="server" ID="btnAgregar" CssClass="w-100 btn btn-dark" Text="Agregar Bebidas" />
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
