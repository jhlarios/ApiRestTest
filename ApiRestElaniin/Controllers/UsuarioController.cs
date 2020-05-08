using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ApiRestElaniin.Models;
using Microsoft.AspNetCore.Authorization;
using System.Net.Mail;
using System.Text.RegularExpressions;
namespace ApiRestElaniin.Controllers
{
    //Este controlador permite realizar las funciones de CRUD a la tabla de USUARIO
    [Route("[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private IConfiguration _config;
        private ElaniinTestContext _context;
        public UsuarioController(ElaniinTestContext context, IConfiguration config)
        {
            _config = config;
            _context = context;
        }
        //Consultar usuarios
        [Authorize]
        [HttpGet]
        [Route("Consultar")]
        public List<Usuarios> Get(string usuario, int? page, int? pageSize)
        {
            var Registros = new List<Usuarios> { };
            int pagina = 0;
            int NumeroPorPagina = 0;
            if (page == null)
            {
                pagina = 0;
            }
            else
            {
                pagina = ((int)page - 1 < 0 ? 0 : (int)page - 1);
            }
            if (pageSize == null && page == null)
            {
                NumeroPorPagina = _context.Producto.Count();
            }
            else if (pageSize == null && page != null)
            {
                NumeroPorPagina = 10;
            }
            else if (pageSize != null && page == null)
            {
                NumeroPorPagina = (pageSize <= 0 ? 1 : (int)pageSize);
            }
            else if (pageSize != null && page != null)
            {
                NumeroPorPagina = (pageSize <= 0 ? 1 : (int)pageSize);
            }
            if (usuario == null || usuario == "")
            {
                Registros = _context.Usuarios.Skip(pagina * NumeroPorPagina).Take(NumeroPorPagina).ToList();
            }
            else
            {
                Registros = _context.Usuarios.Where(x => x.Usuario.Contains(usuario)).Skip(pagina * NumeroPorPagina).Take(NumeroPorPagina).ToList();
            }
            return Registros;
        }
        //Consultar detalle de usuario
        [HttpGet]
        [Route("Detalle")]
        public Usuarios Get(int id)
        {
            var Registro = _context.Usuarios.Where(x => x.Id == id).FirstOrDefault();
            return Registro;
        }
        //Registrar usuario
        [Authorize]
        [HttpPost]
        //
        [Route("Registrar")]
        public async Task<IActionResult> Post([FromBody] Usuarios Nuevo)
        {
            var Resultado = "";
            var BanderaUsuario= _context.Usuarios.Where(x => x.Usuario == Nuevo.Usuario).Count();
            var BanderaCorreo = _context.Usuarios.Where(x => x.Correo == Nuevo.Correo).Count();
            var BanderaFormatoCorreo = (VerificarCorreo(Nuevo.Correo) == true ? 0 : 1);
            var BanderaFormatoTelefono = (VerificarTelefono(Nuevo.Telefono) == true ? 0 : 1);
            if (BanderaUsuario==0 && BanderaCorreo==0 && BanderaFormatoCorreo==0 && BanderaFormatoTelefono==0)
            { 
            var Registro = Nuevo;
            try
            {
                Registro.Fecharegistro = DateTime.Now;
                _context.Usuarios.Add(Registro);
                await _context.SaveChangesAsync();
                Resultado = "Registro Exitoso";
            }
            catch (Exception e)
            {
                Resultado = "Error en registro de usuario: " + e;
            }
            }
            else
            {
                if (BanderaUsuario != 0)
                    Resultado = "Este usuario ya existe";
                    if (BanderaCorreo != 0)
                    Resultado = Resultado + " Este Correo ya existe";
                if (BanderaFormatoCorreo != 0)
                    Resultado = Resultado + " Este Correo no tiene el formato correcto";
                if (BanderaFormatoTelefono != 0)
                    Resultado = Resultado + " Este No es un telefono";
            }
            return Ok(new { Resultado });
        }
        //Actualizar Usuario
        [Authorize]
        [HttpPut]
        [Route("Actualizar")]
        public async Task<IActionResult> Put(Usuarios Actualizado)
        {
            var Resultado = "";
            var BanderaUsuario = _context.Usuarios.Where(x => x.Usuario == Actualizado.Usuario && x.Id!=Actualizado.Id).Count();
            var BanderaCorreo = _context.Usuarios.Where(x => x.Correo == Actualizado.Correo && x.Id != Actualizado.Id).Count();
            var BanderaFormatoCorreo = (VerificarCorreo(Actualizado.Correo) == true ? 0 : 1);
            var BanderaFormatoTelefono = (VerificarTelefono(Actualizado.Telefono) == true ? 0 : 1);
            if (BanderaUsuario == 0 && BanderaCorreo == 0 && BanderaFormatoCorreo == 0 && BanderaFormatoTelefono == 0)
            {

                var Registro = _context.Usuarios.Where(x => x.Id == Actualizado.Id).FirstOrDefault();
            Registro.Usuario = Actualizado.Usuario;
            Registro.Password = Actualizado.Password;
            Registro.Correo = Actualizado.Correo;
            Registro.Correo = Actualizado.Correo;
            Registro.Telefono = Actualizado.Telefono;
            Registro.Fechanacimiento = Actualizado.Fechanacimiento;
            try
            {
                await _context.SaveChangesAsync();
                Resultado = "Registro Actualizado Exitosamente";
            }
            catch (Exception e)
            {
                Resultado = "Error en la actualizacion del registro: " + e;
            }
            }
            else
            {
                if (BanderaUsuario != 0)
                    Resultado = "Este usuario ya existe";
                if (BanderaCorreo != 0)
                    Resultado = Resultado + " Este Correo ya existe";
                if (BanderaFormatoCorreo != 0)
                    Resultado = Resultado + " Este Correo no tiene el formato correcto";
                if (BanderaFormatoTelefono != 0)
                    Resultado = Resultado + " Este No es un telefono";
            }
            return Ok(new { Resultado });
        }
        //Eliminar usuario
        [Authorize]
        [HttpDelete]
        [Route("Eliminar")]
        public async Task<IActionResult> Delete(int id)
        {
            var Resultado = "";
            try
            {
                var Registro = _context.Usuarios.Where(x => x.Id == id).FirstOrDefault();
                _context.Usuarios.Remove(Registro);
                await _context.SaveChangesAsync();
                Resultado = "Registro eliminado Exitosamente";
            }
            catch (Exception e)
            {
                Resultado = "Hubo un problema con la eliminacion del registro: " + e;
            }
            return Ok(new { Resultado });
        }
        private bool VerificarCorreo(string email)
        {
            try
            {
                var mail = new MailAddress(email);
                return mail.Host.Contains(".");
            }
            catch
            {
                return false;
            }
        }
        public static bool VerificarTelefono(string number)
        {
            return Regex.Match(number, @"^[0-9]+$").Success;
        }
    }
}