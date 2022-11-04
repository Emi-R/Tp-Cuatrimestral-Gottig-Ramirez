﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        private SqlConnection Conexion;
        private SqlCommand Comando;
        private SqlDataReader lector;
        public SqlDataReader Lector { get { return lector; } }

        public AccesoDatos()
        {
            Conexion = new SqlConnection("server=.;database=Restaurant;Integrated Security=true");
            Comando = new SqlCommand();
        }

        public void SetearConsulta(string consulta)
        {
            Comando.CommandType = System.Data.CommandType.Text;
            Comando.CommandText = consulta;
        }

        public void EjecutarLectura()
        {
            Comando.Connection = Conexion;

            try
            {
                Conexion.Open();
                lector = Comando.ExecuteReader();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.ToString());
                throw;
            }
            
        }

        public void CerrarConexion()
        {
            if(lector !=null)
            {
                Conexion.Close();
            }
        }
    }
}