

using System.ComponentModel.DataAnnotations;

namespace TPFinal_Ecommerce_Grupo14B
{
    public class PagoViewModel
    {
        [Required(ErrorMessage = "El método de pago es obligatorio.")]
        public string MetodoPago { get; set; }

        [Required(ErrorMessage = "El número de tarjeta es obligatorio.")]
        [StringLength(16, ErrorMessage = "El número de tarjeta debe tener 16 dígitos.", MinimumLength = 16)]
        public string NumeroTarjeta { get; set; }

        [Required(ErrorMessage = "El nombre en la tarjeta es obligatorio.")]
        public string NombreTarjeta { get; set; }

        [Required(ErrorMessage = "El CVV es obligatorio.")]
        [StringLength(3, ErrorMessage = "El código CVV debe tener 3 dígitos.", MinimumLength = 3)]
        public string CVV { get; set; }

        [Required(ErrorMessage = "La fecha de expiración es obligatoria.")]
        [RegularExpression(@"^(0[1-9]|1[0-2])\/\d{2}$", ErrorMessage = "Formato de fecha de expiración incorrecto. Ejemplo: MM/AA")]
        public string FechaExpiracion { get; set; }

        [Required(ErrorMessage = "El método de entrega es obligatorio.")]
        public string MetodoEntrega { get; set; }

        [Required(ErrorMessage = "La dirección de envío es obligatoria.")]
        public string Direccion { get; set; }

        [Required(ErrorMessage = "La ciudad es obligatoria.")]
        public string Ciudad { get; set; }

        [Required(ErrorMessage = "El código postal es obligatorio.")]
        [RegularExpression(@"^\d{4,5}$", ErrorMessage = "Código Postal inválido.")]
        public string CodigoPostal { get; set; }
    }
}