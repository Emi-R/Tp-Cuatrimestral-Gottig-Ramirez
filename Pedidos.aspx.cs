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
                cargarRepeaterPedidos();
            }
        }

        private void cargarRepeaterPedidos()
        {
            List<Pedido> listaPedidos = new List<Pedido>();
            string numeroMesa = Request.QueryString["NumeroMesa"] != null ? Request.QueryString["NumeroMesa"] : "";
            if (numeroMesa != "")
                listaPedidos = negocio.ListarPedidos(numeroMesa);
            else
                listaPedidos = negocio.ListarPedidos();

            repeaterPedidos.DataSource = listaPedidos;
            repeaterPedidos.DataBind();
        }

        protected void btnVerPedido_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(((Button)sender).CommandArgument);
            Response.Redirect($"EditPedido.aspx?Id={id}", false);
        }
    }
}