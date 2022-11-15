using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Dominio;

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
                    user.FechaNacimiento = (DateTime)basedatos.Lector["FechaNac"];
                    user.FechaRegistro = (DateTime)basedatos.Lector["FechaRegistro"];
                    user.Telefono = (string)basedatos.Lector["Telefono"];
                    user.Email = (string)basedatos.Lector["Email"];
                    user.Domicilio.Calle = (string)basedatos.Lector["Calle"];
                    user.Domicilio.Numero = (string)basedatos.Lector["Numero"];
                    user.Perfil.Id = (byte)basedatos.Lector["TipoPerfil"];

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
    }
}
