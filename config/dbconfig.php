<?php
require_once __DIR__ . '../../vendor/autoload.php';
// Load environment variables from .env file
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
// if (!is_readable(__DIR__ . '../../.env')) {
//     die("Error: .env file is not readable.");
// }
$dotenv->load();

// Set database credentials from environment variables
$dbHost = 'localhost';
$dbName = 'u750269652_tabiri';
$dbUser = 'u750269652_tabiri';
$dbPass = 'Tabiri@2023';

try {
  // Create PDO instance with prepared statement emulation
  $pdo = new PDO("mysql:host=$dbHost;dbname=$dbName;charset=utf8mb4", $dbUser, $dbPass, array(
    PDO::ATTR_EMULATE_PREPARES => false,
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
  ));

  // Set character set to utf8mb4
  $pdo->exec("SET NAMES 'utf8mb4'");
} catch (PDOException $e) {
  // Handle errors
  die("Database connection failed: " . $e->getMessage());
}

// Define function to sanitize input
function sanitizeInput($input) {
  if (is_array($input)) {
    // Sanitize array recursively
    return array_map('sanitizeInput', $input);
  } else {
    // Sanitize string
    $input = trim($input);
    $input = stripslashes($input);
    $input = htmlspecialchars($input, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    return $input;
  }
}

?>
