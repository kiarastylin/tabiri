<?php
include "../../config/dbconfig.php";

// Sanitize input
$email = sanitizeInput(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_FULL_SPECIAL_CHARS));
$password = sanitizeInput(filter_input(INPUT_POST, 'password', FILTER_SANITIZE_FULL_SPECIAL_CHARS));

// Prepare SQL statement
$query = $pdo->prepare("SELECT * FROM users WHERE email = :email");
$query->execute(array(':email' => $email));

// Check if user exists
if ($query->rowCount() > 0) {
  $rows = $query->fetch(PDO::FETCH_ASSOC);
  
  // Verify password
  if (password_verify($password, $rows['password'])) {
      echo json_encode('success');
  } else {
    echo json_encode("wrong");
  }
} else {
  echo json_encode("wrong");
}
?>
