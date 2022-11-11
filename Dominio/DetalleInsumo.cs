using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleInsumo
    {
        public int ID { get; set; }
        public int Cantidad { get; set; }
        public float PrecioTotal { get; set; }
        public bool Activo { get; set; }
        public Insumo Insumo { get; set; }

    }
}
