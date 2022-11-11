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
        public List<DetalleInsumo> ListDetalleInsumo { get; set; }
        public bool Entregado { get; set; }

        public Pedido()
        {
            ListDetalleInsumo = new List<DetalleInsumo>();
        }
    }
}
