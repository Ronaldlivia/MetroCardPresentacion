using MetroCard.Service.Dominio;
using MetroCard.Service.Errores;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace MetroCard.Service
{    
    [ServiceContract]
    public interface IUsuarios
    { 
        [FaultContract (typeof(RepetidorException))]
        [OperationContract]
        Usuario AutenticarUsuario(Usuario Usuario);
    }
}
