using System;
using System.Collections.Generic;

namespace ApiRestElaniin.Models
{
    public partial class Usuarios
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string Password { get; set; }
        public string Correo { get; set; }
        public DateTime? Fecharegistro { get; set; }
        public string Telefono { get; set; }
        public DateTime? Fechanacimiento { get; set; }
    }
}
