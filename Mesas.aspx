<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="TP_Cuatrimestral.Mesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="title-page">
                <h1>Mesas</h1>
            </div>
            <div class="container pt-3">
                <asp:GridView runat="server" CssClass="table table-primary align-middle mb-0" ID="dgvMesas" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Nro. Mesa" HeaderStyle-CssClass="headerTitle" DataField="Numero"/>
                        <asp:BoundField HeaderText="Legajo"  HeaderStyle-CssClass="headerTitle" DataField="MeseroAsignado.Legajo" />
                        <asp:BoundField HeaderText="Apellido y Nombre"  HeaderStyle-CssClass="headerTitle" DataField="MeseroAsignado" />
                        <asp:BoundField HeaderText="Número de Asientos" HeaderStyle-CssClass="headerTitle" DataField="Capacidad" />
                        <asp:CheckBoxField HeaderText="Ocupada" HeaderStyle-CssClass="headerTitle" DataField="Ocupado" />
                        <asp:CheckBoxField HeaderText="Reservada" HeaderStyle-CssClass="headerTitle" DataField="Reservado" />
                        <asp:CheckBoxField HeaderText="Activa" HeaderStyle-CssClass="headerTitle" DataField="Activo" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</asp:Content>
