﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class PedidoNegocio
    {
        private AccesoDatos _db; 

        public PedidoNegocio()
        {
            _db = new AccesoDatos();
        }
        public List<Pedido> ListarPedidos(string numeroMesa = "", string IdPedido = "")
        {          
            string consulta = @"
                               SELECT P.Id AS [Id Pedido], P.Fecha as [Fecha Pedido], 
                               P.Entregado, P.Total,
                               M.ID AS [Id Mesa], M.Numero AS [Numero Mesa], M.Capacidad,
                               U.Nombre AS [Mesero Nombre], U.Apellidos AS [Mesero Apellido]
                                FROM PEDIDOS P
                               inner join Mesas M
                               ON P.IdMesa = M.ID
                               INNER JOIN Usuarios U
                               ON P.LegajoMeseroAsignado = U.Legajo
                               WHERE U.TipoPerfil = 2
                               ";

            if (!String.IsNullOrEmpty(numeroMesa))
                consulta += $" AND M.Numero = {numeroMesa}";
            else if (!String.IsNullOrEmpty(IdPedido))
                consulta += $" AND P.Id = {IdPedido}";

            _db.SetearConsulta(consulta);
            _db.EjecutarLectura();

            List<Pedido> listaPedidos = new List<Pedido>();

            try
            {
                while (_db.Lector.Read())
                {
                    Pedido pedido = new Pedido();

                    pedido.ID = _db.Lector.GetInt32(0);
                    pedido.FechaPedido = _db.Lector.GetDateTime(1);
                    pedido.Entregado = _db.Lector.GetBoolean(2);
                    pedido.Total = _db.Lector.GetDecimal(3);

                    pedido.Mesa = new Mesa();
                    pedido.Mesa.ID = _db.Lector.GetInt32(4);
                    pedido.Mesa.Numero = _db.Lector.GetInt32(5);
                    pedido.Mesa.Capacidad = _db.Lector.GetInt32(6);

                    pedido.MeseroAsignado = new Usuario();
                    pedido.MeseroAsignado.Nombre = _db.Lector.GetString(7);
                    pedido.MeseroAsignado.Apellido = _db.Lector.GetString(8);

                    listaPedidos.Add(pedido);
                }

                return listaPedidos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _db.CerrarConexion();
            }
        }

        public int AgregarPedido(Pedido pedido)
        {
            try
            {
                _db.SetearProcedimiento("SpAgregarPedido");
                _db.SetearParametro("@IdMesa", pedido.Mesa.ID);
                _db.SetearParametro("@LegajoMeseroAsignado", pedido.MeseroAsignado.Legajo);
                int id = _db.EjecutarAccionEscalar();

                return id;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _db.CerrarConexion();
            }
        }
    }
}