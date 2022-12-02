<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddMesa.aspx.cs" Inherits="TP_Cuatrimestral.AddMesa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="row pt-4 mb-4">
        <div class="col-3"></div>
        <div class="col-6 " style="background-color: #92aedb !important; border-radius: 50px">
            <div class="title-page">
                <h1 class="mt-4 mb-4" style="color: #e2e1e5fc;">
                    <asp:Label ID="titulo" runat="server" Text="Editar mesa / Asignar mesero"></asp:Label>
                </h1>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="boxForm">

                <div class="row mb-4">
                    <!-- txtNumeroMesa -->
                    <div class="col">
                        <div class="form-outline form-white">
                            <asp:TextBox ID="txtNumeroMesa" CssClass="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtNumeroMesa">Numero de Mesa</label>
                        </div>
                    </div>
                    <!-- Nombre -->
                    <div class="col">
                        <div class="form-outline form-white">
                            <asp:Label runat="server" style="color:white" CssClass="h6" Text="Mesero a asignar: "></asp:Label>
                            <asp:DropDownList ID="ddlMeseros" CssClass="btn btn-info dropdown-toggle" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Contraseña -->
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <asp:CheckBox id="chkReservado" text="Es reserva?" runat="server"></asp:CheckBox>
                        </div>
                    </div>
                    <!-- DNI -->
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <asp:CheckBox id="chkOcupado" text="Esta ocupada?" runat="server"></asp:CheckBox>
                        </div>
                    </div>
                    <%-- Fecha Nac --%>
                    <div class="col">
                        <div class="form-outline form-white">
                            <asp:TextBox ID="txtCapacidad" CssClass="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtCapacidad">Numero de Asientos</label>
                        </div>
                    </div>
                </div>
                <hr style="margin-top: -15px;" />
                <div class="row">
                    <div class="col">
                        <%-- Telefono --%>

                    </div>
                    <div class="col">
                        <%-- Email --%>
                        <div class="form-outline form-white mb-4">
                            <asp:TextBox TextMode="Email" ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtEmail">Email</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <%-- Calle --%>
                        <div class="form-outline form-white mb-4">
                            <asp:TextBox ID="txtCalle" class="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtCalle">Calle</label>
                        </div>
                    </div>
                    <div class="col">
                        <%-- Numero --%>
                        <div class="form-outline form-white mb-4">
                            <asp:TextBox TextMode="Number" ID="txtNumero" class="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtNumero">Número</label>
                        </div>
                    </div>
                    <div class="col">
                        <%-- Numero --%>
                        <div class="form-outline form-white mb-4">
                            <asp:TextBox TextMode="Number" ID="txtPiso" class="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtPiso">Piso</label>
                        </div>
                    </div>
                    <div class="col">
                        <%-- Calle --%>
                        <div class="form-outline form-white mb-4">
                            <asp:TextBox ID="txtDpto" class="form-control" runat="server"></asp:TextBox>
                            <label class="form-label" for="txtDpto">Dpto</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle dropdown-toggle2" Style="width: 95%" ID="ddlPaises" runat="server"></asp:DropDownList>
                        </div>
                    </div>


                </div>
                <!-- Ruta Imagen con update panel -->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                        <div class="row mb-4">
                            <div class="col" style="align-self: center">
                                <div class="form-outline form-white">
                                    <asp:TextBox TextMode="Url" CssClass="form-control" ID="txtUrlImagen" AutoPostBack="true" runat="server"></asp:TextBox>
                                    <label class="form-label" for="txtUrlImagen">Ruta Imagen</label>
                                </div>
                            </div>
                            <div class="col" style="text-align: center;">
                                <asp:Image ID="imgPerfil" runat="server" />
                            </div>
                        </div>
                    </contenttemplate>
                </asp:UpdatePanel>
                <!-- Boton Agregar -->
                <div class="row">
                    <div class="col">
                        <asp:Button ID="btnAgregarMesero" CssClass="btn btn-primary mb-4" runat="server" Text="Agregar" />
                    </div>
                    <div class="col">
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger mb-4" runat="server" Text="Eliminar" />
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <contenttemplate>

                            <%if (true)
                                { %>

                            <div class="col">
                                <asp:Label ID="lblConfirm" runat="server" CssClass="lead" Text="Desea eliminar?"></asp:Label>
                            </div>
                            <div class="col">
                                <asp:Button ID="btnConfirmar" CssClass="btn btn-danger mb-4" runat="server" Text="Sí" />
                            </div>

                            <%} %>
                        </contenttemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <div class="col-3"></div>


    </div>
</asp:Content>
