//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LojaEcommerce.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class EncomendaProduto
    {
        public System.Guid Id { get; set; }
        public System.Guid EncomendaId { get; set; }
        public System.Guid ProdutoId { get; set; }
    
        public virtual Encomenda Encomenda { get; set; }
        public virtual Produto Produto { get; set; }
    }
}
