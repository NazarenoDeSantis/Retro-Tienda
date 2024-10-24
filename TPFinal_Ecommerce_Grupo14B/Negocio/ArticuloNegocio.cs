using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                
                datos.setearConsulta("select id, nombre, descripcion, precio, stock, categoria_id , Imagenes.url from Articulo inner join imagenes on Articulo.id = imagenes.id_articulo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();

                    aux.Id = (int)datos.Lector["id"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Descripcion = (string)datos.Lector["descripcion"];
                    aux.Precio = (decimal)datos.Lector["precio"];
                    aux.Stock = (int)datos.Lector["stock"];
                    aux.CategoriaId = (int)datos.Lector["categoria_id"];
                    aux.UrlImagen = (string)datos.Lector["url"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }



    }
}
