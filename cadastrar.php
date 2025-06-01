<?php
// cadastrar.php
require_once 'plataforma_educacional_stp';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['name'] ?? 'nome';
    $email = $_POST['e-mail'] ?? '';
    $telefone = $_POST['phone'] ?? '';
    $senha = $_POST['password'] ?? '';
    $confirmaSenha = $_POST['confirm_password'] ?? '';

    // Verificação de campos obrigatórios
    if (empty($nome) || empty($email) || empty($telefone) || empty($senha) || empty($confirmaSenha)) {
        die("Por favor, preencha todos os campos.");
    }

    if ($senha !== $confirmaSenha) {
        die("As senhas não coincidem.");
    }

    // Verifica se o e-mail já está cadastrado
    $stmt = $pdo->prepare("SELECT id FROM usuarios WHERE email = ?");
    $stmt->execute([$email]);

    if ($stmt->rowCount() > 0) {
        die("Este e-mail já está cadastrado.");
    }

    // Criptografa a senha
    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

    // Insere o novo usuário
    $stmt = $pdo->prepare("INSERT INTO usuarios (nome, email, telefone, senha) VALUES (?, ?, ?, ?)");
    $sucesso = $stmt->execute([$nome, $email, $telefone, $senhaHash]);

    if ($sucesso) {
        header("Location: login.php");
        exit();
    } else {
        die("Erro ao cadastrar. Tente novamente.");
    }
}
?>
