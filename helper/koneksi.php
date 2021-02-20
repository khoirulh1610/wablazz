<?php

$host = "localhost";
$username = "root";
$password = "@Admin@123";
$db = "wa_anto";

$koneksi = mysqli_connect($host, $username, $password, $db) or die("GAGAL");

$base_url = "http://localhost:8090/";
date_default_timezone_set('Asia/Jakarta');
