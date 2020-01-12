<?php
  session_start();
  require_once('../pdo.php');
  if(isset($_SESSION['mem_no'])){
    $sql = "select `AUTO_INCREMENT`, `TABLE_NAME` FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_SCHEMA = 'dd104g3' AND (TABLE_NAME = 'program' OR TABLE_NAME = 'card')";
    $autoInc = $pdo->prepare($sql);
    $autoInc->execute();
    $id = [];
    foreach($autoInc->fetchAll(PDO::FETCH_ASSOC) as $info){
      $id[]=[$info['TABLE_NAME']=>$info['AUTO_INCREMENT']];
    }

    $member = array(
      'mem_no'=>$_SESSION['mem_no'], 'mem_id'=>$_SESSION['mem_id'], 
      'mem_psw'=>$_SESSION['mem_psw'], 'ring_no'=>$_SESSION['ring_no'], 
      'mem_name'=>$_SESSION['mem_name'], 'mem_email'=>$_SESSION['mem_email'],
      'headshot'=>$_SESSION['headshot'], 'mem_addr'=>$_SESSION['mem_addr'],
      'mem_tel'=>$_SESSION['mem_tel'], 'mem_status'=>$_SESSION['mem_status'],
    );
    echo json_encode(['status'=>'success', 'data'=>['user'=>$member, 'id'=>$id]]);
  }else {
    echo json_encode(['status'=>'error', 'content'=>'尚未登入']);
  }