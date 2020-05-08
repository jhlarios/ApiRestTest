using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ApiRestElaniin.Models;
using Microsoft.AspNetCore.Authorization;
namespace ApiRestElaniin.Controllers
{
    //Este controlador permite realizar las funciones de CRUD a la tabla de PRODUCTO
    [Route("[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private IConfiguration _config;
        private ElaniinTestContext _context;
        public ProductoController(ElaniinTestContext context, IConfiguration config)
        {
            _config = config;
            _context = context;
        }
        //Consultar producto
        [Authorize]
        [HttpGet]
        [Route("Consultar")]
        public List<Producto> Get(string sku, string nombreproducto, int? page, int? pageSize)
        {
            var Registros = new List<Producto> { };
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
            if ((sku == null || sku == "") && (nombreproducto == null || nombreproducto == ""))
            {
                Registros = _context.Producto.Skip(pagina * NumeroPorPagina).Take(NumeroPorPagina).OrderBy(x => x.Idproducto).ToList();
            }
            else
            {
                Registros = _context.Producto.Where(x => x.Sku.Contains(sku) || x.Nombre.Contains(nombreproducto)).Skip(pagina * NumeroPorPagina).Take(NumeroPorPagina).OrderBy(x => x.Idproducto).ToList();
            }
            return Registros;
        }
        //Consultar detalle producto
        [Authorize]
        [HttpGet]
        [Route("Detalle")]
        public Producto Get(int id)
        {
            var Registro = _context.Producto.Where(x => x.Idproducto == id).FirstOrDefault();
            return Registro;
        }
        //Registrar producto
        [Authorize]
        [HttpPost]
        
        [Route("Registrar")]
        public async Task<IActionResult> Post([FromBody] Producto Nuevo)
        {
            var Resultado = "";
            var Registro = Nuevo;
            try
            {
                Registro.Fecharegistro = DateTime.Now;
                _context.Producto.Add(Registro);
                await _context.SaveChangesAsync();
                Resultado = "Registro de producto Exitoso";
            }
            catch (Exception e)
            {
                Resultado = "Error en registro del producto: " + e;
            }
            return Ok(new { Resultado });
        }
        //Actualizar producto
        [Authorize]
        [HttpPut]
        
        [Route("Actualizar")]
        public async Task<IActionResult> Put(Producto Actualizado)
        {
            var Resultado = "";
            var Registro = _context.Producto.Where(x => x.Idproducto == Actualizado.Idproducto).FirstOrDefault();
            Registro.Sku = Actualizado.Sku;
            Registro.Nombre = Actualizado.Nombre;
            Registro.Cantidad = Actualizado.Cantidad;
            Registro.Precio = Actualizado.Precio;
            Registro.Descripcion = Actualizado.Descripcion;
            Registro.Imagen = Actualizado.Imagen;
            try
            {
                await _context.SaveChangesAsync();
                Resultado = "Registro Actualizado Exitosamente";
            }
            catch (Exception e)
            {
                Resultado = "Error en la actualizacion del registro: " + e;
            }
            return Ok(new { Resultado });
        }
        //Eliminar producto
        [Authorize]
        [HttpDelete]
        
        [Route("Eliminar")]
        public async Task<IActionResult> Delete(int id)
        {
            var Resultado = "";
            try
            {
                var Registro = _context.Producto.Where(x => x.Idproducto == id).FirstOrDefault();
                _context.Producto.Remove(Registro);
                await _context.SaveChangesAsync();
                Resultado = "Registro del producto eliminado Exitosamente";
            }
            catch (Exception e)
            {
                Resultado = "Hubo un problema con la eliminacion del registro del producto: " + e;
            }
            return Ok(new { Resultado });
        }
    }
}