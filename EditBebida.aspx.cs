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
    public partial class EditBebida : System.Web.UI.Page
    {
        private MarcaNegocio marcaNegocio;
        private BebidaNegocio bebidaNegocio;
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            marcaNegocio = new MarcaNegocio();
            bebidaNegocio = new BebidaNegocio();

            try
            {
                if (!IsPostBack)
                {

                    List<Marca> marcas = marcaNegocio.ListarMarcas();
                    ddlMarcas.DataSource = marcas;
                    ddlMarcas.DataTextField = "Nombre";
                    ddlMarcas.DataValueField = "Id";
                    ddlMarcas.DataBind();
                }

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"] : "";

                if (!string.IsNullOrEmpty(id) && !IsPostBack)
                {
                    Bebida bebida = new Bebida();
                    bebida = bebidaNegocio.ListarBebidas(id)[0];
                    precargarCamposBebida(bebida);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }

        }

        private void precargarCamposBebida(Bebida bebida)
        {
            lblId.Text = bebida.Id.ToString();

            txtNombre.Text = bebida.Nombre;
            txtPrecio.Text = bebida.Precio.ToString();
            txtCapacidad.Text = bebida.Capacidad.ToString();

            ddlMarcas.SelectedIndex = ddlMarcas.Items.IndexOf((ddlMarcas.Items.FindByValue(bebida.Marca.Id.ToString())));

            btnAgregar.Text = "Modificar";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}