using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int Id { get; set; }
        public int UsuarioId { get; set; }
        public int CarritoId { get; set; }
        public decimal Total { get; set; }
        public DateTime FechaPedido { get; set; }
        public int Estado { get; set; }
        public string NameStatus { get; set; }
        public string DireccionEnvio { get; set; }

        public Pedido()
        {
            Id = 0;
            UsuarioId = 0;
            CarritoId = 0;
            Total = 0;
            FechaPedido = DateTime.Now;
            Estado = 0;
            NameStatus = "";
            DireccionEnvio = "";
        }

        //ahora hacer un constructor con parametros
        public Pedido(int id, int usuarioId, int carritoId, decimal total, DateTime fechaPedido, int estado, string namestatus, string direccionEnvio)
        {
            Id = id;
            UsuarioId = usuarioId;
            CarritoId = carritoId;
            Total = total;
            FechaPedido = fechaPedido;
            Estado = estado;
            NameStatus = namestatus;
            DireccionEnvio = direccionEnvio;
        }
    }
}
