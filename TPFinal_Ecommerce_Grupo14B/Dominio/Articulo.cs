namespace Dominio
{
    public class Articulo
    {
        public int Id { get; set; }                
        public string Nombre { get; set; }         
        public string Descripcion { get; set; }    
        public decimal Precio { get; set; }        
        public int Stock { get; set; }             
        public int CategoriaId { get; set; }
        public string UrlImagen { get; set; }
        public bool Estado { get; set; }

    }
}
