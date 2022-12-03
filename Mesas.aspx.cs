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
    public partial class Mesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MesaNegocio negocio = new MesaNegocio();

            //if (Session["usuario"] == null)
            //{
            //    Session.Add("error", "Debes logearte para acceder a esta area.");
            //    Response.Redirect("Error.aspx", false);
            //}
            //else if (((Dominio.Usuario)Session["usuario"]).Perfil.Id != 1)
            //{
            //    Session.Add("error", "No posee los permisos suficientes para acceder.");
            //    Response.Redirect("Error.aspx", false);
            //}

            dgvMesas.DataSource = negocio.ListarMesas();
            dgvMesas.DataBind();
        }

        protected void dgvMesas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string num = dgvMesas.SelectedDataKey.Value.ToString();
            Response.Redirect("AddMesa.aspx?id=" + num);
        }
    }
}