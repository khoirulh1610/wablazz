<?php
include_once("helper/koneksi.php");
include_once("helper/function.php");


$login = cekSession();
if($login == 0){
    redirect("login.php");
}

if($_SESSION['level'] != 1){
    echo "Tidak diizinkan akses halaman ini";
    exit;
}

if(post("username")){
    $u = post("username");
    $p = sha1(post("password"));
    $l = post("level");

    $count = countDB("account", "username", $u);

    if($count == 0){
        $q = mysqli_query($koneksi, "INSERT INTO account(`username`, `password`, `level`)
        VALUES('$u', '$p', '$l')");
        toastr_set("success", "Sukses membuat user");
    }else{
        toastr_set("error", "Username telah terpakai");
    }

}

if(get("act") == "hapus"){
    $id = get("id");

    $q = mysqli_query($koneksi, "DELETE FROM account WHERE id='$id'");
    toastr_set("success", "Sukses hapus user");
}

if(post("chunk")){
    $chunk = post("chunk");
    $wa = post("wa");
    $api_key = post("api_key");
    $nomor = post("nomor");
    mysqli_query($koneksi, "UPDATE pengaturan SET chunk = '$chunk', wa_gateway_url = '$wa', api_key='$api_key', nomor='$nomor' WHERE id='1'");
    toastr_set("success", "Sukses edit pengaturan");
}

if(get("act") == "gapi"){
    $api_key = sha1(date("Y-m-d H:i:s").rand(100000, 999999));
    mysqli_query($koneksi, "UPDATE pengaturan SET api_key='$api_key' WHERE id='1'");
    toastr_set("success", "Sukses generate api key baru");
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Wa Blast - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Wa Blast</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.php">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="waweb/index.php" target="_blank">
                    <i class="fab fa-whatsapp"></i>
                    Whatsapp Web <span class="badge badge-success" style="font-size:50%">NEW</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="auto_reply.php">
                    <i class="fas fa-reply-all"></i>
                    Auto-reply <span class="badge badge-success" style="font-size:50%">NEW</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="nomor.php">
                    <i class="fas fa-fw fa-phone-alt"></i>
                    <span>Data Nomor</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="kirim.php">
                    <i class="fas fa-fw fa-comments"></i>
                    <span>Kirim Masal</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="tes_kirim.php">
                    <i class="fas fa-fw fa-comment-alt"></i>
                    <span>Tes Kirim</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="rest_api.php">
                    <i class="fas fa-fw fa-code"></i>
                    <span>Rest API</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="pengaturan.php">
                    <i class="fas fa-fw fa-cogs"></i>
                    <span>Pengaturan</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                        </li>


                        <!-- Nav Item - Messages -->

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= $_SESSION['username'] ?></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="logout.php" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="row">
                        <div class="col-md-6">
                        <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModal">
                            Tambah User
                        </button>
                        <br>
                        <div class="card shadow mb-4">

                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Data User</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Level</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $q = mysqli_query($koneksi, "SELECT * FROM account");
                                            while($row = mysqli_fetch_assoc($q)){
                                                echo '<tr>';
                                                echo '<td>'.$row['id'].'</td>';
                                                echo '<td>'.$row['username'].'</td>';
                                                if($row['level'] == 1){
                                                    echo '<td>Admin</td>';
                                                }else{
                                                    echo '<td>CS</td>';
                                                }
                                                echo '<td><a class="btn btn-danger" href="pengaturan.php?act=hapus&id='.$row['id'].'">Hapus</a></td>';
                                                echo '</tr>';
                                            }

                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        </div>

                        <div class="col-md-6">
                        <div class="card shadow mb-4">

                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pengaturan</h6>
                            </div>
                            <div class="card-body">
                                <h4> Whatsapp Gateway : <span id="status"></span> </h4>
                                <h4><span id="qr"></span> </h4>
                                <a class="btn btn-danger btn-block" target="_blank" href="<?= url_wa() ?>/deletesess"> Logout </a>
                                <a class="btn btn-danger btn-block" target="_blank" href="<?= url_wa() ?>/reset"> Reset</a>
                                <br>
                                <hr>
                                <form action="" method="post">
                                    <label> URL Whatsapp Gateway </label>
                                    <input type="text" class="form-control" name="wa" value="<?= url_wa() ?>">
                                    <br>
                                    <label> Nomor Whatsapp Yang Terkoneksi </label>
                                    <input type="text" class="form-control" name="nomor" value="<?= getSingleValDB("pengaturan", "id", "1", "nomor") ?>">
                                    <br>
                                    <label> Batas Pengiriman per menit </label>
                                    <input type="text" class="form-control" name="chunk" value="<?= getSingleValDB("pengaturan", "id", "1", "chunk") ?>">
                                    <br>
                                    <label> API Key </label>
                                    <input type="text" class="form-control" name="api_key" readonly value="<?= getSingleValDB("pengaturan", "id", "1", "api_key") ?>">
                                    <br>
                                    <button class="btn btn-success"> Simpan </button>
                                    <a class="btn btn-primary" href="pengaturan.php?act=gapi"> Generate New API Key </a>
                                </form>
                            </div>
                        </div>

                        </div>
                    </div>


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; DVLPR 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout.php">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Tambah User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form action="" method="POST">
                <label> Username </label>
                <input type="text" name="username" required class="form-control">
                <br>
                <label> Password </label>
                <input type="password" name="password" required class="form-control">
                <br>
                <label for="exampleFormControlSelect1">Level</label>
                <select class="form-control" id="exampleFormControlSelect1" name="level">
                    <option value="1">Admin</option>
                    <option value="2">CS</option>
                </select>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Simpan</button>
            </form>
        </div>
        </div>
    </div>
    </div>

<!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous"></script>
    <script>
        <?php

        toastr_show();

        ?>
    </script>
    <script src="https://cdn.jsdelivr.net/npm/davidshimjs-qrcodejs@0.0.2/qrcode.min.js"></script>
    <script>
        getWaStatus();
        setInterval(getWaStatus, 3000);
        function getWaStatus(){
            $.get( "/status.php", function( data ) {
                console.log(data);
                if(data.msg == "READY"){
                    $("#status").html('<span class="badge badge-success">READY</span>');
                    $("#qr").empty();
                }else{
                    $("#status").html('<span class="badge badge-danger">NOT READY, PLEASE SCAN QR CODE</span>');
                    getAndShowQR();
                }
            });
        }

        function getAndShowQR(){
            $.get( "<?= url_wa() ?>/qr", function( data ) {
                if(data.data.qr){
                  $("#qr").empty();
                  new QRCode(document.getElementById("qr"), data.data.qr);
                }
            });
        }
    </script>
</body>
</html>
