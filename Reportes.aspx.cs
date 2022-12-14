using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TP_Cuatrimestral
{
    public partial class Reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarRepeaterReporteMeseros();
        }

        private void CargarRepeaterReporteMeseros()
        {
            ReporteNegocio negocioReporte = new ReporteNegocio();
            List<ReporteMeseros> listaReporteMeseros = negocioReporte.ObtenerReporteMeseros(DateTime.Now.ToString("yyyy/MM/dd"));

            repeaterReporteMeseros.DataSource = listaReporteMeseros;
            repeaterReporteMeseros.DataBind();

            var total = listaReporteMeseros.Sum(x => x.TotalRecaudado);

            lblTotalRecaudado.Text = $"{lblTotalRecaudado.Text} {total}";

        }
    }
}