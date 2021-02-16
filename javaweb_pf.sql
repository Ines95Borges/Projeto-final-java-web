-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Fev-2021 às 17:43
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `javaweb_pf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compraprodutos`
--

CREATE TABLE `compraprodutos` (
  `CompraProdutos_ID` int(11) NOT NULL,
  `Produto_ID` int(11) NOT NULL,
  `Fornecedor_ID` int(11) NOT NULL,
  `Quantidade` smallint(6) NOT NULL,
  `DateReg` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compraprodutos`
--

INSERT INTO `compraprodutos` (`CompraProdutos_ID`, `Produto_ID`, `Fornecedor_ID`, `Quantidade`, `DateReg`) VALUES
(1, 1, 1, 10, '2021-01-14 15:45:28'),
(2, 4, 2, 100, '2020-12-09 11:01:06'),
(3, 5, 2, 100, '2021-01-14 15:45:28'),
(4, 6, 1, 100, '2021-01-21 14:24:52'),
(5, 7, 3, 100, '2021-01-26 14:56:29'),
(6, 5, 2, 12, '2021-01-26 15:10:46'),
(7, 5, 3, 1, '2021-01-26 15:13:32'),
(8, 8, 3, 934, '2021-02-02 14:39:19');

--
-- Acionadores `compraprodutos`
--
DELIMITER $$
CREATE TRIGGER `adiciona_produto_stock` AFTER INSERT ON `compraprodutos` FOR EACH ROW UPDATE produtos SET produtos.quantidade = produtos.quantidade + new.Quantidade
WHERE produtos.Produto_ID = new.Produto_ID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `Fornecedor_ID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `NIF` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`Fornecedor_ID`, `Nome`, `NIF`) VALUES
(1, 'Mr. Jones', 22222222),
(2, 'Mrs. Babydoll', 11111111),
(3, 'Mr. Hugo Monteiro', 81726354),
(4, 'Mrs. Jaqueline Botelho', 98765432),
(5, 'Alejandro', 5784578);

-- --------------------------------------------------------

--
-- Estrutura da tabela `privilegio`
--

CREATE TABLE `privilegio` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `privilegio`
--

INSERT INTO `privilegio` (`id`, `descricao`) VALUES
(1, 'Acessar site'),
(2, 'Acessar Sistema Adm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `privilegioutilizador`
--

CREATE TABLE `privilegioutilizador` (
  `idPrivilegio` int(11) NOT NULL,
  `idUtilizador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `privilegioutilizador`
--

INSERT INTO `privilegioutilizador` (`idPrivilegio`, `idUtilizador`) VALUES
(1, 2),
(1, 6),
(1, 15),
(1, 16),
(1, 18),
(1, 19),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `Produto_ID` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `precoVenda` float(6,2) NOT NULL,
  `quantidade` smallint(6) NOT NULL,
  `precoCompra` float(5,2) NOT NULL,
  `foto` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`Produto_ID`, `nome`, `precoVenda`, `quantidade`, `precoCompra`, `foto`) VALUES
(1, 'Babygrow', 30.25, 22, 15.14, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPivb04W3k29l7a5j_Fr1W8R-8XANGQM5AWvxN4h-z-qMDQAxr55pLff2QMLDHQpZulefmyoeg&usqp=CAc'),
(4, 'Calças menina', 30.25, 56, 16.94, 'data:image/jpeg;base64,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'),
(5, 'T-shirt bebê', 10.02, 61, 4.98, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwcl_PJrRLbGTvBpaWJPWjgxLY3fPkbGxhkA&usqp=CAU'),
(6, 'Saia menina', 14.46, 99, 28.49, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXUyyjh_IPweWF89QUj8QxTka0BJq1RL6DGA&usqp=CAU'),
(7, 'Calças menino', 34.56, 50, 12.34, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmi0gS6iaGrazAK6v_Laf-WCk-0TQ-VqK9QQ&usqp=CAU'),
(8, 'Blusa menino', 15.54, 54, 8.92, 'data:image/jpeg;base64,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'),
(9, 'Gorros', 8.95, 28, 4.59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt6-vnnOz7qCCvf0eosX1KqTZ4gBUUqYSnmR0w7XX83qKsDg4ECbMJj8VXn5OnQbOEwzkaQxZx&usqp=CAc'),
(10, 'Vestido menina', 26.49, 45, 12.56, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl92A4pe43bHxq9hU120DpqW1azKFtHT4llg&usqp=CAU');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `pwd` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id`, `nome`, `pwd`) VALUES
(1, 'inesb', '46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5'),
(2, 'teste', '46070d4bf934fb0d4b06d9e2c46e346944e322444900a435d7d9a95e6d7435f5'),
(3, 'novo', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(4, 'irlene', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(5, 'hugo', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(6, 'jaque', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(7, 'irlene', 'fe2592b42a727e977f055947385b709cc82b16b9a87f88c6abf3900d65d0cdc3'),
(8, 'registo', 'c33c1b466bcab9df4fedfa229d305a1ffde55cae99aa77cc4c164cf1a8873a41'),
(9, 'batata', 'a76259f0066b94a5d4f555360f5ec52b227dacbcd70ccb1a607cdfbcee579c46'),
(10, 'hermione', '47300d32f6ae9f0b62bf2d951721a65ccf3e5c9d1ba86c440dd606bef4c109d7'),
(11, 'ron', '32801f5c6ca59882d004c3b927de38fa22fa1ed71e0f63d66707f000f2587eac'),
(12, 'harry', 'df46219531cb5d522d0845901978dccfa286a5b0437f4f9cd4e485064f6b632c'),
(13, 'draco', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(14, 'malfoy', 'd1c7978ae93aaa222596f9b2d5c5f7a36cf6f2fd102af9af5e6888b4183f8757'),
(15, 'irlene', 'fe2592b42a727e977f055947385b709cc82b16b9a87f88c6abf3900d65d0cdc3'),
(16, 'Kassandra', '4321'),
(17, 'orlando', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(18, 'fernando', '02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X02X'),
(19, 'maria', 'maria'),
(20, 'maria', '94aec9fbed989ece189a7e172c9cf41669050495152bc4c1dbf2a38d7fd85627');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendeprodutos`
--

CREATE TABLE `vendeprodutos` (
  `VendeProduto_ID` int(11) NOT NULL,
  `Cliente_ID` int(11) NOT NULL,
  `Produto_ID` int(11) NOT NULL,
  `Quantidade` int(6) NOT NULL,
  `DataReg` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendeprodutos`
--

INSERT INTO `vendeprodutos` (`VendeProduto_ID`, `Cliente_ID`, `Produto_ID`, `Quantidade`, `DataReg`) VALUES
(2, 1, 1, 10, '2021-01-18 15:47:44'),
(3, 3, 4, 23, '2021-01-03 15:57:05'),
(4, 2, 5, 41, '2021-01-09 15:57:05'),
(6, 1, 1, 10, '2021-01-19 16:13:58'),
(8, 1, 1, 15, '2021-01-19 16:37:10'),
(12, 3, 4, 10, '2021-01-19 16:48:52'),
(14, 1, 4, 10, '2021-01-19 16:53:41'),
(15, 1, 5, 10, '2021-01-19 16:54:04'),
(17, 2, 4, 1, '2021-01-19 17:03:54'),
(18, 3, 1, 1, '2021-01-21 14:13:59'),
(19, 5, 7, 50, '2021-01-26 15:01:44'),
(20, 1, 6, 1, '2021-01-26 15:05:17'),
(21, 1, 1, 1, '2021-01-26 15:05:42'),
(22, 6, 1, 1, '2021-01-26 15:07:42'),
(23, 4, 5, 1, '2021-01-26 15:10:11'),
(24, 1, 8, 50, '2021-02-02 14:40:11');

--
-- Acionadores `vendeprodutos`
--
DELIMITER $$
CREATE TRIGGER `retira_produtos_stock` AFTER INSERT ON `vendeprodutos` FOR EACH ROW UPDATE produtos SET produtos.quantidade = produtos.quantidade - new.Quantidade
WHERE produtos.Produto_ID = new.Produto_ID
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `compraprodutos`
--
ALTER TABLE `compraprodutos`
  ADD PRIMARY KEY (`CompraProdutos_ID`),
  ADD KEY `Produto_ID` (`Produto_ID`),
  ADD KEY `Fornecedor_ID` (`Fornecedor_ID`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`Fornecedor_ID`);

--
-- Índices para tabela `privilegio`
--
ALTER TABLE `privilegio`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `privilegioutilizador`
--
ALTER TABLE `privilegioutilizador`
  ADD PRIMARY KEY (`idPrivilegio`,`idUtilizador`),
  ADD KEY `idUtilizador` (`idUtilizador`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendeprodutos`
--
ALTER TABLE `vendeprodutos`
  ADD PRIMARY KEY (`VendeProduto_ID`),
  ADD KEY `Produto_ID` (`Produto_ID`),
  ADD KEY `vendeprodutos_ibfk_1` (`Cliente_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compraprodutos`
--
ALTER TABLE `compraprodutos`
  MODIFY `CompraProdutos_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `Fornecedor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `Produto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `vendeprodutos`
--
ALTER TABLE `vendeprodutos`
  MODIFY `VendeProduto_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compraprodutos`
--
ALTER TABLE `compraprodutos`
  ADD CONSTRAINT `compraprodutos_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produtos` (`Produto_ID`),
  ADD CONSTRAINT `compraprodutos_ibfk_2` FOREIGN KEY (`Fornecedor_ID`) REFERENCES `fornecedores` (`Fornecedor_ID`);

--
-- Limitadores para a tabela `privilegioutilizador`
--
ALTER TABLE `privilegioutilizador`
  ADD CONSTRAINT `privilegioutilizador_ibfk_1` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegio` (`id`),
  ADD CONSTRAINT `privilegioutilizador_ibfk_2` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`id`);

--
-- Limitadores para a tabela `vendeprodutos`
--
ALTER TABLE `vendeprodutos`
  ADD CONSTRAINT `vendeprodutos_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `utilizador` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vendeprodutos_ibfk_2` FOREIGN KEY (`Produto_ID`) REFERENCES `produtos` (`Produto_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
