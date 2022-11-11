using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class InsumoNegocio
    {
        private AccesoDatos basedatos = new AccesoDatos();

        public List<Insumo> ListarInsumos()
        {
            List<Insumo> listarInsumos = new List<Insumo>();

            return listarInsumos;
        }
    }
}
