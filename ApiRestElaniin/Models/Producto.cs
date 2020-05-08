using System;
using System.Collections.Generic;

namespace ApiRestElaniin.Models
{
    public partial class Producto
    {
        public int Idproducto { get; set; }
        public string Sku { get; set; }
        public string Nombre { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }
        public byte[] Imagen { get; set; }
        public DateTime? Fecharegistro { get; set; }
    }
}
