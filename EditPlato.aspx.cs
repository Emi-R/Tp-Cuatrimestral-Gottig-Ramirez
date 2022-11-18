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
    public partial class EditPlato : System.Web.UI.Page
    {

        private TipoPlatoNegocio tipoPlatoNegocio;
        private PlatoNegocio platoNegocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            tipoPlatoNegocio = new TipoPlatoNegocio();
            platoNegocio = new PlatoNegocio();

            try
            {
                if (!IsPostBack)
                {

                    List<TipoPlato> tipoPlatos = tipoPlatoNegocio.ListarTiposPlatos();
                    ddlTipoPlato.DataSource = tipoPlatos;
                    ddlTipoPlato.DataTextField = "Nombre";
                    ddlTipoPlato.DataValueField = "Id";
                    ddlTipoPlato.DataBind();
                }

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";

                if (!string.IsNullOrEmpty(id) && !IsPostBack)
                {
                    Plato plato = new Plato();
                    plato = platoNegocio.ObtenerPlatoPorId(int.Parse(id));
                    precargarCamposPlato(plato);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }

        }

        private void precargarCamposPlato(Plato plato)
        {
            lblId.Text = plato.Id.ToString();

            txtNombre.Text = plato.Nombre;
            txtPrecio.Text = plato.Precio.ToString();

            ddlTipoPlato.SelectedIndex = ddlTipoPlato.Items.IndexOf((ddlTipoPlato.Items.FindByValue(plato.Tipo.Id.ToString())));

            btnAgregar.Text = "Modificar";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}