using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using MetroCard.Service.Dominio;
using MetroCard.Service.Persistencia;
using MetroCard.Service.Errores;

namespace MetroCard.Service
{    
    public class Usuarios : IUsuarios
    {
        UsuarioDAO objUsuarioDAO = new UsuarioDAO();

        public Usuario AutenticarUsuario(Usuario Usuario)
        {
            if (Usuario.Correo == string.Empty || Usuario.Clave == string.Empty)
            {
                throw new FaultException<RepetidorException>(
                    new RepetidorException()
                    {
                        Codigo = 101,
                        Descripcion = "Ingrese sus credenciales."
                    }, new FaultReason("Error al autenticar."));
            }

            return objUsuarioDAO.Autenticar(Usuario);
        }
    }
}
