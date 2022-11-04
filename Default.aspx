<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Cuatrimestral.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center caja">
        <div class="col cajaLogin">
            <div class="row">
                <div class="col-6 align-self-center imgLogin">
                    <div class="row">
                        <div class="col justify-content-center">
                            <h1 class="tituloLogin">Bienvenido a FastFood</h1>
                            <h4 class="tituloLogin">Ingrese su legajo y contraseña</h4>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="container justify-content-center" style="width: 60%;padding-top:50px;">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="form1Example1" class="form-control" />
                            <label class="form-label" for="form1Example1">Legajo</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="form1Example2" class="form-control" />
                            <label class="form-label" for="form1Example2">Contraseña</label>
                        </div>

                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                            </div>

                            <div class="col">
                            </div>
                        </div>

                        <!-- Submit button -->
                        <asp:Button runat="server" ID="btnIngresar" cssclass="btn btn-primary" onClick="btnIngresar_Click" Text="Ingresar" />

                    </div>
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
