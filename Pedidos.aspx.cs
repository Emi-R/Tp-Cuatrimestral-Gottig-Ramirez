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
    public partial class Pedidos : System.Web.UI.Page
    {
        private PedidoNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new PedidoNegocio();

            if (!IsPostBack)
            {
                if (Session["usuario"] == null)
                {
                    Session.Add("error", "Debes logearte para acceder a esta area.");
                    Response.Redirect("Error.aspx", false);
                }
                else
                {
                    cargarRepeaterPedidos();
                }
            }
        }

        private void cargarRepeaterPedidos(int estado = 2)
        {
            List<Pedido> listaPedidos = new List<Pedido>();
            string numeroMesa = Request.QueryString["NumeroMesa"] != null ? Request.QueryString["NumeroMesa"] : "";

            if (numeroMesa != "")
                listaPedidos = negocio.ListarPedidos(numeroMesa);
            else
                listaPedidos = negocio.ListarPedidos();

            //si la fecha del filtro contiene algo, lo filtra por fecha, si no filtra los pedidos de la fecha actual
            string fechaFiltro = txtFechaPedido.Text;
            if (fechaFiltro == "")
                listaPedidos = listaPedidos.Where(x => x.FechaPedido.Date == DateTime.Now.Date).ToList();
            else
                listaPedidos = listaPedidos.Where(x => x.FechaPedido.Date == DateTime.Parse(fechaFiltro).Date).ToList();

            //filtra dependiendo si el pedido esta entregado o no
            switch (estado)
            {
                case 0:
                    listaPedidos = listaPedidos.Where(x => !x.Entregado).ToList();
                    break;

                case 1:
                    listaPedidos = listaPedidos.Where(x => x.Entregado).ToList();
                    break;

                default:
                    break;
            }

            repeaterPedidos.DataSource = listaPedidos;
            repeaterPedidos.DataBind();
        }

        protected void btnVerPedido_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((Button)sender).CommandArgument);
            Response.Redirect($"EditPedido.aspx?Id={id}", false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string numeroMesa = Request.QueryString["NumeroMesa"];

            if (!String.IsNullOrEmpty(numeroMesa))
            {
                MesaNegocio negocioMesa = new MesaNegocio();
                Mesa mesa = negocioMesa.ObtenerMesaPorNumero(numeroMesa);
                Response.Redirect($"EditPedido.aspx?IdMesa={mesa.ID}&LegajoMesero={mesa.MeseroAsignado.Legajo}", false);
            }
            else
            {
                Response.Redirect($"EditPedido.aspx", false);
            }
        }

        protected void btnTodosLosEstados_Click(object sender, EventArgs e)
        {
            cargarRepeaterPedidos();
        }

        protected void btnEstadoEntregados_Click(object sender, EventArgs e)
        {
            cargarRepeaterPedidos(1);
        }

        protected void btnEstadoPendiente_Click(object sender, EventArgs e)
        {
            cargarRepeaterPedidos(0);
        }

        protected void btnEntregado_Click(object sender, EventArgs e)
        {
            int idSelected = Convert.ToInt32(((Button)sender).CommandArgument);
            negocio.CambiarEstadoPedido(idSelected, true);
            cargarRepeaterPedidos();

        }

        protected void btnEliminarPedido_Click(object sender, EventArgs e)
        {

        }

        protected void txtFechaPedido_TextChanged(object sender, EventArgs e)
        {
            cargarRepeaterPedidos();
        }
    }
}