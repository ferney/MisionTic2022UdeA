<?php
    
    // Variables de la conexion a la DB
    $mysqli = new mysqli("localhost/url","usuario","contraseña","nombre de la base de datos");
    
    // Comprobamos la conexion primeramente para saber si esta mal, el error primero
    if($mysqli->connect_errno) {
        die("Fallo la conexion");
    } else {
      //por si todo esta bien
        echo "Conexion exitosa";
    }
    
    ?>
