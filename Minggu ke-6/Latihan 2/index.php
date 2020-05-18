<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<table border=3>
    <form action="proses.php" method="post">
        <tr>
			<td><label>NIM:</label></td>
			<td><input type="text" name="nim"></td>
		</tr>
		<br>
		<tr>
			<td><label>Program Studi</label></td>
			<td><select name="prodi">
				<option value="Teknik Informatika S1">Teknik Informatika S1</option>
				<option value="Sistem Informasi S1">Sistem Informasi S1</option>
				<option value="Teknik Informatika D3">Teknik Informatika D3</option>
			</select></td>
		</tr>
		<br>
		<tr>
			<td><label>Nilai Tugas:</label></td>
			<td><input type="text" name="nilai_tugas"></td>
		</tr>
		<br>
		<tr>
			<td><label>Nilai UTS:</label></td>
			<td><input type="text" name="nilai_uts"></td>
		</tr>
		<br>
		<tr>
			<td><label>Nilai UAS:</label></td>
			<td><input type="text" name="nilai_uas"></td>
		</tr>
		<br>
		<tr>
			<td><label>Catatan Khusus</label></td>
			<td><div>
				<p><input type="checkbox" name="catatan[]" value="Kehadiran >= 70%" />Kehadiran >= 70%</p>
				<p><input type="checkbox" name="catatan[]" value="Interaktif di kelas" />Interaktif Di Kelas</p>
				<p><input type="checkbox" name="catatan[]" value="Tidak Terlambat Mengumpulkan Tugas" />Tidak Terlambat Mengumpulkan Tugas</p>
			</div></td>
		</tr>
		<tr>
        <td><button type="submit" name="kirim">Submit</button></td>
		</tr>
    </form>
</table>
</body>

</html>