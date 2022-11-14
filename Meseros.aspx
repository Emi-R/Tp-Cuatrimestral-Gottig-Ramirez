<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Meseros.aspx.cs" Inherits="TP_Cuatrimestral.Meseros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row m-5">
        <div class="col mt-3">
            <div class="row">
                <div class="col">
                    <asp:Label runat="server" CssClass="fs-5 fw-bold" Text="Tipo de Perfil"></asp:Label>
                </div>
            </div>

            <div class="row me-5">
                <div class="col">
                    <asp:DropDownList CssClass="btn btn-outline-dark dropwdown-toggle w-100" runat="server" ID="ddlTipoPerfil"></asp:DropDownList>
                </div>
            </div>

        </div>
        <div class="col-10">
            <div class="row  row-cols-1 row-cols-md-3 g-4">
                <asp:Repeater runat="server" ID="repeaterMeseros">
                    <ItemTemplate>
                        <div class="card" style="width: 18rem;margin-left:auto;margin-bottom:3px">
                            <img src="https://static.vecteezy.com/system/resources/previews/000/439/863/non_2x/vector-users-icon.jpg" class="card-img-top" alt="Chicago Skyscrapers" />
                            <div class="card-body">
                                <h5 class="card-title">Legajo: #<%# Eval("Legajo") %></h5>
                                <p class="card-text">Apellido: <%# Eval("Apellido") %></p>
                            </div>
                            <ul class="list-group list-group-light list-group-small">
                                <li class="list-group-item px-4">Dni: <%# Eval("Dni") %></li>
                                <li class="list-group-item px-4">Nacimiento: <%# Eval("FechaNacimiento") %></li>
                                <li class="list-group-item px-4">Ingreso: <%# Eval("FechaRegistro") %></li>
                            </ul>
                            <div class="card-body">
                                <a href="#" class="card-link"><button type="button" class="btn btn-info">+ Info</button></a>
                                <a href="#" class="card-link"><button type="button" class="btn btn-danger">Eliminar</button></a>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>

</asp:Content>
