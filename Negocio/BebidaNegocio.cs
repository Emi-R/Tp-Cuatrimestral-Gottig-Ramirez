using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class BebidaNegocio
    {
        private AccesoDatos baseDatos = new AccesoDatos();

        public List<Bebida> ListarBebidas()
        {
            string consulta = @"SELECT i.Id, i.Nombre as Nombre, i.Precio,
                               i.Capacidad, m.Nombre as Marca, i.Alcoholica
                               FROM Insumos I
                               inner join TipoInsumo ti
                               on i.IdTipoInsumo = ti.Id
                               left join Marcas m
                               on i.IdMarca = m.Id
                               where i.Activo = 1
                               and ti.Id = 1";

            baseDatos.SetearConsulta(consulta);
            baseDatos.EjecutarLectura();

            List<Bebida> listaBebidas = new List<Bebida>();

            try
            {
                while (baseDatos.Lector.Read())
                {
                    Bebida bebida = new Bebida();

                    bebida.Id = baseDatos.Lector.GetInt32(0);
                    bebida.Nombre = baseDatos.Lector.GetString(1);
                    bebida.Precio = baseDatos.Lector.GetDecimal(2);
                    bebida.Capacidad = (float)baseDatos.Lector.GetDouble(3);
                    bebida.Marca = baseDatos.Lector.GetString(4);
                    bebida.Alcoholica = baseDatos.Lector.GetBoolean(5);

                    listaBebidas.Add(bebida);
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

            return listaBebidas;
        }
    }
}
