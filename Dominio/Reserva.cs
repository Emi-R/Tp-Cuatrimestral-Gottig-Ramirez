using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Reserva
    {
        public int Id { get; set; }
        public Mesa Mesa { get; set; }
        public DateTime FechaReserva { get; set; }
        public Usuario Mesero { get; set; }
    }
}
