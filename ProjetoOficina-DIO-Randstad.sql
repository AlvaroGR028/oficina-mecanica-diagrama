CREATE TABLE [Cliente] (
	[id_cliente] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] nvarchar(max) NOT NULL,
	[telefone] nvarchar(max) NOT NULL,
	[endereço] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_cliente])
);

CREATE TABLE [Veiculo] (
	[id_veiculo] int IDENTITY(1,1) NOT NULL UNIQUE,
	[placa] nvarchar(max) NOT NULL,
	[modelo] nvarchar(max) NOT NULL,
	[ano] int NOT NULL,
	[id_cliente] int NOT NULL,
	PRIMARY KEY ([id_veiculo])
);

CREATE TABLE [Equipe] (
	[id_equipe] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] int NOT NULL,
	PRIMARY KEY ([id_equipe])
);

CREATE TABLE [Mecânico] (
	[id_mecanico] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] nvarchar(max) NOT NULL,
	[endereco] nvarchar(max) NOT NULL,
	[especialidade] nvarchar(max) NOT NULL,
	[id_equipe] int NOT NULL,
	PRIMARY KEY ([id_mecanico])
);

CREATE TABLE [Servico] (
	[id_servico] int IDENTITY(1,1) NOT NULL UNIQUE,
	[descricao] nvarchar(max) NOT NULL,
	[valor_mao_obra] decimal(18,0) NOT NULL,
	PRIMARY KEY ([id_servico])
);

CREATE TABLE [Peca] (
	[id_peca] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] nvarchar(max) NOT NULL,
	[valor] decimal(18,0) NOT NULL,
	PRIMARY KEY ([id_peca])
);

CREATE TABLE [OrdemServico] (
	[id_os] int IDENTITY(1,1) NOT NULL UNIQUE,
	[numero] nvarchar(max) NOT NULL,
	[data_emissao] date NOT NULL,
	[valor_final] decimal(18,0) NOT NULL,
	[status] nvarchar(max) NOT NULL,
	[data_conclusao] date NOT NULL,
	[id_veiculo] int NOT NULL,
	[id_equipe] int NOT NULL,
	PRIMARY KEY ([id_os])
);

CREATE TABLE [ItemServico] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_os] int NOT NULL,
	[id_servico] int NOT NULL,
	[quantidade] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [ItemPeca] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_os] int NOT NULL,
	[id_peca] int NOT NULL,
	[quantidade] int NOT NULL,
	PRIMARY KEY ([id])
);


ALTER TABLE [Veiculo] ADD CONSTRAINT [Veiculo_fk4] FOREIGN KEY ([id_cliente]) REFERENCES [Cliente]([id_cliente]);

ALTER TABLE [Mecânico] ADD CONSTRAINT [Mecânico_fk4] FOREIGN KEY ([id_equipe]) REFERENCES [Equipe]([id_equipe]);


ALTER TABLE [OrdemServico] ADD CONSTRAINT [OrdemServico_fk6] FOREIGN KEY ([id_veiculo]) REFERENCES [Veiculo]([id_veiculo]);

ALTER TABLE [OrdemServico] ADD CONSTRAINT [OrdemServico_fk7] FOREIGN KEY ([id_equipe]) REFERENCES [Equipe]([id_equipe]);
ALTER TABLE [ItemServico] ADD CONSTRAINT [ItemServico_fk1] FOREIGN KEY ([id_os]) REFERENCES [OrdemServico]([id_os]);

ALTER TABLE [ItemServico] ADD CONSTRAINT [ItemServico_fk2] FOREIGN KEY ([id_servico]) REFERENCES [Servico]([id_servico]);
ALTER TABLE [ItemPeca] ADD CONSTRAINT [ItemPeca_fk1] FOREIGN KEY ([id_os]) REFERENCES [OrdemServico]([id_os]);

ALTER TABLE [ItemPeca] ADD CONSTRAINT [ItemPeca_fk2] FOREIGN KEY ([id_peca]) REFERENCES [Peca]([id_peca]);