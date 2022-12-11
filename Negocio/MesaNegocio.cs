﻿using System;
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

        public List<Mesa> ListarMesas(bool gerente = false)
        {
            List<Mesa> listaMesas = new List<Mesa>();

            if (gerente)
                basedatos.SetearProcedimiento("SpListarMesas");
            else
                basedatos.SetearProcedimiento("SpListarMesasActivas");

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

                    mesa.Reservado = (bool)basedatos.Lector["Reservado"];

                    mesa.Ocupado = (bool)basedatos.Lector["Ocupado"];

                    mesa.Activo = (bool)basedatos.Lector["Activo"];

                    mesa.ID = (int)basedatos.Lector["ID"];

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

        public void agregarMesa(Mesa nueva)
        {
            AccesoDatos db = new AccesoDatos();

            try
            {
                db.SetearProcedimiento("SpAgregarMesa");
                db.SetearParametro("@NumMesa", nueva.Numero);
                db.SetearParametro("@LegajoMeseroAsignado", nueva.MeseroAsignado.Legajo);
                db.SetearParametro("@Capacidad", nueva.Capacidad);
                db.SetearParametro("@Ocupado", nueva.Ocupado);
                db.SetearParametro("@Reservado", nueva.Reservado);

                db.EjecutarAccion();

            }
            catch (Exception ex)
            {
                 
                throw ex;
            }
            finally
            {
                db.CerrarConexion();
            }
        }

        public Mesa ObtenerMesaPorNumero(string numeroMesa)
        {
            try
            {
                basedatos.SetearProcedimiento("SpObtenerMesaPorNumero");
                basedatos.SetearParametro("@NumeroMesa", Convert.ToInt32(numeroMesa));

                basedatos.EjecutarLectura();

                Mesa mesa = new Mesa();
                while (basedatos.Lector.Read())
                {
                    mesa.Numero = (int)basedatos.Lector["Numero"];

                    mesa.MeseroAsignado.Legajo = (int)basedatos.Lector["Legajo"];

                    mesa.MeseroAsignado.Apellido = (string)basedatos.Lector["Apellidos"];
                    mesa.MeseroAsignado.Nombre = (string)basedatos.Lector["Nombre"];

                    mesa.Capacidad = (int)basedatos.Lector["Capacidad"];

                    mesa.Reservado = (bool)basedatos.Lector["Reservado"];

                    mesa.Ocupado = (bool)basedatos.Lector["Ocupado"];

                    mesa.Activo = (bool)basedatos.Lector["Activo"];

                    mesa.ID = (int)basedatos.Lector["ID"];
                }

                return mesa;

            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                basedatos.CerrarConexion();
            }
        }
    }
}
