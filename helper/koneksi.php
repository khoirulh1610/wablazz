<?php

$host = "localhost";
$username = "root";
$password = "";
$db = "wablass";
$koneksi = mysqli_connect($host, $username, $password, $db) or die("GAGAL");

$base_url = "http://localhost:8080/";
date_default_timezone_set('Asia/Jakarta');
