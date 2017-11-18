using LojaEcommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace LojaEcommerce.Controllers
{
    public class LoginController : Controller
    {
        LojaEcommerceContext ctx = new LojaEcommerceContext();

        // GET: Login
        public ActionResult Entrar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Entrar(Utilizador ut)
        {
            var utilizador = ctx.Utilizadores.Where(u => u.NomeUtilizador == ut.NomeUtilizador && u.Estado == true).FirstOrDefault();

            if (utilizador != null)
            {
                byte[] data = Convert.FromBase64String(utilizador.Senha);
                string senha = Encoding.UTF8.GetString(data);

                if (senha == ut.Senha)
                {
                    return RedirectToAction("Index", "Produto", utilizador);
                }
            }

            return RedirectToAction("Index", "Produto", null);


        }
    }
}