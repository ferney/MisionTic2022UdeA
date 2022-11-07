<?php
	include "db.php";
	$data = array();
	if($_POST['seleccionar']){
		$id = $_POST['id'];
		$sql = "SELECT * FROM item WHERE id= $id";
		$ejecutar = $con->query($sql);
		
		while ($row = mysqli_fetch_object($ejecutar)){
		 $data[]=$row;
		}
		echo json_encode($data);
	}
	
?>