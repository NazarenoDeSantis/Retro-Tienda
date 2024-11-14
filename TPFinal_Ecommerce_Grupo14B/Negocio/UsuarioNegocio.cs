using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        //Metodo para listar los usuarios para la tabla 
        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select idUsuario, nombre, correo, clave, direccion, telefono, localidad, fecha_nacimiento, estado, IdRol from Usuarios");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Usuario aux = new Usuario();

                    aux.Id = (int)datos.Lector["idUsuario"];
                    aux.Nombre = (string)datos.Lector["nombre"];
                    aux.Correo = (string)datos.Lector["correo"];
                    aux.Clave = (string)datos.Lector["clave"];
                    aux.Direccion = (string)datos.Lector["direccion"];
                    aux.Telefono = (string)datos.Lector["telefono"];
                    aux.Localidad = (string)datos.Lector["localidad"];
                    aux.FechaNacimiento = (DateTime)datos.Lector["fecha_nacimiento"];
                    aux.Estado = (bool)datos.Lector["estado"];
                    aux.IdRol = (int)datos.Lector["IdRol"];

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

        public bool loguear (Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("select idUsuario, idRol from Usuarios where correo = @correo AND clave = @clave");
                datos.setearParametro("@correo", usuario.Correo);
                datos.setearParametro("@clave", usuario.Clave);
                datos.ejecutarLectura();

               if(datos.Lector.Read())
                {
                    usuario.Id =(int) datos.Lector["idUsuario"];
                    usuario.IdRol = (int)datos.Lector["idRol"];
                    return true;
                }
                return false;
            }
            catch (Exception ex )
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
