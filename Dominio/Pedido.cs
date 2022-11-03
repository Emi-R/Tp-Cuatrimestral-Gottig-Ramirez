using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int ID { get; set; }
        public Mesa Mesa { get; set; }
        public List<DetallePlato> ListaPlatos { get; set; }
        public List<DetalleBebida> ListaBebidas { get; set; }
        public bool Entregado { get; set; }

        public Pedido()
        {
            ListaPlatos = new List<DetallePlato>();
            ListaBebidas = new List<DetalleBebida>();
        }

    }
}
