﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class InsumoNegocio
    {
        private AccesoDatos baseDatos = new AccesoDatos();

        public List<Insumo> ListarInsumosConSP()
        {
            baseDatos.SetarProcedimiento("SpListarInsumos");
            baseDatos.EjecutarLectura();

            List<Insumo> listaInsumos = new List<Insumo>();

            try
            {
                while (baseDatos.Lector.Read())
                {
                    Insumo insumo = new Insumo();

                    insumo.Id = baseDatos.Lector.GetInt32(0);
                    insumo.Nombre = baseDatos.Lector.GetString(1);
                    insumo.Precio = baseDatos.Lector.GetFloat(2);

                    listaInsumos.Add(insumo);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                baseDatos.CerrarConexion();
            }

            return listaInsumos;
        }
    }
}
