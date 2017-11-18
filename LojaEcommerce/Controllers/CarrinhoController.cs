using LojaEcommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LojaEcommerce.Controllers
{
    public class CarrinhoController : Controller
    {
        LojaEcommerceContext db = new LojaEcommerceContext();

        // GET: Carrinho
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Add(Guid id)
        {
            var produto = db.Produtos.Where(p => p.Id == id).FirstOrDefault();

            if (Session["cart"] == null)
            {
                List<Produto> produtos = new List<Produto>();

                produtos.Add(produto);
                Session["cart"] = produtos;
                ViewBag.cart = produtos.Count();

                Session["count"] = 1;
            }
            else
            {
                List<Produto> produtos = (List<Produto>)Session["cart"];
                produtos.Add(produto);
                Session["cart"] = produtos;
                ViewBag.cart = produtos.Count();
                Session["count"] = Convert.ToInt32(Session["count"]) + 1;

            }

            return RedirectToAction("Index", "Produto");
        }

        public ActionResult Delete(Guid id)
        {
            List<Produto> produtos = (List<Produto>)Session["cart"];
            var produto = produtos.Where(p => p.Id == id).FirstOrDefault();
            produtos.Remove(produto);
            Session["cart"] = produtos;
            ViewBag.cart = produtos.Count();
            Session["count"] = Convert.ToInt32(Session["count"]) + 1;

            return RedirectToAction("Index", "Produto");
        }
    }
}