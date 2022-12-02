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


                cargarDdlMesas();

                if(!String.IsNullOrEmpty(idPedido) && !IsPostBack)
                    PrecargarCampos(idPedido);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private void cargarDdlMesas()
        {
            //MesaNegocio negocioMesa = new MesaNegocio();

            //ddlMesas.DataSource = negocioMesa.ListarMesas();
            //ddlMesas.DataBind();
        }
        private void PrecargarCampos(string idPedido)
        {
            Pedido pedido = negocio.ListarPedidos(IdPedido: idPedido)[0];

            lblId.Text = pedido.ID.ToString();
            
        }
    }
}