define('HOST','localhost');
define('USER','root');
define('PASS','');
define('DB','rest_api');
$conn = new mysqli(HOST,USER,PASS,DB) or die('Connetion error to the database');