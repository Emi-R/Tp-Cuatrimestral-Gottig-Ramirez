using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TP_Cuatrimestral
{
    public partial class EditPedido : System.Web.UI.Page
    {
        private PedidoNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new PedidoNegocio();
            try
            {
                string idPedido = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : "";


                if(!IsPostBack)
                {
                    cargarDdlMesas();
                    cargarDdlEmpleados();
                }

                if (!String.IsNullOrEmpty(idPedido) && !IsPostBack)
                    PrecargarCampos(idPedido);
                else
                    txtFechaPedido.Text = DateTime.Now.ToString("yyyy-MM-dd");


            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private void cargarDdlMesas()
        {
            MesaNegocio negocioMesa = new MesaNegocio();

            ddlMesas.DataSource = negocioMesa.ListarMesas();
            ddlMesas.DataTextField = "Numero";
            ddlMesas.DataValueField = "ID";
            ddlMesas.DataBind();
        }

        private void cargarDdlEmpleados()
        {
            UsuarioNegocio negocioUsuario = new UsuarioNegocio();

            ddlMeseros.DataSource = negocioUsuario.listarUsuarios().Where(x => x.Perfil.Id == (int)Perfiles.Mesero);
            ddlMeseros.DataTextField = "Legajo";
            ddlMeseros.DataValueField = "Legajo";
            ddlMeseros.DataBind();

        }
        private void PrecargarCampos(string idPedido)
        {
            Pedido pedido = negocio.ListarPedidos(IdPedido: idPedido)[0];

            lblId.Text = pedido.ID.ToString();

            ddlMesas.SelectedIndex = ddlMesas.Items.IndexOf((ddlMesas.Items.FindByValue(pedido.Mesa.Numero.ToString())));

            cargarDgvDetallePedido(idPedido);

            txtFechaPedido.Text = pedido.FechaPedido.ToString("yyyy-MM-dd");
            txtPrecio.Text = pedido.Total.ToString();

            btnAgregar.Visible = false;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Pedido pedido = new Pedido();

            pedido.Mesa = new Mesa();
            pedido.Mesa.ID = Convert.ToInt32(ddlMesas.SelectedItem.Value);

            pedido.MeseroAsignado = new Usuario();
            pedido.MeseroAsignado.Legajo = Convert.ToInt32(ddlMeseros.SelectedItem.Value);

            int IdPedido = negocio.AgregarPedido(pedido);
            lblId.Text = IdPedido.ToString();
            btnAgregar.Visible = false;
        }

        private void cargarDgvDetallePedido(string IdPedido)
        {
            DetallePedidoNegocio detalleNegocio = new DetallePedidoNegocio();
            repeaterDetallePedido.DataSource = detalleNegocio.ListarDetallePedido(IdPedido);
            repeaterDetallePedido.DataBind();
        }

        protected void btnAgregarBebida_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregarPlato_Click(object sender, EventArgs e)
        {

        }
    }
}