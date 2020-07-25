CREATE DATABASE dbrotisseria;
CREATE TABLE tblStatus (
codStatus INT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR (20)
);

CREATE TABLE tblProprietario (
codProprietario INT AUTO_INCREMENT PRIMARY KEY,
cpf VARCHAR (20) UNIQUE,
rg VARCHAR (20) UNIQUE NOT NULL,
nome VARCHAR (50) UNIQUE NOT NULL,
dataNascimento DATE UNIQUE NOT NULL,
FOREIGN KEY (codStatus) REFERENCES tblStatus (codStatus)
);

CREATE TABLE tblRotisseria (
codRotisseria INT AUTO_INCREMENT PRIMARY KEY,
cnpj VARCHAR (20) UNIQUE NOT NULL,
razaoSocial VARCHAR (20) UNIQUE NOT NULL,
dataFundacao DATE UNIQUE NOT NULL,
nomeFantasia VARCHAR (25) UNIQUE NOT NULL,
FOREIGN KEY (codProprietario) REFERENCES tblProprietario (codProprietario)
);

CREATE TABLE tblProprietario_Rotisseria(
FOREIGN KEY (codProprietario) REFERENCES tblProprietario (codProprietario),
FOREIGN KEY (codRotisseria) REFERENCES tblRotisseria (codRotisseria)
);

CREATE TABLE tblForncedor(codFornecedor INT AUTO_INCREMENT PRIMARY KEY,
nomeFantasia VARCHAR (25) UNIQUE NOT NULL,
nomeRazãoSocial VARCHAR (25) UNIQUE NOT NULL,
cnpj VARCHAR (25) UNIQUE NOT NULL
);

CREATE TABLE tblRotisseria_fornecedor(
FOREIGN KEY (codRotisseria) REFERENCES tblFornecedor (codFornecedor),
FOREIGN KEY (codFornecedor) REFERENCES tblRotisseria (codRotisseria)
);

CREATE TABLE tblEndereço (
codEndereco INT AUTO_INCREMENT PRIMARY KEY,
cep VARCHAR (25) UNIQUE NOT NULL,
logradouro VARCHAR (65) UNIQUE NOT NULL, 
bairro VARCHAR (45) UNIQUE NOT NULL,
região VARCHAR (25) UNIQUE NOT NULL
); 

CREATE TABLE tblTelefone (
codTelefone INT AUTO_INCREMENT PRIMARY KEY,
ddd VARCHAR (4) UNIQUE NOT NULL,
operadora VARCHAR (10) UNIQUE NOT NULL
);

CREATE TABLE tblEndereco_Telefone(
codEndereco INT NOT NULL, 
codTelefone INT NOT NULL,
FOREIGN KEY (codEndereco) REFERENCES tblTelefone (codTelefone),
FOREIGN KEY (codTelefone) REFERENCES tblEndereco (codEndereco),
PRIMARY KEY (codEndereco, codTelefone)
);

CREATE TABLE tblTipo_Telefone (
recado VARCHAR (25) UNIQUE NOT NULL, 
celular VARCHAR (25) UNIQUE NOT NULL, 
comercial VARCHAR (25) UNIQUE NOT NULL
); 
