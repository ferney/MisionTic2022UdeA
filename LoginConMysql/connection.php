<?php

    $host = "localhost";//HOSTING
    $user = "id7264914_root"; //USUARIO
    $pw = "90100100"; //PASWORD GENERADA EN 000WEBHOTS
    $db = "id7264914_FLUTTER"; //BASE DE DATOS
   
    // Variables de la conexion a la DB
    $mysqli = new mysqli($host,$user,$pw,$db);
    
    // Comprobamos la conexion primeramente para saber si esta mal, el error primero
    if($mysqli->connect_errno) {
        die("Fallo la conexion");
    } else {
      //por si todo esta bien
        echo "Conexion exitosa";
    }
    
    ?>
