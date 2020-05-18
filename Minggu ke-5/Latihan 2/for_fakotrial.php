<!DOCTYPE html>
<html>
<head>
<title> Faktorial For </title>
</head>
<br>
<body>
	<form name="faktorial_for" method="post">
	<table>
		<tr>
			<td>Masukkan Suatu Bilangan Bulat Positif : </td>
			<td><input type="text" name="Angka" size="5"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="hasil" value="Hasil"/></td>
		</tr>
	</table>
	<?php
	error_reporting(0);
	if($_POST['hasil']!=''){
		$angka=$_POST['Angka'];
			   
		function faktorial($angka){
		if($angka<=1){
			$hasil=1;
			return $hasil; 
		}elseif($angka>1){
			for($i=1; $i<=$angka; $i++){
				$hasil=$angka * faktorial($angka-1);
			}
				return $hasil;
			}
		}
		echo "<br><br>";
	    echo "Hasil Faktorial dari "." ".$angka." "."adalah "." ".faktorial($angka);
	}
	?>
	</form>
</body>
</html>

