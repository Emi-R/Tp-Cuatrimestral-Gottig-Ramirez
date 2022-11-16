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
    public partial class AddMesero : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarPaises();

            imgPerfil.ImageUrl = "https://static.vecteezy.com/system/resources/previews/000/439/863/non_2x/vector-users-icon.jpg";
            imgPerfil.Height = 150;
        }

        public void cargarPaises()
        {
            
            PaisesNegocio negocio = new PaisesNegocio();

            ddlPaises.DataSource = negocio.listarPaises();
            ddlPaises.DataBind();
            
        }

    }
}