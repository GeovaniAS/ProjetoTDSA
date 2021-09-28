# ProjetoTDSA
testeProjTDSA
    		CREATE TABLE [dbo].[Produto] (
	[Id]         INT             IDENTITY (1, 1) NOT NULL,
	[nome]       NCHAR (100)     NOT NULL,
    [categoria]  NCHAR (100)     NULL,
    [preco]      NUMERIC (12, 2) NULL,
    [quantidade] INT             NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC));


	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (1, N'produto1.1', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 5)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (2, N'produto1.2', N'categoria1', CAST(5.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (3, N'prduto 2.1', N'categoria2', CAST(5.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (4, N'prduto 1.3', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (5, N'asdasd', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 20)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (6, N'produto1.1', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 5)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (7, N'produto1.2', N'categoria1', CAST(5.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (8, N'prduto 2.1', N'categoria2', CAST(5.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (9, N'prduto 1.3', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 3)
	INSERT INTO [dbo].[Produto] ([Id], [nome], [categoria], [preco], [quantidade]) VALUES (10, N'asdasd', N'categoria1', CAST(2.00 AS Decimal(12, 2)), 20)


