using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace LojaEcommerce.Models
{
    public class DetalheProduto
    {
        public string Nome { get; set; }

        [DisplayName("Data de Registo")]
        public System.DateTime DataRegisto { get; set; }

        [DisplayName("Número de Série")]
        public string NumeroSerie { get; set; }

        [DisplayName("Garantia")]
        public int TempoGarantia { get; set; }

        [DisplayName("Preço")]
        public decimal Preco { get; set; }

        public byte[] Imagem { get; set; }
        public System.Guid CategoriaId { get; set; }
        public System.Guid UtilizadorId { get; set; }
        public bool Diponivel { get; set; }
        public string ImagemTipo { get; set; }
    }
}