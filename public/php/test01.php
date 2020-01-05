<?php
  try{
    $dsn = 'mysql:host=localhost;post=3306;dbname=dd104g3;charset=utf8';
    $option = array([PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]);
    $pdo = new PDO($dsn, 'root', 'T1901166');
    echo $_POST['test'];
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }