using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Dominio;


namespace Negocio
{
    public class MesaNegocio
    {
        private AccesoDatos basedatos = new AccesoDatos();

        public List<Mesa> ListarMesas()
        {
            List<Mesa> listaMesas = new List<Mesa>();

            string consulta = "Select M.Numero, U.Legajo, U.Apellidos, U.Nombre, M.Capacidad, M.Ocupado, M.Activo From Mesas M Inner Join Usuarios U On M.MeseroAsignado = U.Legajo";

            basedatos.SetearConsulta(consulta);
            basedatos.EjecutarLectura();

            try
            {
                while (basedatos.Lector.Read())
                {

                    Mesa mesa = new Mesa();

                    mesa.Numero = (int)basedatos.Lector["Numero"];


                    mesa.MeseroAsignado.Legajo = (int)basedatos.Lector["Legajo"];

                    mesa.MeseroAsignado.Apellido = (string)basedatos.Lector["Apellidos"];
                    mesa.MeseroAsignado.Nombre = (string)basedatos.Lector["Nombre"];

                    mesa.Capacidad = (int)basedatos.Lector["Capacidad"];

                    mesa.Ocupado = (bool)basedatos.Lector["Ocupado"];

                    mesa.Activo = (bool)basedatos.Lector["Activo"];

                    listaMesas.Add(mesa);
                }

                return listaMesas;
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


        }
    }
}
