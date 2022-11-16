<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddMesero.aspx.cs" Inherits="TP_Cuatrimestral.AddMesero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="pt-2">
            <h1 class="title-page display-2 pb-3">Nuevo mesero</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="boxForm">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4">
                    <!-- Apellido -->
                    <div class="col">
                        <div class="form-outline form-white">
                            <input type="text" id="txtApellido" class="form-control" />
                            <label class="form-label" for="txtApellido">Apellido</label>
                        </div>
                    </div>
                    <!-- Nombre -->
                    <div class="col">
                        <div class="form-outline form-white">
                            <input type="text" id="txtNombre" class="form-control" />
                            <label class="form-label" for="txtNombre">Nombre</label>
                        </div>
                    </div>
                </div>

                <!-- Contraseña -->
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <input type="password" id="txtPassword" class="form-control" />
                            <label class="form-label" for="txtPassword">Contraseña</label>
                        </div>
                    </div>
                    <!-- DNI -->
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <input type="text" id="txtDni" class="form-control" />
                            <label class="form-label" for="txtDni">DNI</label>
                        </div>
                    </div>
                    <%-- Fecha Nac --%>
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="form-outline form-white mb">
                                    <input type="text" id="txtDia" class="form-control" />
                                    <label class="form-label" for="txtDia">Dia</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-outline form-white mb">
                                    <input type="text" id="txtMes" class="form-control" />
                                    <label class="form-label" for="txtMes">Mes</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-outline form-white mb">
                                    <input type="text" id="txtAnio" class="form-control" />
                                    <label class="form-label" for="txtAnio">Año</label>

                                </div>
                            </div>
                            <div id="textExample1" class="form-text" style="color: #ffffff !important">
                                Fecha de Nacimiento
                            </div>
                        </div>
                    </div>
                </div>
                <hr style="margin-top: -15px;" />
                <div class="row">
                    <div class="col">
                        <%-- Telefono --%>
                        <div class="form-outline form-white mb-4">
                            <input type="number" id="txtTelefono" class="form-control" />
                            <label class="form-label" for="txtTelefono">Telefono o Celular</label>
                        </div>
                    </div>
                    <div class="col">
                        <%-- Email --%>
                        <div class="form-outline form-white mb-4">
                            <input type="email" id="txtEmail" class="form-control" />
                            <label class="form-label" for="txtEmail">Email</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <input type="text" id="txtCalle" class="form-control" />
                            <label class="form-label" for="txtCalle">Calle</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline form-white mb-4">
                            <input type="text" id="txtNumero" class="form-control" />
                            <label class="form-label" for="txtNumero">Número</label>
                        </div>
                    </div>
                    <div class="col">
                        
                    </div>
                    <div class="col">
                        <asp:DropDownList cssclass="btn btn-info dropdown-toggle" ID="ddlPaises" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <!-- Calle -->

                <!-- Message input -->
                <div class="form-outline form-white mb-4">
                    <textarea class="form-control" id="form6Example7" rows="4"></textarea>
                    <label class="form-label" for="form6Example7">Additional information</label>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form6Example8" checked />
                    <label class="form-check-label" for="form6Example8">Create an account? </label>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">Place order</button>
            </div>
        </div>
        <div class="col-3"></div>
    </div>

</asp:Content>
