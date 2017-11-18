using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LojaEcommerce.Models;
using System.IO;

namespace LojaEcommerce.Controllers
{
    public class ProdutoController : Controller
    {
        private LojaEcommerceContext db = new LojaEcommerceContext();

        // GET: Produto
        public ActionResult Index(string ut)
        {
            var produtos = db.Produtos.Include(p => p.Categoria).Include(p => p.Utilizador);

            Session["utilizador"] = ut;

            return View(produtos.ToList());
        }

        // GET: Produto/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ViewBag.Produto = id;

            Produto produto = db.Produtos.Find(id);
            ViewBag.Model = produto;

            if (produto == null)
            {
                return HttpNotFound();
            }
            return View(produto);
        }


        // GET: Produto/Create
        public ActionResult Create()
        {
            ViewBag.CategoriaId = new SelectList(db.Categorias.ToList(), "Id", "Nome");
            ViewBag.UtilizadorId = new SelectList(db.Utilizadores.ToList(), "Id", "NomeUtilizador");
            return View();
        }

        // POST: Produto/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EditarProduto produtoVm)
        {
            Produto produto = new Produto();
            produto.ImagemTipo = produtoVm.Imagem.ContentType;
            produto.Nome = produtoVm.Nome;
            produto.ImagemTipo = produtoVm.Imagem.ContentType;
            produto.NumeroSerie = produtoVm.NumeroSerie;
            produto.Preco = produtoVm.Preco;
            produto.TempoGarantia = produtoVm.TempoGarantia;
            produto.UtilizadorId = produtoVm.UtilizadorId;
            produto.DataRegisto = DateTime.Now;
            produto.CategoriaId = produtoVm.CategoriaId;

            using (var ms = new MemoryStream())
            {
                produtoVm.Imagem.InputStream.CopyTo(ms);
                produto.Imagem = ms.ToArray();
            }

            if (ModelState.IsValid)
            {
                produto.Id = Guid.NewGuid();
                db.Produtos.Add(produto);
                db.SaveChanges();

                var id = produto.Id;

                return RedirectToAction("Details", new { id = id });
            }

            ViewBag.CategoriaId = new SelectList(db.Categorias.ToList(), "Id", "Nome", produto.CategoriaId);
            ViewBag.UtilizadorId = new SelectList(db.Utilizadores.ToList(), "Id", "NomeUtilizador", produto.UtilizadorId);
            return View(produtoVm);
        }

        // GET: Produto/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Produto produto = db.Produtos.Find(id);
            if (produto == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoriaId = new SelectList(db.Categorias, "Id", "Nome", produto.CategoriaId);
            ViewBag.UtilizadorId = new SelectList(db.Utilizadores, "Id", "NomeUtilizador", produto.UtilizadorId);
            return View(produto);
        }

        // POST: Produto/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nome,DataRegisto,NumeroSerie,TempoGarantia,Preco,Imagem,CategoriaId,UtilizadorId,Diponivel")] Produto produto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(produto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoriaId = new SelectList(db.Categorias, "Id", "Nome", produto.CategoriaId);
            ViewBag.UtilizadorId = new SelectList(db.Utilizadores, "Id", "NomeUtilizador", produto.UtilizadorId);
            return View(produto);
        }

        // GET: Produto/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Produto produto = db.Produtos.Find(id);
            if (produto == null)
            {
                return HttpNotFound();
            }
            return View(produto);
        }

        // POST: Produto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Produto produto = db.Produtos.Find(id);
            db.Produtos.Remove(produto);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Ficheiro(Guid produto)
        {
            var produtoImagem = ObterImagemProduto(produto);

            return File(produtoImagem.Imagem, produtoImagem.ImagemTipo);
        }


        private Produto ObterImagemProduto(Guid? id)
        {
            var produto = db.Produtos.Where(p => p.Id == id).FirstOrDefault();

            return produto;
        }

    }
}
