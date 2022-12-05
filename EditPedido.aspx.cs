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
        private Pedido pedido;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new PedidoNegocio();
            try
            {
                string idPedido = Request.QueryString["Id"] != null ? Request.QueryString["Id"] : "";

                if (!IsPostBack)
                {
                    cargarDdlMesas();
                    cargarDdlEmpleados();
                    crearSessionDetallePedido();
                }

                if (!String.IsNullOrEmpty(idPedido))
                    PrecargarCampos(idPedido);
                else
                {
                    txtFechaPedido.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    divEntregarPedido.Visible = false;
                }



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
            ddlMesas.Enabled = false;

            ddlMeseros.SelectedIndex = ddlMeseros.Items.IndexOf((ddlMeseros.Items.FindByValue(pedido.MeseroAsignado.Legajo.ToString())));
            ddlMeseros.Enabled = false;

            cargarDgvDetallePedido(idPedido);

            txtFechaPedido.Text = pedido.FechaPedido.ToString("yyyy-MM-dd");
            txtPrecio.Text = pedido.Total.ToString();

            if (pedido.Entregado)
            {
                btnAgregarBebida.Visible = false;
                btnAgregarPlato.Visible = false;
                divEntregarPedido.Visible = false;
            }
            divAgregarPedido.Visible = false;


        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Pedido pedido = new Pedido();

            pedido.Mesa = new Mesa();
            pedido.Mesa.ID = Convert.ToInt32(ddlMesas.SelectedItem.Value);

            pedido.MeseroAsignado = new Usuario();
            pedido.MeseroAsignado.Legajo = Convert.ToInt32(ddlMeseros.SelectedItem.Value);

            int IdPedido = negocio.AgregarPedido(pedido);

            DetallePedidoNegocio detalleNegocio = new DetallePedidoNegocio();

            List<DetallePedido> detallePedidoList = ((Pedido)Session["Pedido"]).ListDetallePedido;
            decimal total = detalleNegocio.AgregarDetallesPedido(IdPedido, detallePedidoList);

            
            negocio.ActualizarTotalPedido(IdPedido, total);

            txtPrecioTotalInsumos.Text = total.ToString();

            lblId.Text = IdPedido.ToString();

            divAgregarPedido.Visible = false;
            divEntregarPedido.Visible = true;
        }

        private void cargarDgvDetallePedido(string IdPedido = "")
        {
            if (!string.IsNullOrEmpty(IdPedido))
            {
                DetallePedidoNegocio detalleNegocio = new DetallePedidoNegocio();
                repeaterDetallePedido.DataSource = null;
                repeaterDetallePedido.DataSource = detalleNegocio.ListarDetallePedido(IdPedido);
                repeaterDetallePedido.DataBind();
            }
            else
            {
                List<DetallePedido> detallePedidoList = ((Pedido)Session["Pedido"]).ListDetallePedido;
                repeaterDetallePedido.DataSource = null;
                repeaterDetallePedido.DataSource = detallePedidoList;
                repeaterDetallePedido.DataBind();
            }

        }

        private void crearSessionDetallePedido()
        {
            pedido = new Pedido();
            if (Session["Pedido"] == null)
            {        
                Session.Add("Pedido", pedido);
            }
            else
            {
                Session["Pedido"] = pedido;
            }

        }
        protected void btnAgregarBebida_Click(object sender, EventArgs e)
        {
            rowAgregarInsumo.Visible = true;
            BebidaNegocio neogocioBebida = new BebidaNegocio();
            List<Bebida> listaBebidas = neogocioBebida.ListarBebidas();

            ddlDetalleInsumo.DataSource = listaBebidas;
            ddlDetalleInsumo.DataTextField = "Detalle";
            ddlDetalleInsumo.DataValueField = "Id";
            ddlDetalleInsumo.DataBind();

            txtPrecioUnitario.Text = listaBebidas[0].Precio.ToString();
        }

        protected void btnAgregarPlato_Click(object sender, EventArgs e)
        {
            rowAgregarInsumo.Visible = true;
            PlatoNegocio neogocioPlato = new PlatoNegocio();
            List<Plato> listaPlatos = neogocioPlato.ListarPlatos();

            ddlDetalleInsumo.DataSource = listaPlatos;
            ddlDetalleInsumo.DataTextField = "Detalle";
            ddlDetalleInsumo.DataValueField = "Id";
            ddlDetalleInsumo.DataBind();

            txtPrecioUnitario.Text = listaPlatos[0].Precio.ToString();
        }

        protected void btnCancelarDetalle_Click(object sender, EventArgs e)
        {
            rowAgregarInsumo.Visible = false;
            LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            txtPrecioUnitario.Text = "";
            txtPrecioTotalInsumos.Text = "";
            txtCantidad.Text = "";
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            int cantidad = Convert.ToInt32(txtCantidad.Text);
            decimal precio = Convert.ToDecimal(txtPrecioUnitario.Text);
            txtPrecioTotalInsumos.Text = (cantidad * precio).ToString();
        }

        protected void ddlDetalleInsumo_SelectedIndexChanged(object sender, EventArgs e)
        {
            InsumoNegocio negocioInsumo = new InsumoNegocio();
            int idSelected = (Convert.ToInt32(ddlDetalleInsumo.SelectedItem.Value));

            Insumo selected = negocioInsumo.ObtenerInsumoPorId(idSelected);
            txtPrecioUnitario.Text = selected.Precio.ToString();
            txtPrecioTotalInsumos.Text = selected.Precio.ToString();
            txtCantidad.Text = "1";

        }

        protected void btnAgregarDetalle_Click(object sender, EventArgs e)
        {
            int idSelected = (Convert.ToInt32(ddlDetalleInsumo.SelectedItem.Value));
            string nombreSelected = (ddlDetalleInsumo.SelectedItem.Text);

            Pedido pedido = ((Pedido)Session["Pedido"]);
            List<DetallePedido> detallePedidoList = ((Pedido)Session["Pedido"]).ListDetallePedido;

            if (!detallePedidoList.Any(x => x.Insumo.Id == idSelected))
            {
                DetallePedido detalle = new DetallePedido();
                detalle.Insumo = new Insumo();
                detalle.Insumo.Id = idSelected;
                detalle.Insumo.Nombre = nombreSelected;

                detalle.PrecioUnitario = Convert.ToDecimal(txtPrecioUnitario.Text);
                detalle.Cantidad = (Convert.ToInt32(txtCantidad.Text));

                detallePedidoList.Add(detalle);
                decimal total = detalle.Cantidad * detalle.PrecioUnitario;
                total += Convert.ToDecimal(txtPrecio.Text);
                txtPrecio.Text = total.ToString();
            }
            else
            {
                detallePedidoList.Where(x => x.Insumo.Id == idSelected).First().Cantidad += Convert.ToInt32(txtCantidad.Text);
                decimal total = detallePedidoList.Where(x => x.Insumo.Id == idSelected).First().PrecioUnitario * Convert.ToInt32(txtCantidad.Text);
                total += Convert.ToDecimal(txtPrecio.Text);
                txtPrecio.Text = total.ToString();
            }

            rowAgregarInsumo.Visible = false;
            LimpiarCampos();

            cargarDgvDetallePedido();

        }

        protected void btnEntregarPedido_Click(object sender, EventArgs e)
        {

        }
    }
}