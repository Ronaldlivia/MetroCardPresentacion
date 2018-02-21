using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MetroCard.Presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        WSSeguridad.SeguridadServiceClient proxy = new WSSeguridad.SeguridadServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {

            WSSeguridad.Usuario objUsuario = new WSSeguridad.Usuario();
            objUsuario.Correo = txtcorreo.Text;
            objUsuario.Clave = txtclave.Text;

            WSSeguridad.UsuarioResponse objUsuarioResponse = proxy.AutenticarUsuario(objUsuario);

           

            if (objUsuarioResponse.EsValido)
            {
                Session["idusuario"] = objUsuarioResponse.Usuario.IdUsuario;
                Session["estado"] = objUsuarioResponse.Usuario.Estado;
                Response.Redirect("ConsultarTarjeta.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), UniqueID,"alert('Usuario no registrado')", true);
            }
        }
    }
}