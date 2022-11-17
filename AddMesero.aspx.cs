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

                imgPerfil.ImageUrl = "https://static.vecteezy.com/system/resources/previews/000/439/863/non_2x/vector-users-icon.jpg";
                imgPerfil.Height = 150;

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
            
            nuevoUser.Nacionalidad.ID = ddlPaises.SelectedIndex + 1;

            if(!String.IsNullOrEmpty(txtUrlImagen.Text))
                nuevoUser.UrlImagen = txtUrlImagen.Text;

            negocio.agregarConSp(nuevoUser);
            Response.Redirect("meseros.aspx");

        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgPerfil.ImageUrl = txtUrlImagen.Text;
            imgPerfil.Height = 150;
        }
    }
}