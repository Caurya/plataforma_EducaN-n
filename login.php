<?php
// Conexão com o banco de dados
$host = "localhost";
$usuario = "root";
$senha_db = "nota1997";
$banco = "# Database
'plataforma_educacional_stp'
";

// Criar conexão
$conn = new mysqli($host, $usuario, $senha_db, $banco);

// Verificar conexão
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receber os dados do formulário
    $email = $_POST['E-mail'];
    $senha = $_POST['senha'];

    // Consulta ao banco (simples – sem segurança ainda)
    $sql = "SELECT * FROM usuarios WHERE email = '$email' AND senha = '$senha'";
    $resultado = $conn->query($sql);

    if ($resultado->num_rows == 1) {
        // Login correto – redirecionar para página inicial
        header("Location: pagina_inicial.html");
        exit();
    } else {
        // Login incorreto – alertar e voltar para login
        echo "<script>alert('E-mail ou senha incorretos!'); window.location.href = 'index.html';</script>";
        exit();
    }
}

// Fechar conexão
$conn->close();
?>

