using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LojaEcommerce.Models;

namespace LojaEcommerce.Controllers
{
    public class EncomendaController : Controller
    {
        LojaEcommerceContext ctx = new LojaEcommerceContext();

        // GET: Encomenda
        public ActionResult Index()
        {
            return View();
        }

        // GET
        public ActionResult Create()
        {
            PreencherDados();

            ViewBag.Produtos = (List<Produto>)Session["carrinho"];

            return View();
        }

        //POST
        [HttpPost]
        public ActionResult Create(EditarEncomenda model)
        {
            try
            {
                Endereco endereco = new Endereco();
                endereco.Morada = model.Morada;
                endereco.CidadeId = model.CidadeId;
                endereco.Id = Guid.NewGuid();
                

                Cliente cliente = new Cliente();
                cliente.Nome = model.Nome;
                cliente.NumeroDocumento = model.NumeroDocumento;
                cliente.DocumentoId = model.DocumentoId;
                cliente.Endereco = endereco;
                cliente.Id = Guid.NewGuid();
                ctx.Clientes.Add(cliente);

                Encomenda encomenda = new Encomenda();
                encomenda.DataReserva = DateTime.Now;
                encomenda.FormaPagamentoId = model.FormaId;
                encomenda.Cliente = cliente;
                encomenda.Id = Guid.NewGuid();

                ctx.Reservas.Add(encomenda);


                foreach (var p in (List<Produto>)Session["carrinho"])
                {
                    EncomendaProduto ep = new EncomendaProduto();
                    //ep.Produto = p;
                    ep.Encomenda = encomenda;
                    ep.Id = Guid.NewGuid();

                    p.EncomendaProduto.Add(ep);
                    //encomenda.EncomendaProduto.Add(ep);
                }

                //ctx.Reservas.Add(encomenda);
                ctx.SaveChanges();

                var id = encomenda.Id;

                Session["carrinho"] = null;

                return RedirectToAction("Index", "Index");
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public ActionResult Details(Guid id)
        {
            var model = ctx.EncomendasProduto.Where(e => e.Id == id).FirstOrDefault();

            return View(model);
        }

        private void PreencherDados()
        {
            var documentos = ctx.Documentos.ToList().AsEnumerable();
            var formasPagamento = ctx.FormasPagamento.ToList().AsEnumerable();
            var cidades = ctx.Cidades.ToList().AsEnumerable();

            ViewBag.DocumentoId = new SelectList(documentos, "Id", "Nome");
            ViewBag.FormaPagamentoId = new SelectList(formasPagamento, "Id", "Forma");
            ViewBag.CidadeId = new SelectList(cidades, "Id", "Nome");
            ctx.Dispose();
        }
    }
}