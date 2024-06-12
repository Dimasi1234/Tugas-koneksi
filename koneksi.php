<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uts_312310221";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
echo "Koneksi berhasil";
?>
