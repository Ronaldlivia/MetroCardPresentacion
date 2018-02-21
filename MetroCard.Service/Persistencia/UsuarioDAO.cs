using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MetroCard.Service.Dominio;
using MetroCard.Service.Utilitario;
using System.Data.SqlClient;
using System.Data;

namespace MetroCard.Service.Persistencia
{
    public class UsuarioDAO
    {
        public Usuario Autenticar(Usuario Usuario)
        {
            Usuario objUsuario = null;

            using (SqlConnection sqlCn = new SqlConnection(Conexion.cnMetroCard))
            {
                sqlCn.Open();

                using (SqlCommand sqlCmd = new SqlCommand("Usuario_Autenticar", sqlCn))
                {                    
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Correo", SqlDbType.VarChar, 50).Value = Usuario.Correo;
                    sqlCmd.Parameters.Add("@Clave", SqlDbType.VarChar, 50).Value = Usuario.Clave;

                    SqlDataReader sqlDr = sqlCmd.ExecuteReader(CommandBehavior.SingleResult);

                    if (sqlDr.HasRows)
                    {
                        objUsuario = new Usuario();

                        if (sqlDr.Read())
                        {
                            objUsuario.IdUsuario = sqlDr.GetInt32(sqlDr.GetOrdinal("IdUsuario"));
                            objUsuario.Nombres = sqlDr.GetString(sqlDr.GetOrdinal("Nombres"));
                            objUsuario.ApellidoPaterno = sqlDr.GetString(sqlDr.GetOrdinal("ApellidoPaterno"));
                            objUsuario.ApellidoMaterno = sqlDr.GetString(sqlDr.GetOrdinal("ApellidoMaterno"));
                            objUsuario.IdTipoDocumento = sqlDr.GetInt32(sqlDr.GetOrdinal("IdTipoDocumento"));
                            objUsuario.NroDocumento = sqlDr.GetString(sqlDr.GetOrdinal("NroDocumento"));
                            objUsuario.Correo = sqlDr.GetString(sqlDr.GetOrdinal("Correo"));                          
                        }
                    }
                }
            }

            return objUsuario;     
        }

        public Usuario Crear(Usuario Usuario)
        {
            return null;
        }
    }
}