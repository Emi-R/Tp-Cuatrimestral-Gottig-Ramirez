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
    public partial class mainmenu : System.Web.UI.Page
    {
        public string cont;

        protected void Page_Load(object sender, EventArgs e)
        {
            MesaNegocio negocio = new MesaNegocio();

            if (!IsPostBack)
            {
                List<Mesa> lista = negocio.ListarMesas();

                RepeaterMesas.DataSource = lista;
                cont = (lista.Where(x => x.Ocupado == false && x.Reservado == false).Count()).ToString();
                RepeaterMesas.DataBind();
            }
        }
    }
}