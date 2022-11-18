using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MarcaNegocio
    {
        private AccesoDatos baseDatos = new AccesoDatos();
        public List<Marca> ListarMarcas()
        {
            string consulta = "SELECT ID, NOMBRE FROM MARCAS";

            baseDatos.SetearConsulta(consulta);
            baseDatos.EjecutarLectura();

            List<Marca> listaMarcas = new List<Marca>();

            try
            {
                while (baseDatos.Lector.Read())
                {
                    Marca marca = new Marca();

                    marca.Id = baseDatos.Lector.GetInt32(0);
                    marca.Nombre = baseDatos.Lector.GetString(1);

                    listaMarcas.Add(marca);
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

            return listaMarcas;
        }

        public void AgregarMarca(Marca marca)
        {
            try
            {
                string consulta = $"INSERT INTO MARCAS(NOMBRE) VALUES ('{marca.Nombre}')";

                baseDatos.SetearConsulta(consulta);
                baseDatos.EjecutarLectura();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                baseDatos.CerrarConexion();
            }
        }
    }
}
