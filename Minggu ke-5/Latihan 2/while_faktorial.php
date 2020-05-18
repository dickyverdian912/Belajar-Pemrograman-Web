<!DOCTYPE html>
<html>
<head>
<title>Faktorial – While </title>
</head>
<br>
<body>
	<form name="faktorial_while" method="post">
	<table>
		<tr>
			<td>Masukkan Suatu Bilangan Bulat Positif : </td>
			<td><input type="text" name="Angka" size="5"/></td><br>
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
					$i=1;
					while($i<=5)
					{
						$i=$i+1;  
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