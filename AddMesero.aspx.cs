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
            try
            {
                cargarPaises();

                if (!IsPostBack)
                {
                    if (Request.QueryString["Legajo"] != null)
                    {
                        cargarTxtBox();

                    }
                    else
                    {
                        imgPerfil.ImageUrl = "https://static.vecteezy.com/system/resources/previews/000/439/863/non_2x/vector-users-icon.jpg";
                        imgPerfil.Height = 150;
                    }

                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
                throw;
            }
        }

        public void cargarPaises()
        {

            PaisesNegocio negocio = new PaisesNegocio();

            ddlPaises.DataSource = negocio.listarPaises();
            ddlPaises.DataValueField = "ID";
            ddlPaises.DataValueField = "Nombre";
            ddlPaises.DataBind();

        }

        protected void btnAgregarMesero_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario nuevoUser = new Usuario();

            nuevoUser.Apellido = txtApellido.Text;
            nuevoUser.Nombre = txtNombre.Text;
            nuevoUser.Password = txtPassword.Text;
            nuevoUser.Dni = txtDni.Text;
            nuevoUser.FechaNacimiento = txtFechaNac.Text;
            nuevoUser.Telefono = txtTelefono.Text;
            nuevoUser.Email = txtEmail.Text;

            nuevoUser.Domicilio.Calle = txtCalle.Text;
            nuevoUser.Domicilio.Numero = txtNumero.Text;

            if (!String.IsNullOrEmpty(txtPiso.Text)) { nuevoUser.Domicilio.Piso = int.Parse(txtPiso.Text); } else { nuevoUser.Domicilio.Piso = 1; }

            if (!String.IsNullOrEmpty(txtDpto.Text)) { nuevoUser.Domicilio.Depto = txtDpto.Text; } else { nuevoUser.Domicilio.Depto = "a"; }

            nuevoUser.Nacionalidad.ID = ddlPaises.SelectedIndex + 1;

            if (!String.IsNullOrEmpty(txtUrlImagen.Text)) nuevoUser.UrlImagen = txtUrlImagen.Text;

            if (Request.QueryString["Legajo"] != null)
            {
                nuevoUser.Legajo = int.Parse(Request.QueryString["Legajo"]);
                negocio.modificar(nuevoUser);
            }
            else
            {
                negocio.agregarConSp(nuevoUser);
            }

            Response.Redirect("meseros.aspx", false);

        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgPerfil.ImageUrl = txtUrlImagen.Text;
            imgPerfil.Height = 150;
        }

        public void cargarTxtBox()
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            Usuario aux = negocio.buscarPorLegajo(int.Parse(Request.QueryString["Legajo"]));

            txtApellido.Text = aux.Apellido;
            txtNombre.Text = aux.Nombre;
            txtPassword.Text = aux.Password;
            txtDni.Text = aux.Dni;
            txtFechaNac.Text = aux.FechaNacimiento.ToString();
            txtTelefono.Text = aux.Telefono;
            txtEmail.Text = aux.Email;
            txtCalle.Text = aux.Domicilio.Calle;
            txtNumero.Text = aux.Domicilio.Numero;
            ddlPaises.SelectedIndex = aux.Nacionalidad.ID - 1;
            txtPiso.Text = aux.Domicilio.Piso.ToString();
            txtDpto.Text = aux.Domicilio.Depto;
            txtUrlImagen.Text = aux.UrlImagen;
            imgPerfil.ImageUrl = aux.UrlImagen;

            titulo.Text = "Legajo #" + aux.Legajo;
            imgPerfil.Height = 150;
        }
    }
}
