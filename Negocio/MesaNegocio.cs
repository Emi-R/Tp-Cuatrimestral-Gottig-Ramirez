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

            string consulta = "Select Numero, MeseroAsignado, Capacidad, Ocupado, Activo From Mesas";

            basedatos.SetearConsulta(consulta);
            basedatos.EjecutarLectura();

            try
            {
                while (basedatos.Lector.Read())
                {

                    Mesa mesa = new Mesa();

                    mesa.Numero = (int)basedatos.Lector["Numero"];

                    if (!(basedatos.Lector["MeseroAsignado"] is DBNull))
                        mesa.MeseroAsignado.Legajo = (int)basedatos.Lector["MeseroAsignado"];

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
