using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using ApiRestElaniin.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace ApiRestElaniin.Controllers
{
    //Este controlador permite el Login de los usuarios registrados
    [ApiController]
    [Route("[controller]")]
    public class LoginUsuarioController : ControllerBase
    {
        private IConfiguration _config;
        private ElaniinTestContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public LoginUsuarioController(ElaniinTestContext context, IConfiguration config, IHttpContextAccessor httpContextAccessor)
        {
            _config = config;
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }
        //Permite el login de usuario
        [HttpGet]
        public IActionResult Login(string correo, string password)
        {
            UsuarioModel login = new UsuarioModel();
            login.Correo = correo;
            login.Password = password;
            IActionResult response = Unauthorized();
            var UsuarioLogin = AuthentificateUser(login);
            if (UsuarioLogin != null)
            {
                var TokenString = GenerateJSONWebTokenToken(UsuarioLogin,60);
                response = Ok(new { token = TokenString });
            }
            return response;
        }
        //Verifica el login del usuario en la base de datos
        private UsuarioModel AuthentificateUser(UsuarioModel login)
        {
            UsuarioModel usuario = null;
            var registro = _context.Usuarios.Where(x => x.Correo == login.Correo && x.Password == login.Password).FirstOrDefault();
            if (registro != null)
            {
                usuario = new UsuarioModel
                {
                    Usuario = registro.Usuario,
                    Correo = registro.Correo
                };
            };
            return usuario;
        }
        //Genera el web token
        private string GenerateJSONWebTokenToken(UsuarioModel logininfo, int minutos)
        {
            var securitykey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["jwt:Key"]));
            var credentials = new SigningCredentials(securitykey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
              new Claim (JwtRegisteredClaimNames.Sub, logininfo.Usuario)
             ,new Claim (JwtRegisteredClaimNames.Email, logininfo.Correo)
             ,new Claim (JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };
            var token = new JwtSecurityToken(
                issuer: _config["jwt:Issuer"]
               , audience: _config["jwt:Audience"]
               , claims
               , expires: DateTime.Now.AddMinutes(minutos)
               , signingCredentials: credentials
                );
            var encodedtoken = new JwtSecurityTokenHandler().WriteToken(token);
            return encodedtoken;
        }
       //obtener enlace de recuperacion de contraseña paso 1
        [HttpGet]
        [Route("ObtenerEnlaceRecuperarPassword")]
        public IActionResult Get(string correo)
        {
            var Url = "";
            UsuarioModel usuario = null;
            if (correo!=null && correo!="")
            { 
            var registro = _context.Usuarios.Where(x => x.Correo == correo).FirstOrDefault();
                if (registro==null)
                {
                    Url = "Correo no encontrado";
                }
            if (registro != null)
            {
                usuario = new UsuarioModel
                {
                    Usuario = registro.Usuario,
                    Correo = registro.Correo
                };
                    var TokenString = GenerateJSONWebTokenToken(usuario,15);
                    string host = $"{this.Request.Scheme}://{this.Request.Host}{this.Request.PathBase}";
                    Url =  host + "/LoginUsuario/ActualizarPassword" + "?token="  + TokenString + "&mail=" + registro.Correo;
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(_config["RecoveryMail:Mail"]);
                    mail.To.Add(registro.Correo);
                    mail.Subject = "Recuperacion de contraseña";
                    mail.Body = @"<h1>Link de Recuperacion de contraseña</h1> <br/> <br/>" + Url;
                    mail.IsBodyHtml = true;
                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(_config["RecoveryMail:Mail"], _config["RecoveryMail:Password"]);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }
                };
            }
            else
            {
                Url = "Correo invalido";
            }
            return Ok(Url);
        }
    }
}