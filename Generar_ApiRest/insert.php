<?php
	include "db.php";
	if(isset($_POST['insert'])){
		 $nombre = $_POST['nombre'];
		 $autor = $_POST['autor'];
		 $precio = $_POST['precio'];		
		 $sql="INSERT INTO libro VALUES('','$nombre','$autor','$precio')";	 		 
		 $ejecutar = $con->query($sql);
		 if($ejecutar){
			echo "Correcto";
		 }else{
			echo "Error";
		 }
	 }
 ?>