using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class TipoRolNegocio
    {
        public List<TipoRol> listar()
        {
            List<TipoRol> lista = new List<TipoRol>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select idRol, Nombre from Roles");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoRol aux = new TipoRol();
                    aux.Id = (int)datos.Lector["idRol"];
                    aux.Nombre = (string)datos.Lector["Nombre"];

                    lista.Add(aux);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return lista;
        }
    }
}
