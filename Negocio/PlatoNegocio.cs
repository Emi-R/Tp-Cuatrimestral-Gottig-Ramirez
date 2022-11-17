using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class PlatoNegocio
    {
        private AccesoDatos baseDatos = new AccesoDatos();
        public List<Plato> ListarPlatos()
        {

            baseDatos.SetearProcedimiento("SpListarPlatos");
            baseDatos.EjecutarLectura();

            List<Plato> listaPlatos = new List<Plato>();

            try
            {
                while (baseDatos.Lector.Read())
                {
                    //terminar
                    Plato plato = new Plato();

                    plato.Nombre = baseDatos.Lector.GetString(1);

                    listaPlatos.Add(plato);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                baseDatos.CerrarConexion();
            }

            return listaPlatos;
        }
    }
}

