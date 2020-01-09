<?php
  try{
    require_once('../pdo.php');
    $sql = 'insert into `card` (pro_no, card_name) values (:pro_no, :card_name)';
    $res = $pdo->prepare($sql);
    $res->bindParam(':pro_no', $_POST['pro_no']);
    $res->bindParam(':card_name', $_POST['card_name']);
    $res->execute();
    echo json_encode(['status'=>'success', 'content'=>'新建成功']);
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }