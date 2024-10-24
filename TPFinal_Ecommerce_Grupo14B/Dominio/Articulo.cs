namespace Dominio
{
    internal class Articulo
    {
        public int Id { get; set; }                 // Corresponde al campo 'id'
        public string Nombre { get; set; }          // Corresponde al campo 'nombre'
        public string Descripcion { get; set; }     // Corresponde al campo 'descripcion'
        public decimal Precio { get; set; }         // Corresponde al campo 'precio'
        public int Stock { get; set; }              // Corresponde al campo 'stock'
        public int? CategoriaId { get; set; }       // Corresponde al campo 'categoria_id'
        public string ImagenUrl { get; set; }       // Corresponde al campo 'imagen' (si está en la tabla Articulo o relacionada)


    }
}
