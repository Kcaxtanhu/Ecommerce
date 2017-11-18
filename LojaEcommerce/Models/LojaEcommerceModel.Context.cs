﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LojaEcommerceContext : DbContext
    {
        public LojaEcommerceContext()
            : base("name=LojaEcommerceContext")
        {
            Configuration.ProxyCreationEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Cidade> Cidades { get; set; }
        public virtual DbSet<Endereco> Enderecos { get; set; }
        public virtual DbSet<Cliente> Clientes { get; set; }
        public virtual DbSet<Documento> Documentos { get; set; }
        public virtual DbSet<Categoria> Categorias { get; set; }
        public virtual DbSet<Utilizador> Utilizadores { get; set; }
        public virtual DbSet<Produto> Produtos { get; set; }
        public virtual DbSet<Encomenda> Reservas { get; set; }
        public virtual DbSet<Promocao> Promocoes { get; set; }
        public virtual DbSet<FormaPagamento> FormasPagamento { get; set; }
        public virtual DbSet<EncomendaProduto> EncomendasProduto { get; set; }
    }
}
