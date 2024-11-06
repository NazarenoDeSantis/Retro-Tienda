using System;

namespace Dominio
{
    public class Usuario
    {

        public int Id { get; set; }                      
        public string Nombre { get; set; }               
        public string Correo { get; set; }               
        public string Clave { get; set; }                
        public string Direccion { get; set; }            
        public string Telefono { get; set; }             
        public string Localidad { get; set; }            
        public DateTime FechaNacimiento { get; set; }    
        public bool Estado { get; set; }
        public int IdRol { get; set; }

    }
}
