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
    
    public partial class Endereco
    {
        public System.Guid Id { get; set; }
        public string Morada { get; set; }
        public System.Guid CidadeId { get; set; }
    
        public virtual Cidade Cidade { get; set; }
        public virtual Cliente Cliente { get; set; }
    }
}
