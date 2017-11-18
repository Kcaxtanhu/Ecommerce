
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/18/2017 05:50:09
-- Generated from EDMX file: C:\Users\e000142\Documents\Estudos\LojaEcommerce\LojaEcommerce\Models\LojaEcommerceModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LojaEcommerce];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CidadeEndereco]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enderecos] DROP CONSTRAINT [FK_CidadeEndereco];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteEndereco]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [FK_ClienteEndereco];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentoCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clientes] DROP CONSTRAINT [FK_DocumentoCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriaProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produtos] DROP CONSTRAINT [FK_CategoriaProduto];
GO
IF OBJECT_ID(N'[dbo].[FK_UtilizadorProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produtos] DROP CONSTRAINT [FK_UtilizadorProduto];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteReserva]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservas] DROP CONSTRAINT [FK_ClienteReserva];
GO
IF OBJECT_ID(N'[dbo].[FK_ProdutoPromocao_Produto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutoPromocao] DROP CONSTRAINT [FK_ProdutoPromocao_Produto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProdutoPromocao_Promocao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdutoPromocao] DROP CONSTRAINT [FK_ProdutoPromocao_Promocao];
GO
IF OBJECT_ID(N'[dbo].[FK_FormaPagamentoEncomenda]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservas] DROP CONSTRAINT [FK_FormaPagamentoEncomenda];
GO
IF OBJECT_ID(N'[dbo].[FK_EncomendaEncomendaProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EncomendasProduto] DROP CONSTRAINT [FK_EncomendaEncomendaProduto];
GO
IF OBJECT_ID(N'[dbo].[FK_ProdutoEncomendaProduto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EncomendasProduto] DROP CONSTRAINT [FK_ProdutoEncomendaProduto];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cidades]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cidades];
GO
IF OBJECT_ID(N'[dbo].[Enderecos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enderecos];
GO
IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Documentos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documentos];
GO
IF OBJECT_ID(N'[dbo].[Categorias]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categorias];
GO
IF OBJECT_ID(N'[dbo].[Utilizadores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Utilizadores];
GO
IF OBJECT_ID(N'[dbo].[Produtos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Produtos];
GO
IF OBJECT_ID(N'[dbo].[Reservas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservas];
GO
IF OBJECT_ID(N'[dbo].[Promocoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Promocoes];
GO
IF OBJECT_ID(N'[dbo].[FormasPagamento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FormasPagamento];
GO
IF OBJECT_ID(N'[dbo].[EncomendasProduto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EncomendasProduto];
GO
IF OBJECT_ID(N'[dbo].[ProdutoPromocao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProdutoPromocao];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cidades'
CREATE TABLE [dbo].[Cidades] (
    [Id] uniqueidentifier  NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Enderecos'
CREATE TABLE [dbo].[Enderecos] (
    [Id] uniqueidentifier  NOT NULL,
    [Morada] nvarchar(max)  NOT NULL,
    [CidadeId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] uniqueidentifier  NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [NumeroDocumento] nvarchar(max)  NOT NULL,
    [DocumentoId] uniqueidentifier  NOT NULL,
    [Endereco_Id] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Documentos'
CREATE TABLE [dbo].[Documentos] (
    [Id] uniqueidentifier  NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] uniqueidentifier  NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Utilizadores'
CREATE TABLE [dbo].[Utilizadores] (
    [Id] uniqueidentifier  NOT NULL,
    [NomeUtilizador] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL,
    [Estado] bit  NOT NULL,
    [IsAdmin] bit  NOT NULL
);
GO

-- Creating table 'Produtos'
CREATE TABLE [dbo].[Produtos] (
    [Id] uniqueidentifier  NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [DataRegisto] datetime  NOT NULL,
    [NumeroSerie] nvarchar(max)  NOT NULL,
    [TempoGarantia] int  NOT NULL,
    [Preco] decimal(18,0)  NOT NULL,
    [Imagem] varbinary(max)  NOT NULL,
    [CategoriaId] uniqueidentifier  NOT NULL,
    [UtilizadorId] uniqueidentifier  NOT NULL,
    [Diponivel] bit  NOT NULL,
    [ImagemTipo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Reservas'
CREATE TABLE [dbo].[Reservas] (
    [Id] uniqueidentifier  NOT NULL,
    [ClienteId] uniqueidentifier  NOT NULL,
    [DataReserva] datetime  NOT NULL,
    [FormaPagamentoId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Promocoes'
CREATE TABLE [dbo].[Promocoes] (
    [Id] uniqueidentifier  NOT NULL,
    [DataInicio] datetime  NOT NULL,
    [DataFim] datetime  NOT NULL,
    [Percentagem] nvarchar(max)  NOT NULL,
    [DataRegisto] datetime  NOT NULL
);
GO

-- Creating table 'FormasPagamento'
CREATE TABLE [dbo].[FormasPagamento] (
    [Id] uniqueidentifier  NOT NULL,
    [Forma] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EncomendasProduto'
CREATE TABLE [dbo].[EncomendasProduto] (
    [Id] uniqueidentifier  NOT NULL,
    [EncomendaId] uniqueidentifier  NOT NULL,
    [ProdutoId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'ProdutoPromocao'
CREATE TABLE [dbo].[ProdutoPromocao] (
    [Produto_Id] uniqueidentifier  NOT NULL,
    [Promocao_Id] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cidades'
ALTER TABLE [dbo].[Cidades]
ADD CONSTRAINT [PK_Cidades]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Enderecos'
ALTER TABLE [dbo].[Enderecos]
ADD CONSTRAINT [PK_Enderecos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documentos'
ALTER TABLE [dbo].[Documentos]
ADD CONSTRAINT [PK_Documentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Utilizadores'
ALTER TABLE [dbo].[Utilizadores]
ADD CONSTRAINT [PK_Utilizadores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [PK_Produtos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [PK_Reservas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Promocoes'
ALTER TABLE [dbo].[Promocoes]
ADD CONSTRAINT [PK_Promocoes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FormasPagamento'
ALTER TABLE [dbo].[FormasPagamento]
ADD CONSTRAINT [PK_FormasPagamento]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EncomendasProduto'
ALTER TABLE [dbo].[EncomendasProduto]
ADD CONSTRAINT [PK_EncomendasProduto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Produto_Id], [Promocao_Id] in table 'ProdutoPromocao'
ALTER TABLE [dbo].[ProdutoPromocao]
ADD CONSTRAINT [PK_ProdutoPromocao]
    PRIMARY KEY CLUSTERED ([Produto_Id], [Promocao_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CidadeId] in table 'Enderecos'
ALTER TABLE [dbo].[Enderecos]
ADD CONSTRAINT [FK_CidadeEndereco]
    FOREIGN KEY ([CidadeId])
    REFERENCES [dbo].[Cidades]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CidadeEndereco'
CREATE INDEX [IX_FK_CidadeEndereco]
ON [dbo].[Enderecos]
    ([CidadeId]);
GO

-- Creating foreign key on [Endereco_Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_ClienteEndereco]
    FOREIGN KEY ([Endereco_Id])
    REFERENCES [dbo].[Enderecos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteEndereco'
CREATE INDEX [IX_FK_ClienteEndereco]
ON [dbo].[Clientes]
    ([Endereco_Id]);
GO

-- Creating foreign key on [DocumentoId] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_DocumentoCliente]
    FOREIGN KEY ([DocumentoId])
    REFERENCES [dbo].[Documentos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentoCliente'
CREATE INDEX [IX_FK_DocumentoCliente]
ON [dbo].[Clientes]
    ([DocumentoId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [FK_CategoriaProduto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProduto'
CREATE INDEX [IX_FK_CategoriaProduto]
ON [dbo].[Produtos]
    ([CategoriaId]);
GO

-- Creating foreign key on [UtilizadorId] in table 'Produtos'
ALTER TABLE [dbo].[Produtos]
ADD CONSTRAINT [FK_UtilizadorProduto]
    FOREIGN KEY ([UtilizadorId])
    REFERENCES [dbo].[Utilizadores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UtilizadorProduto'
CREATE INDEX [IX_FK_UtilizadorProduto]
ON [dbo].[Produtos]
    ([UtilizadorId]);
GO

-- Creating foreign key on [ClienteId] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [FK_ClienteReserva]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteReserva'
CREATE INDEX [IX_FK_ClienteReserva]
ON [dbo].[Reservas]
    ([ClienteId]);
GO

-- Creating foreign key on [Produto_Id] in table 'ProdutoPromocao'
ALTER TABLE [dbo].[ProdutoPromocao]
ADD CONSTRAINT [FK_ProdutoPromocao_Produto]
    FOREIGN KEY ([Produto_Id])
    REFERENCES [dbo].[Produtos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Promocao_Id] in table 'ProdutoPromocao'
ALTER TABLE [dbo].[ProdutoPromocao]
ADD CONSTRAINT [FK_ProdutoPromocao_Promocao]
    FOREIGN KEY ([Promocao_Id])
    REFERENCES [dbo].[Promocoes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoPromocao_Promocao'
CREATE INDEX [IX_FK_ProdutoPromocao_Promocao]
ON [dbo].[ProdutoPromocao]
    ([Promocao_Id]);
GO

-- Creating foreign key on [FormaPagamentoId] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [FK_FormaPagamentoEncomenda]
    FOREIGN KEY ([FormaPagamentoId])
    REFERENCES [dbo].[FormasPagamento]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FormaPagamentoEncomenda'
CREATE INDEX [IX_FK_FormaPagamentoEncomenda]
ON [dbo].[Reservas]
    ([FormaPagamentoId]);
GO

-- Creating foreign key on [EncomendaId] in table 'EncomendasProduto'
ALTER TABLE [dbo].[EncomendasProduto]
ADD CONSTRAINT [FK_EncomendaEncomendaProduto]
    FOREIGN KEY ([EncomendaId])
    REFERENCES [dbo].[Reservas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EncomendaEncomendaProduto'
CREATE INDEX [IX_FK_EncomendaEncomendaProduto]
ON [dbo].[EncomendasProduto]
    ([EncomendaId]);
GO

-- Creating foreign key on [ProdutoId] in table 'EncomendasProduto'
ALTER TABLE [dbo].[EncomendasProduto]
ADD CONSTRAINT [FK_ProdutoEncomendaProduto]
    FOREIGN KEY ([ProdutoId])
    REFERENCES [dbo].[Produtos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProdutoEncomendaProduto'
CREATE INDEX [IX_FK_ProdutoEncomendaProduto]
ON [dbo].[EncomendasProduto]
    ([ProdutoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------