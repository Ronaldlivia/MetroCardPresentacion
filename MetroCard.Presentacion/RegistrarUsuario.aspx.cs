using MetroCard.Presentacion.Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronSharp.Core;
using IronSharp.IronMQ;

namespace MetroCard.Presentacion
{
    public partial class _Default : Page
    {
        WSUsuario.UsuarioServiceClient proxy = new WSUsuario.UsuarioServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            WSUsuario.Usuario objUsuario = new WSUsuario.Usuario();
            objUsuario.Nombres = txtnombres.Text;
            objUsuario.ApellidoPaterno = txtpaterno.Text;
            objUsuario.ApellidoMaterno = txtmaterno.Text;
            objUsuario.IdTipoDocumento = int.Parse(ddltipodoc.SelectedValue.ToString());
            objUsuario.NroDocumento = txtnrodoc.Text;
            objUsuario.FechaNacimiento = DateTime.Parse(txtfechanac.Text);
            objUsuario.NroTelefono = txttelefono.Text;
            objUsuario.Correo = txtcorreo.Text;
            objUsuario.Clave = txtclave.Text;

            if (!ValidarTarjeta(txttarjeta.Text))
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), UniqueID, "alert('Codigo de Tarjeta ingresada no es valida')", true);
            }
            else
            {
                WSUsuario.UsuarioResponse objUsuarioResponse = proxy.RegistrarUsuario(objUsuario);
                if (objUsuarioResponse.EsValido)
                {
                    WSUsuario.Tarjeta objTarjeta = new WSUsuario.Tarjeta();
                    objTarjeta.IdUsuario = (objUsuarioResponse.Usuario.IdUsuario);
                    objTarjeta.NroTarjeta = txttarjeta.Text;




                    WSUsuario.UsuarioResponse objUsuarioTarjeta = proxy.RegistrarTarjetaUsuario(objTarjeta);
                    Session["idusuario"] = objUsuarioResponse.Usuario.IdUsuario;

                    var iromMq = IronSharp.IronMQ.Client.New(new IronClientConfig { ProjectId = "5a7bb9b0c85cba0009ca8dd2", Token = "zXvLUZqzULL4SSp5G3qa", Host = "mq-aws-eu-west-1-1.iron.io", Scheme = "http", Port = 80 });

                    QueueClient queue = iromMq.Queue("Tarjeta");

                    queue.Post(new[] { txttarjeta.Text });

                    Response.Redirect("ConsultarTarjeta.aspx");
                }
            }
        }
        //else
        //{
        //    Response.Redirect("RegistrarUsuario.aspx");
        //}


        bool ValidarTarjeta(string codigo)
        {

            string url = string.Format("{0}/{1}", "  http://localhost:20738/MetropolitanoService.svc/ConsultarTarjeta/", codigo);

            var synclient = new WebClient();
            var content = synclient.DownloadString(url);
            var json_serializer = new JavaScriptSerializer();

            json_serializer.MaxJsonLength = Int32.MaxValue;

            TarjetaResponse lstVisorAplicacionCustom = json_serializer.Deserialize<TarjetaResponse>(content);

            return lstVisorAplicacionCustom.EsValido;

        }


    }
}