<?php

    require "conexion.php";
    
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];
    
   //realizamos el select a la base de datos, si no hay coincidencia nos asigna 0 al a variable $sql y asi la llevamos al if  
    $sql = "SELECT * FROM usuarios WHERE usuario='$usuario' AND contrasena='$contrasena'";
    $query = $mysqli->query($sql);
    //esto es lo que se devuelve a la pantalla de flutter, si es correcto o no es correcto
    //if(response.body == "CORRECTO") {
   //     Toast.show(
  //       "LOGIN CORRECTO",
    if($query->num_rows > 0) {
        echo "CORRECTO";
    } else {
        echo "ERROR";
    }
    
?>
