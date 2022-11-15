using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int Legajo { get; set; }
        public string Password { get; set; }
        public string Dni { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public Domicilio Domicilio { get; set; }
        public Perfil Perfil { get; set; }
        public string FechaNacimiento { get; set; }
        public string FechaRegistro { get; set; }
        public bool Activo { get; set; }

        public Usuario()
        {
            Domicilio = new Domicilio();
            Perfil = new Perfil();          
        }

        public override string ToString()
        {
            return (Apellido + ", " + Nombre).ToString();
        }
    }
}
