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

                    plato.Id = baseDatos.Lector.GetInt32(0);
                    plato.Nombre = baseDatos.Lector.GetString(1);
                    plato.Precio = baseDatos.Lector.GetDecimal(2);
                    plato.Activo = baseDatos.Lector.GetBoolean(3);

                    plato.Tipo = new TipoPlato();
                    plato.Tipo.Nombre = baseDatos.Lector.IsDBNull(baseDatos.Lector.GetOrdinal("TipoPlato")) ? "-": baseDatos.Lector.GetString(5);

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

