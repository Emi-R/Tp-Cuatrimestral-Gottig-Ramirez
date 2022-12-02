using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_Cuatrimestral
{
    public partial class AddMesa : System.Web.UI.Page
    {
        public bool confirm;

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            if (!IsPostBack)
            {
                List<Usuario> lista = negocio.listarMeseros();
                ddlMeseros.DataSource = lista;
                ddlMeseros.DataBind();
            }

        }
    }
}