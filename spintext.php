<?php
include_once("helper/function.php");

?>
<html>
<body>
<h1>Input kalimat</h1>
    <form action="" method="post">
        <textarea name="kalimat" id="" cols="30" rows="10"><?php echo isset($_POST['kalimat'])?$_POST['kalimat']:'';?></textarea>
        <button type="submit">Cek</button>
    </form>
    <?php
    if(isset($_POST['kalimat'])){
        $kalimat = $_POST['kalimat'];
    ?>
    <br>
    <h1>Hasil</h1>
    <textarea name="hasil" id="hasil" cols="30" rows="10">
        <?= SpinText($kalimat) ;?>
    </textarea>
    <?php } ?>

</body>
</html>