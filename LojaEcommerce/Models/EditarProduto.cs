using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LojaEcommerce.Models
{
    public class EditarProduto
    {
        public string Nome { get; set; }
        public System.DateTime DataRegisto { get; set; }
        public string NumeroSerie { get; set; }
        public int TempoGarantia { get; set; }
        public decimal Preco { get; set; }
        public System.Guid CategoriaId { get; set; }
        public System.Guid UtilizadorId { get; set; }
        public bool Diponivel { get; set; }
        public HttpPostedFileBase Imagem { get; set; }
    }
}