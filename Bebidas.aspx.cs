using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TP_Cuatrimestral
{
    public partial class Bebidas : System.Web.UI.Page
    {
        private BebidaNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new BebidaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    cargarRepeaterBebidas();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        private void cargarRepeaterBebidas()
        {
            if (!IsPostBack)
            {
                List<Bebida> listaInsumos = negocio.ListarBebidas();
                repeaterBebidas.DataSource = listaInsumos;
                repeaterBebidas.DataBind();
            }
        }
    }
}