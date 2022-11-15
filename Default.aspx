<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Cuatrimestral.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center caja">
        <div class="col ">
            <div class="row cajaLogin">
                <div class="col-6 imgLogin">
                    <div class="row">
                        <div class="col justify-content-center tituloLogin backgrLogin text-center">
                            <h2>Restaurant Fressen</h2>
                            <div class="text-center">
                                <h4>Ingrese su legajo y contraseña</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="container justify-content-center" style="width: 60%; padding-top: 50px; text-align:-webkit-center;">

                        <div class="text-center" style="font-size:150px; color:black">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <div class="form-outline mb-4">
                            <input type="email" id="form1Example1" class="form-control" />
                            <label class="form-label" for="form1Example1">Legajo</label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" id="form1Example2" class="form-control" />
                            <label class="form-label" for="form1Example2">Contraseña</label>
                        </div>

                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                            </div>

                            <div class="col">
                            </div>
                        </div>

                        <asp:Button runat="server" ID="btnIngresar" CssClass="btn btn2" OnClick="btnIngresar_Click" Text="Ingresar" />

                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
