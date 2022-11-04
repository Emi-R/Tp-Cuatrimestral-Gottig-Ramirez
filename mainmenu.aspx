<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="mainmenu.aspx.cs" Inherits="TP_Cuatrimestral.mainmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div>
                <h1>Mesas</h1>
            </div>
            <div class="container pt-5">
                <asp:GridView runat="server" CssClass="table table-primary align-middle mb-0 bg-white" ID="dgvMesas" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Número de Mesa" DataField="Numero" />
                        <asp:BoundField HeaderText="Mesero Asignado" DataField="MeseroAsignado" />
                        <asp:BoundField HeaderText="Número de Asientos" DataField="Capacidad" />
                        <asp:CheckBoxField HeaderText="Ocupado" DataField="Ocupado" />
                        <asp:CheckBoxField HeaderText="Activa" DataField="Activo" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</asp:Content>
