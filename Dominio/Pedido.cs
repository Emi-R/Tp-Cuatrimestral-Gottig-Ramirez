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
        public List<DetallePedido> ListDetallePedido { get; set; }
        public bool Entregado { get; set; }
        public float Total { get; set; }

        public Pedido()
        {
            ListDetallePedido = new List<DetallePedido>();
        }
    }
}
