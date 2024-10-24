using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class Carrito
    {
        public int Id { get; set; }                 // Corresponde al campo 'id'
        public int UsuarioId { get; set; }          // Corresponde al campo 'usuario_id'
        public decimal Total { get; set; }          // Corresponde al campo 'total'
        public DateTime FechaCreacion { get; set; } // Corresponde al campo 'fecha_creacion'
    }
}
