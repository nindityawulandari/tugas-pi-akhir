<?php
include_once '../dbconfig.php';
if(!$user->is_loggedin())
{
 $user->redirect('../index.php');
}
$user_id = $_SESSION['user_session'];
$stmt = $DB_con->prepare("SELECT * FROM users WHERE user_id=:user_id");
$stmt->execute(array(":user_id"=>$user_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);
$mysqli=new mysqli ('localhost', 'root', '' ,'db_config');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"  />
<link rel="stylesheet" href="../style.css" type="text/css"  />
<title>welcome - <?php print($userRow['user_email']); ?></title>
</head>

<body>
<div class="header">
 <div class="left" >
     <label><a href="../../index.php">Eventpublication</a></label>
    </div>
    <div class="right">
     <label><a href="../logout.php?logout=true" ><i class="glyphicon glyphicon-log-out" ></i> logout</a></label>
    </div>
</div>
<div class="content">
welcome : <?php print($userRow['user_name']); ?>
</div>
<?php
  if (empty($_GET['menu'])) {
?>
<div class="container">
<a href="add-data.php" class="btn btn-large btn-info"><i class="glyphicon glyphicon-plus"></i>&nbsp;Tambah Data</a>
</div>
<div class="container">
  <div class="row">
  <div class="col-xs-12 col-md-12 col-md-offset-0">
     <?php $mysqli=new mysqli ('localhost', 'root', '' ,'db_config'); ?>
     <table class="table table-striped">
     <tr>
       <th>Judul</th>
       <th>Deskripsi</th>
       <th>Tempat</th>
       <th>Tanggal</th>
       <th>CP</th>
       <th>HTM</th>
       <th>image</th>
       <th colspan="2" align="center">Actions</th>
     </tr>
     <?php
             $sql = "SELECT * FROM posting";
              $result =mysqli_query($mysqli,$sql) or die(mysqli_eror());
              $no=1;
              while($row = mysqli_fetch_array($result)){
                  ?>
                  <tr>
                  <td><?php echo $row['judul'];?></td>
                  <td><?php echo $row['deskripsi'];?></td>
                  <td><?php echo $row['tempat'];?></td>
                  <td><?php $tanggal = $row['tanggal']; echo date("d F Y", strtotime($tanggal));?></td>
                  <td><?php echo $row['cp'];?></td>
                  <td>Rp <?php $harga=number_format($row['htm'],0,",","."); echo"$harga";?>,00
                  </td>
                  <td><?php echo $row['file'];?></td>
                  <td>
                    <a href="index.php?menu=hapus&id=<?php echo $row['id'];?>">Hapus</a> &nbsp 
                     <a href="index.php?menu=edit&id=<?php echo $row['id'];?>">edit</a>
                  </td>
                  </tr>
                  <?php
                $no++;
              }
              ?>
</table>
</div>
    
</div>
</div>
  <?php
  }else{
    switch ($_GET['menu']) {
      case 'hapus':
          $id = $_GET['id'];
          $query = "delete from posting where id='$id'";
          if( $mysqli->query($query) ){
              header("location:index.php");
          }
        break;
      case 'edit':
             ?>
             <div class="container"><?php
             $id=$_GET['id'];
             $sql="select * from posting where id='$id' ";
                        $result= mysqli_query($mysqli,$sql);
                        while ($hasil=mysqli_fetch_array($result)) { ?>
               <form method='post'  enctype="multipart/form-data">
             
                <table class='table table-bordered'>
                    <tr>

                        <td>Kategori</td>
                        <td><select name="kategori">
                        <?php
                        $id=$_GET['id'];
                        $sql="select * from kategori";
                        $result= mysqli_query($mysqli,$sql);
                        while ($row=mysqli_fetch_array($result)) {
                            ?>
                                <option value="<?php echo $row['kategori'] ?>"><?php echo $row['kategori'] ?></option>
                            <?php
                        }
                    ?>
                            
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Nama Gambar</td>
                        <td><input value="<?php echo $hasil['namagambar'] ?>" type='text' name='namagambar' class='form-control' required></td>
                    </tr>
                    <tr>
                        <td>Judul</td>
                        <td><input value="<?php echo $hasil['judul'] ?>" type='text' name='judul' class='form-control' required></td>
                    </tr>
             
                    <tr>
                        <td>Deskripsi</td>
                        <td><input value="<?php echo $hasil['deskripsi'] ?>" type='text' name='deskripsi' class='form-control' required></td>
                    </tr>
                    
                    <tr>
                        <td>Tanggal</td>
                        <td><input value="<?php echo $hasil['tanggal'] ?>"type='date' name='tanggal' class='form-control' required></td>
                    </tr>
             
                    <tr>
                        <td>Tempat</td>
                        <td><input value="<?php echo $hasil['tempat'] ?>"type='text' name='tempat' class='form-control' required></td>
                    </tr>

                    <tr>
                        <td>htm</td>
                        <td><input value="<?php echo $hasil['htm'] ?>" type='text' name='htm' class='form-control' required></td>
                    </tr>

                    <tr>
                        <td>Contact Person</td>
                        <td><input value="<?php echo $hasil['cp'] ?>" type='text' name='cp' class='form-control' required></td>
                    </tr>
             
                    <tr>
                        <td colspan="2">
                        <input type="file" name="gambar" /><br>
                        <button type="submit" class="btn btn-primary" name="update">
                        <span class="glyphicon glyphicon-plus"></span> ubah Data
                  </button>  
                        <a href="index.php" class="btn btn-large btn-success"><i class="glyphicon glyphicon-backward"></i> &nbsp; Kembali</a>
                        </td>
                    </tr><?php }?>
             
                </table>
            </form>
            <?php
            if(isset($_POST['update']))
                {
                  $kategori = $_POST['kategori'];
                    $namagambar = $_POST['namagambar'];
                    $judul = $_POST['judul'];
                  $deskripsi = $_POST['deskripsi'];
                  $tanggal = $_POST['tanggal'];
                    $tempat = $_POST['tempat'];
                    $htm = $_POST['htm'];
                  $cp = $_POST['cp'];
                  $by = date("d");
                    $file = $_FILES['gambar']['name'];
                    $file_loc = $_FILES['gambar']['tmp_name'];
                    $folder = "foto/$file";

                    if (move_uploaded_file($file_loc, "$folder")){

                        $query = "update posting set kategori='$kategori',namagambar='$namagambar', post_by='$by', judul = '$judul', deskripsi= '$deskripsi', tanggal = '$tanggal' ,tempat = '$tempat' , htm = '$htm' , cp ='$cp' , created_at = '$tanggal', file = '$file'  where id='$id'";
                        mysqli_query($mysqli,$query);
                        header("location:../../index.php");
                        

                    }
                    else {echo "gagal";}
                /*
                  if($crud->create($judul,$deskripsi,$tanggal,$tempat,$htm,$cp, $file, $file_loc))
                  {
                    header("Location: add-data.php?inserted");
                  }
                  else
                  {
                    header("Location: add-data.php?failure");
                  }
                  */  
                }
            ?>     
                 
          <?php  

        break;

      default:
        
        break;
    }
  }?>
</body>
</html>