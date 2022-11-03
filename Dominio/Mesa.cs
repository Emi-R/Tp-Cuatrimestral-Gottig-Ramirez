using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mesa
    {
        public int ID { get; set; }
        public Usuario MeseroAsignado { get; set; }
        public int Capacidad { get; set; }
        public bool Ocupado { get; set; }
        public bool Activo { get; set; }

        public Mesa()
        {
            MeseroAsignado = new Usuario();
        }
    }
}
