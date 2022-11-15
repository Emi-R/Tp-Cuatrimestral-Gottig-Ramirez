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
        <%-- Columna izquierda --%>
        <div class="col-3" style="background-color: #ea07075f; border-top-left-radius: 15px; border-bottom-left-radius: 15px;">
            <div class=" form-outline form-white mt-3">
                <input type="text" id="txtApellido" class="form-control" />
                <label class="form-label" for="txtApellido">Apellido</label>
                <input type="text" id="txtNombre" class="form-control" />
                <label class="form-label" for="txtNombre">Nombre</label>
            </div>
            <div class="form-outline form-white mt-3">
            </div>
            <div class="form-outline form-white mt-3">
                <input type="text" id="txtDni" class="form-control" />
                <label class="form-label" for="txtDni">DNI</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="tel" id="txtTel" class="form-control" />
                <label class="form-label" for="txtTel">Telefono o Celular</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="text" id="txtCalle" class="form-control" />
                <label class="form-label" for="txtCalle">Calle</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="text" id="txtPiso" class="form-control" />
                <label class="form-label" for="txtPiso">Piso</label>
            </div>
        </div>
        <%-- Columna derecha --%>
        <div class="col-3" style="background-color: #ea07075f; border-top-right-radius: 15px; border-bottom-right-radius: 15px;">
            
            <div class="form-outline form-white mt-3">
                <input type="password" id="txtPassword" class="form-control" />
                <label class="form-label" for="txtPassword">Contraseña</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="email" id="txtEmail" class="form-control" />
                <label class="form-label" for="txtEmail">Email</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="number" id="txtNumero" class="form-control" />
                <label class="form-label" for="txtNumero">Numero</label>
            </div>
            <div class="form-outline form-white mt-3">
                <input type="text" id="txtDpto" class="form-control" />
                <label class="form-label" for="txtDpto">Departamento</label>
            </div>
        </div>
        <div class="col-3"></div>
    </div>

</asp:Content>
