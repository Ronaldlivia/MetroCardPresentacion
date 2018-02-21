using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MetroCard.Presentacion
{
    public partial class ConsultarTarjeta : System.Web.UI.Page
    {
        WSUsuario.UsuarioServiceClient proxy = new WSUsuario.UsuarioServiceClient();
        WSPago.PagoServiceClient proxyp = new WSPago.PagoServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                ListarTarjetas();
           
            }
        }

        protected void ListarTarjetas()
        {
            WSUsuario.Usuario objUsuario = new WSUsuario.Usuario();
            objUsuario.IdUsuario = int.Parse(Session["idusuario"].ToString());

            List<WSUsuario.Tarjeta> lstTarjeta = new List<WSUsuario.Tarjeta>();

            //lstTarjeta = proxy.ListarTarjetaUsuario(objUsuario);

            lstTarjeta = proxy.ListarTarjetaUsuario(objUsuario).ToList();

            gvTarjetas.DataSource = lstTarjeta;
            gvTarjetas.DataBind();
        }


        protected void gvTarjetas_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            switch (e.CommandName)
            {
                case "Ver":
                    int tarjeta = int.Parse(e.CommandArgument.ToString());
                    WSUsuario.Tarjeta objTarjeta = new WSUsuario.Tarjeta();
                    objTarjeta.IdTarjeta = tarjeta;

                    List<WSUsuario.Movimiento> lstMovimiento = new List<WSUsuario.Movimiento>();

                    lstMovimiento = proxy.ListarTarjetaMovimientoUsuario(objTarjeta).ToList();

                    gvmovimiento.DataSource = lstMovimiento;
                    gvmovimiento.DataBind();

                    break;

                case "Recargar":
                    string nro = (e.CommandArgument.ToString());
                    txtnro.Text = nro;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#detailModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);


                    break;
            }
        }

        protected void btnrecargar_Click(object sender, EventArgs e)
        {

            WSPago.Tarjeta objTarjeta = new WSPago.Tarjeta();
            objTarjeta.IdTarjeta = 6;
            objTarjeta.Saldo = decimal.Parse(txtcodigo.Text);
            WSPago.TarjetaResponse objtarjetaResponse = proxyp.RecargarTarjeta(objTarjeta);


            ListarTarjetas();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#detailModal').modal('hide');");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
        }




    }
}