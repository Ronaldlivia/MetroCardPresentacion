using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace MetroCard.Presentacion.Entidad
{
 
        [DataContract]
        public class TarjetaResponse
        {
            [DataMember]
            public bool EsValido { get; set; }

            [DataMember]
            public string Mensaje { get; set; }

            [DataMember]
            public Tarjeta Tarjeta { get; set; }
        }


        [DataContract]
        public class Tarjeta
        {
            [DataMember]
            public int IdTarjeta { get; set; }

            [DataMember]
            public string CodigoTarjeta { get; set; }

            [DataMember]
            public DateTime FechaVigencia { get; set; }

            [DataMember]
            public bool Estado { get; set; }
        }
}