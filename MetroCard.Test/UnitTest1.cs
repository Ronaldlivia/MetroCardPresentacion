using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.ServiceModel;

namespace MetroCard.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestAutenticarUsuarioOk()
        {
            WSUsuarios.UsuariosClient proxy = new WSUsuarios.UsuariosClient();
            WSUsuarios.Usuario objUsuario = proxy.AutenticarUsuario(new WSUsuarios.Usuario()
                {
                    Correo = "gp.paraguay@gmail.com",
                    Clave = "12345+"
                }
            );
        }

        [TestMethod]
        public void TestAutenticarUsuarioError()
        {
            WSUsuarios.UsuariosClient proxy = new WSUsuarios.UsuariosClient();

            try
            {
                WSUsuarios.Usuario objUsuario = proxy.AutenticarUsuario(new WSUsuarios.Usuario()
                    {
                        Correo = "",
                        Clave = ""
                    }
                );           
            }
            catch (FaultException<WSUsuarios.RepetidorException> error)
            {
                Assert.AreEqual("Error", error.Reason);
            }            
        }
    }
}
