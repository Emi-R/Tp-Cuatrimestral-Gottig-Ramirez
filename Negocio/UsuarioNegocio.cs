using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Dominio;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Negocio
{
    public class UsuarioNegocio
    {
        private AccesoDatos basedatos = new AccesoDatos();

        public List<Usuario> listarUsuarios()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();

            basedatos.SetearProcedimiento("SpListarUsuarios");
            basedatos.EjecutarLectura();

            try
            {
                while (basedatos.Lector.Read())
                {
                    Usuario user = new Usuario();

                    user.Legajo = (int)basedatos.Lector["Legajo"];
                    user.Apellido = (string)basedatos.Lector["Apellidos"];
                    user.Nombre = (string)basedatos.Lector["Nombre"];
                    user.Dni = (string)basedatos.Lector["Dni"];
                    user.Nacionalidad.Nombre = (string)basedatos.Lector["Pais"];
                    user.FechaNacimiento = (string)basedatos.Lector["FechaNac"];
                    user.FechaRegistro = (string)basedatos.Lector["FechaRegistro"];
                    user.Telefono = (string)basedatos.Lector["Telefono"];
                    user.Email = (string)basedatos.Lector["Email"];
                    user.Domicilio.Calle = (string)basedatos.Lector["Calle"];
                    user.Domicilio.Numero = (string)basedatos.Lector["Numero"];
                    user.Perfil.Id = (byte)basedatos.Lector["TipoPerfil"];
                    user.UrlImagen = (string)basedatos.Lector["UrlImagen"];

                    listaUsuarios.Add(user);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
                throw;
            }
            finally
            {
                basedatos.CerrarConexion();
            }

            return listaUsuarios;
        }

        public void agregarConSp(Usuario nuevo)
        {

            // @Contraseña Varchar(10),
            // @Dni Varchar(15),
            // @Apellido Varchar(40),
            // @Nombre Varchar(40),
            // @Telefono Varchar(20),
            // @Email Varchar(40),
            // @Calle Varchar(40),
            // @Numero Varchar(5),
            // @Piso Varchar(5),
            // @Dpto char(1),
            // @IDNacionalidad int,
            // @TipoPerfil tinyint,
            // @FechaNac date,
            // UrlImagen Varchar(max)

            try
            {
                basedatos.SetearProcedimiento("SpNuevoUsuario");

                basedatos.SetearParametro("@Contraseña", nuevo.Password);
                basedatos.SetearParametro("@Dni", nuevo.Dni);
                basedatos.SetearParametro("@Apellido", nuevo.Apellido);
                basedatos.SetearParametro("@Nombre", nuevo.Nombre);
                basedatos.SetearParametro("@Telefono", nuevo.Telefono);
                basedatos.SetearParametro("@Email", nuevo.Email);
                basedatos.SetearParametro("@Calle", nuevo.Domicilio.Calle);
                basedatos.SetearParametro("@Numero", nuevo.Domicilio.Numero);
                basedatos.SetearParametro("@Piso", nuevo.Domicilio.Piso);
                basedatos.SetearParametro("@Dpto", nuevo.Domicilio.Depto);
                basedatos.SetearParametro("@IDNacionalidad", nuevo.Nacionalidad.ID);
                basedatos.SetearParametro("@TipoPerfil", 2);
                basedatos.SetearParametro("@FechaNac", nuevo.FechaNacimiento);
                basedatos.SetearParametro("@UrlImagen", nuevo.UrlImagen);

                basedatos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
            finally
            {
                basedatos.CerrarConexion();
            }


        }
    }
}
