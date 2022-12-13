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

            if (Request.QueryString["id"] != null)
            {
                MesaNegocio mesaNegocio = new MesaNegocio();
                Mesa mesa = mesaNegocio.ObtenerMesaPorNumero(Request.QueryString["id"].ToString());

                txtNumeroMesa.Text = mesa.Numero.ToString();
                txtCapacidad.Text = mesa.Capacidad.ToString();

                ddlMeseros.SelectedIndex = mesa.MeseroAsignado.Legajo - 1;

                if (mesa.Reservado == true)
                    chkReservada.Checked = true;

                if (mesa.Ocupado == true)
                    chkOcupada.Checked = true;

                txtNumeroMesa.Enabled = false;

            }

        }

        protected void btnEditarMesa_Click(object sender, EventArgs e)
        {
            MesaNegocio negocio = new MesaNegocio();
            Mesa nuevaMesa = new Mesa();

            nuevaMesa.Numero = int.Parse(txtNumeroMesa.Text);
            nuevaMesa.Capacidad = int.Parse(txtCapacidad.Text);

            if(chkOcupada.Checked)
            {
                nuevaMesa.Ocupado = true;
            }
            else
            {
                nuevaMesa.Ocupado = false;
            }

            if(chkReservada.Checked)
            {
                nuevaMesa.Reservado = true;
            }
            else
            {
                nuevaMesa.Reservado = false;
            }

            nuevaMesa.MeseroAsignado.Legajo = ddlMeseros.SelectedIndex - 1;

            negocio.agregarMesa(nuevaMesa);

            Response.Redirect("Mesas.aspx", false);

        }
    }
}