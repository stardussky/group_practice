<?php
  try{
    require_once('../pdo.php');
    $sql = 'select * from `member` where mem_id = :mem_id && mem_psw = :mem_psw';
    $res = $pdo->prepare($sql);
    $res->bindParam(':mem_id', $_POST['mem_id']);
    $res->bindParam(':mem_psw', $_POST['mem_psw']);
    $res->execute();

    $sql = "select `AUTO_INCREMENT`, `TABLE_NAME` FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dd104g3' AND (TABLE_NAME = 'program' OR TABLE_NAME = 'card')";
    $autoInc = $pdo->prepare($sql);
    $autoInc->execute();

    if($res->rowCount()){
      $member = $res->fetchObject();
      $id = [];
      foreach($autoInc->fetchAll(PDO::FETCH_ASSOC) as $info){
        $id[]=[$info['TABLE_NAME']=>$info['AUTO_INCREMENT']];
      }
      echo json_encode([
        'status'=>'success', 
        'content'=>'登入成功', 
        'data'=>['user'=>$member, 'id'=>$id]
      ]);
      session_start();
      foreach($member as $key=>$info){
        $_SESSION[$key] = $info;
      }
    }else {
      echo json_encode(['status'=>'error', 'content'=>'帳號或密碼錯誤']);
    }
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }