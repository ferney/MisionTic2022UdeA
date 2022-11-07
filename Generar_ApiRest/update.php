<?php
	include "db.php";
	if(isset($_POST['update']))
	{
		$id = $_POST['id'];
		$nombre = $_POST['nombre'];
		$autor = $_POST['autor'];
		$precio = $_POST['precio'];


		$sql="UPDATE libro SET nombre='$nombre', autor='$autor', precio=$precio where id='$id'";
		$ejecutar = $con->query($sql);
		if($ejecutar){
			echo "Correcto";
		}else{
			echo "Error";
		}
	}
?>