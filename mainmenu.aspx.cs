﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TP_Cuatrimestral
{
    public partial class mainmenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MesaNegocio negocio = new MesaNegocio();

            if (!IsPostBack)
            {
                RepeaterMesas.DataSource = negocio.ListarMesas();
                RepeaterMesas.DataBind();
            }
        }
    }
}