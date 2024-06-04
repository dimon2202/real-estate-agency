<?php 
$hostname = "localhost"; 
$username = "root"; 
$passwordbd = "root"; 
$dbName = "estateagencydb"; 
/*Змінні для зєднання з БД */ 
/* зєднатися */ 

$link = mysqli_connect($hostname,$username,$passwordbd,$dbName);

if (!$link) {
    echo "Помилка: Неможливо встановити зєєднання з MySQL." . PHP_EOL;
    echo "Код помилки errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Текст помилки error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

?>