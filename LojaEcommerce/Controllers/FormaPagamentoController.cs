using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LojaEcommerce.Models;

namespace LojaEcommerce.Controllers
{
    public class FormaPagamentoController : Controller
    {
        private LojaEcommerceContext db = new LojaEcommerceContext();

        // GET: FormaPagamento
        public ActionResult Index()
        {
            return View(db.FormasPagamento.ToList());
        }

        // GET: FormaPagamento/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPagamento formaPagamento = db.FormasPagamento.Find(id);
            if (formaPagamento == null)
            {
                return HttpNotFound();
            }
            return View(formaPagamento);
        }

        // GET: FormaPagamento/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FormaPagamento/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Forma")] FormaPagamento formaPagamento)
        {
            if (ModelState.IsValid)
            {
                formaPagamento.Id = Guid.NewGuid();
                db.FormasPagamento.Add(formaPagamento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(formaPagamento);
        }

        // GET: FormaPagamento/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPagamento formaPagamento = db.FormasPagamento.Find(id);
            if (formaPagamento == null)
            {
                return HttpNotFound();
            }
            return View(formaPagamento);
        }

        // POST: FormaPagamento/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Forma")] FormaPagamento formaPagamento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(formaPagamento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(formaPagamento);
        }

        // GET: FormaPagamento/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPagamento formaPagamento = db.FormasPagamento.Find(id);
            if (formaPagamento == null)
            {
                return HttpNotFound();
            }
            return View(formaPagamento);
        }

        // POST: FormaPagamento/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            FormaPagamento formaPagamento = db.FormasPagamento.Find(id);
            db.FormasPagamento.Remove(formaPagamento);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
