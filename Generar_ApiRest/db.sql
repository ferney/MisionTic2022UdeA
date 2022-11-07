create database example;
	use example;

CREATE TABLE usuario (
`id` int(1) NOT NULL,
 `Nombres` varchar(25) NOT NULL,
 `Apellidos` varchar(50) NOT NULL,
 `fecha_nac` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



ALTER TABLE `usuario` ADD PRIMARY KEY (`id`);
ALTER TABLE `usuario` MODIFY `id` int(1) NOT NULL AUTO_INCREMENT;



CREATE TABLE libro(
	id int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(50),
	autor varchar(50),
	precio int
	//descripcion varchar(100) => puede ir una descripción extensa de algo
	//imagen varchar(50) => aqui puede ir una url de la imagen
)
