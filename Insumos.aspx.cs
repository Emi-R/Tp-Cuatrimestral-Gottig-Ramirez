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
    public partial class Insumos : System.Web.UI.Page
    {
        private InsumoNegocio negocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            negocio = new InsumoNegocio();

            try
            {
                if (!IsPostBack)
                {
                    cargarRepeaterInsumos();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        private void cargarRepeaterInsumos()
        {
            if (!IsPostBack)
            {
                List<Insumo> listaInsumos = negocio.ListarInsumosConSP();
                repeaterInsumos.DataSource = listaInsumos;
                repeaterInsumos.DataBind();
            }
        }

        //queda pendiente si ver si se puede lograr desarrollar o no
        protected void linkBtnDetalle_Click(object sender, EventArgs e)
        {
            //int idInsumo = Convert.ToInt32(((Button)sender).CommandArgument);
            //int tipoInsumo = negocio.ObtenerIdTipoInsumo(idInsumo);
        }
    }
}