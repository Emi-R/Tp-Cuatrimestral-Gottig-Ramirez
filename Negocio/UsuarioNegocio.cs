﻿using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using Dominio;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Negocio
{
    public class UsuarioNegocio
    {
        private AccesoDatos basedatos = new AccesoDatos();

        public List<Usuario> listarUsuarios()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();

            basedatos.SetearProcedimiento("SpListarUsuarios");
            basedatos.EjecutarLectura();

            try
            {
                while (basedatos.Lector.Read())
                {
                    Usuario user = new Usuario();

                    user.Legajo = (int)basedatos.Lector["Legajo"];
                    user.Apellido = (string)basedatos.Lector["Apellidos"];
                    user.Nombre = (string)basedatos.Lector["Nombre"];
                    user.Dni = (string)basedatos.Lector["Dni"];
                    user.Nacionalidad.Nombre = (string)basedatos.Lector["Pais"];
                    user.FechaNacimiento = (string)basedatos.Lector["FechaNac"];
                    user.FechaRegistro = (string)basedatos.Lector["FechaRegistro"];
                    user.Telefono = (string)basedatos.Lector["Telefono"];
                    user.Email = (string)basedatos.Lector["Email"];
                    user.Domicilio.Calle = (string)basedatos.Lector["Calle"];
                    user.Domicilio.Numero = (string)basedatos.Lector["Numero"];
                    user.Perfil.Id = (byte)basedatos.Lector["TipoPerfil"];
                    user.UrlImagen = (string)basedatos.Lector["UrlImagen"];

                    listaUsuarios.Add(user);
                }
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

            return listaUsuarios;
        }

        public void agregarConSp(Usuario nuevo)
        {

            // @Contraseña Varchar(10),
            // @Dni Varchar(15),
            // @Apellido Varchar(40),
            // @Nombre Varchar(40),
            // @Telefono Varchar(20),
            // @Email Varchar(40),
            // @Calle Varchar(40),
            // @Numero Varchar(5),
            // @Piso Varchar(5),
            // @Dpto char(1),
            // @IDNacionalidad int,
            // @TipoPerfil tinyint,
            // @FechaNac date,
            // UrlImagen Varchar(max)

            try
            {
                basedatos.SetearProcedimiento("SpNuevoUsuario");

                basedatos.SetearParametro("@Contraseña", nuevo.Password);
                basedatos.SetearParametro("@Dni", nuevo.Dni);
                basedatos.SetearParametro("@Apellido", nuevo.Apellido);
                basedatos.SetearParametro("@Nombre", nuevo.Nombre);
                basedatos.SetearParametro("@Telefono", nuevo.Telefono);
                basedatos.SetearParametro("@Email", nuevo.Email);
                basedatos.SetearParametro("@Calle", nuevo.Domicilio.Calle);
                basedatos.SetearParametro("@Numero", nuevo.Domicilio.Numero);
                basedatos.SetearParametro("@Piso", nuevo.Domicilio.Piso);
                basedatos.SetearParametro("@Dpto", nuevo.Domicilio.Depto);
                basedatos.SetearParametro("@IDNacionalidad", nuevo.Nacionalidad.ID);
                basedatos.SetearParametro("@TipoPerfil", 2);
                basedatos.SetearParametro("@FechaNac", nuevo.FechaNacimiento);
                basedatos.SetearParametro("@UrlImagen", nuevo.UrlImagen);

                basedatos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
            finally
            {
                basedatos.CerrarConexion();
            }


        }

        public Usuario buscarPorLegajo(int legajo)
        {
            
            Usuario aux = new Usuario();
            

            basedatos.SetearConsulta($"Select * from VW_ListaUsuarios V where V.Legajo = {legajo}");
            basedatos.EjecutarLectura();

            while(basedatos.Lector.Read())
            {

            aux.Legajo = (int)basedatos.Lector["Legajo"];
            aux.Password = (string)basedatos.Lector["Contraseña"];
            aux.Apellido = (string)basedatos.Lector["Apellidos"];
            aux.Nombre = (string)basedatos.Lector["Nombre"];
            aux.Dni = (string)basedatos.Lector["Dni"];
            aux.Nacionalidad.ID = (int)basedatos.Lector["Pais"];
            aux.FechaNacimiento = (string)basedatos.Lector["FechaNac"];
            aux.Telefono = (string)basedatos.Lector["Telefono"];
            aux.Email = (string)basedatos.Lector["Email"];
            aux.Domicilio.Calle = (string)basedatos.Lector["Calle"];
            aux.Domicilio.Numero = (string)basedatos.Lector["Numero"];
            aux.UrlImagen = (string)basedatos.Lector["UrlImagen"];

            }
            return aux;
        }

        public void modificar(Usuario modificado)
        {
            try
            {
                basedatos.SetearProcedimiento("SpModificarUsuario");

                basedatos.SetearParametro("@Legajo", modificado.Legajo);
                basedatos.SetearParametro("@Contraseña", modificado.Password);
                basedatos.SetearParametro("@Dni", modificado.Dni);
                basedatos.SetearParametro("@Apellido", modificado.Apellido);
                basedatos.SetearParametro("@Nombre", modificado.Nombre);
                basedatos.SetearParametro("@Telefono", modificado.Telefono);
                basedatos.SetearParametro("@Email", modificado.Email);
                basedatos.SetearParametro("@Calle", modificado.Domicilio.Calle);
                basedatos.SetearParametro("@Numero", modificado.Domicilio.Numero);
                basedatos.SetearParametro("@Piso", modificado.Domicilio.Piso);
                basedatos.SetearParametro("@Dpto", modificado.Domicilio.Depto);
                basedatos.SetearParametro("@IDNacionalidad", modificado.Nacionalidad.ID);
                basedatos.SetearParametro("@TipoPerfil", 2);
                basedatos.SetearParametro("@UrlImagen", modificado.UrlImagen);

                basedatos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
            finally
            {
                basedatos.CerrarConexion();
            }
        }

        public void eliminar(int legajo)
        {
            try
            {
                basedatos.SetearProcedimiento("SpEliminarUsuario");

                basedatos.SetearParametro("@Legajo", legajo);

                basedatos.EjecutarAccion();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
            }
            finally
            {
                basedatos.CerrarConexion();
            }
        }
    }
}
