using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Pedido
    {
        public int Id { get; set; }                
        public int UsuarioId { get; set; }         
        public int CarritoId { get; set; }         
        public decimal Total { get; set; }         
        public DateTime FechaPedido { get; set; }  
        public string Estado { get; set; }         
        public string DireccionEnvio { get; set; } 
    }
}
