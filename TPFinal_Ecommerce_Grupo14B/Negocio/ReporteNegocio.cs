using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Negocio
{
    public class ReporteNegocio
    {
        //CantidadArticulos traeme cuantos articulos hay en la base de datos"
        public int CantidadArticulos()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select count(*) as cantidad from Articulos where estado = 1");
                datos.ejecutarLectura();
                datos.Lector.Read();
                return (int)datos.Lector["cantidad"];
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
        //Cantidadde clientes traeme cuantos clientes con el idRol = 3 hay en la base de datos"
        public int CantidadClientes()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select count(*) as cantidad from Usuarios where IdRol = 3 and estado= 1");
                datos.ejecutarLectura();
                datos.Lector.Read();
                return (int)datos.Lector["cantidad"];
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
        // hay que traer la cantidad de stock * el precio de cada articulo con estado en 1 devolver un float
        public decimal ValorActivosEmpresa()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select sum(stock * precio) as valor from Articulos where estado = 1");
                datos.ejecutarLectura();
                datos.Lector.Read();
                return (decimal)datos.Lector["valor"];
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
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {

                datos.setearConsulta("select a.idArticulo, a.nombre, a.stock  from Articulos a where stock < 10");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();

                    aux.Id = (int)datos.Lector["idArticulo"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Stock = (int)datos.Lector["stock"];


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
