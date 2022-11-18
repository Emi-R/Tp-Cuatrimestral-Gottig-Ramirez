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
    public partial class Marcas : System.Web.UI.Page
    {
        private MarcaNegocio marcaNegocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            marcaNegocio = new MarcaNegocio();

            try
            {
                cargarGridMarcas();
            }
            catch(Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        private void cargarGridMarcas()
        {
            gdvMarcas.DataSource = marcaNegocio.ListarMarcas();
            gdvMarcas.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void txtFiltroNombre_TextChanged(object sender, EventArgs e)
        {

        }
    }
}