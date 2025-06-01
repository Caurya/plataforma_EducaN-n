
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS plataforma_educacional_stp;
USE plataforma_educacional_stp;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('aluno', 'professor', 'administrador') NOT NULL DEFAULT 'aluno',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de recursos educacionais
CREATE TABLE IF NOT EXISTS recursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    arquivo_url VARCHAR(255),
    autor_id INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES usuarios(id)
);

-- Tabela de acessos
CREATE TABLE IF NOT EXISTS acessos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de pedidos de certidão de habilitação
CREATE TABLE IF NOT EXISTS pedidos_certidao de habilitacao(
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    numero_bi VARCHAR(20),
    email VARCHAR(100),
    telefone VARCHAR(20),
    tipo_certidao VARCHAR(50),
    escola VARCHAR(100),
    classe VARCHAR(20),
    turma VARCHAR(20),
    numero VARCHAR(20),
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'em análise', 'aprovado', 'recusado') DEFAULT 'pendente',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de logs de segurança
CREATE TABLE IF NOT EXISTS logs_seguranca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(100),
    ip_origem VARCHAR(45),
    navegador VARCHAR(255),
    sistema_operacional VARCHAR(100),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de tentativas de login
CREATE TABLE IF NOT EXISTS tentativas_login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email_tentado VARCHAR(100),
    ip_origem VARCHAR(45),
    navegador VARCHAR(255),
    sucesso BOOLEAN,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de tokens de recuperação de senha
CREATE TABLE IF NOT EXISTS tokens_recuperacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    token VARCHAR(255),
    expiracao DATETIME,
    usado BOOLEAN DEFAULT FALSE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
