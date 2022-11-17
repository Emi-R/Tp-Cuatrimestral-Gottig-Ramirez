using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TipoPlatoNegocio
    {
        private AccesoDatos baseDatos = new AccesoDatos();
        public List<TipoPlato> ListarTiposPlatos()
        {

            baseDatos.SetearProcedimiento("SpListarTipoPlato");
            baseDatos.EjecutarLectura();

            List<TipoPlato> listaTipoPlato = new List<TipoPlato>();

            try
            {
                while (baseDatos.Lector.Read())
                {
                    TipoPlato tipo = new TipoPlato();

                    tipo.Nombre = baseDatos.Lector.GetString(1);

                    listaTipoPlato.Add(tipo);
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

            return listaTipoPlato;
        }
    }
}
