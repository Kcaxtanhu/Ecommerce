using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace LojaEcommerce.Models
{
    public class EditarEncomenda
    {
        [DisplayName("Nome Cliente")]
        public string Nome { get; set; }

        [DisplayName("Número do documento")]
        public string NumeroDocumento { get; set; }

        public System.Guid DocumentoId { get; set; }

        [DisplayName("Morada")]
        public string Morada { get; set; }
        public System.Guid CidadeId { get; set; }

        public Guid FormaId { get; set; }

        //public Cliente Cliente { get; set; }
        //public Endereco Endereco { get; set; }
        public List<Produto> Produtos { get; set; }
        //public FormaPagamento FormaPagamento { get; set; }

        public EditarEncomenda()
        {
            this.Produtos = new List<Produto>();
        }
    }
}