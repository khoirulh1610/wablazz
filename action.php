<?php
include_once("helper/koneksi.php");
include_once("helper/function.php");
$msg = $_GET['msg'];
switch($msg){
    case 'lisensi_show':
        $user_id = $_POST['user_id'];
        $tgl = date('Y-m-d H:i:s');
        $license = generate_license('LISENSI');
        $cek = mysqli_query($koneksi,"Select *from lisensi where end_date < '$tgl' and user_id='$user_id'");
        if(mysqli_num_rows($cek) == 0){
            echo "
                <label>Serial Number :</label>
                <input type='text' class='form-control' readonly name='serial' value='$license' id='serial'/>
                <br/>
                <label>Tanggal aktif :</label>
                <input type='date' name='start_date' class='form-control' required id='start_date'/>
                <br/>
                <label>Tanggal berakhir :</label>
                <input type='date' name='end_date' class='form-control' required id='end_date'/>
                <br/>
            ";
        }else{
            $data = mysqli_fetch_object($cek);
            echo "<label>Serial Number :</label>
            <input type='text' class='form-control'  name='serial' id='serial' value='$data->serial'/>
            <br/>
            <label>Tanggal aktif :</label>
            <input type='date' name='start_date' class='form-control' id='start_date'   value='$data->start_date'/>
            <br/>
            <label>Tanggal berakhir :</label>
            <input type='date' name='end_date' class='form-control' id='end_date'  value='$data->end_date'/>
            <br/>";
        }
    break;

    case 'lisensi_insert':
        $user_id = $_POST['user_id'];
        $serial = $_POST['serial'];
        $start_date = $_POST['start_date'];
        $end_date = $_POST['end_date'];
        $cek = mysqli_query($koneksi,"Select *from lisensi where user_id='$user_id'");
        if(mysqli_num_rows($cek) > 0){
            $query = mysqli_query($koneksi,"update lisensi set serial='$serial', start_date='$start_date',end_date='$end_date',addtime=now() where user_id='$user_id'");
        }else{
            $query = mysqli_query($koneksi,"insert into lisensi values('','$user_id','$serial','$start_date','$end_date',now())");
        }
        if($query==true){
            echo "sukses";
        }else{
            echo "gagal";
        }
    break;
}   
?>