<?php 
	include 'koneksi.php';

	$username = $_POST['username'];
	$password = $_POST['password'];

	if(!empty($username) && !empty($password)) {
		$sql = mysqli_query($connect,"select * from tb_user where username='$username' and password='$password'");
		$result = mysqli_num_rows($sql);
		if ($result) {
			echo "Anda berhasil masuk!!";
			echo "Klik <a href='main-menu.php'>disini</a> untuk masuk ke Menu Utama";
		} else {
			echo "Username dan Password salah";
		}
	}
?>