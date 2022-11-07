<?php
	 include "db.php";
	 if(isset($_GET['id'])){
		 $id=$_GET['id'];

		 $sql="DELETE FROM libro where id='$id'";
		 $ejecutar = $con->query($sql);
			if($ejecutar){
				echo "Correcto";
			}else{
				echo "Error";
			}
	 }
 ?>