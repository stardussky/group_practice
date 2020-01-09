<?php
  try{
    require_once('../pdo.php');
    $jsonData = json_decode(file_get_contents('php://input'), true);
    $pro_no = $jsonData['projectId'];
    $data = $jsonData['card'];
    $cardDate = $data['deadLine']=='未設定' ? null : $data['deadLine'];
    $cardStatus = $data['status'] ? '1' : '0';
    $sql = 'insert into `card` (pro_no, card_name, card_date, card_sta) values (:pro_no, :card_name, :card_date, :card_sta)';
    $res = $pdo->prepare($sql);
    $res->bindParam(':pro_no', $pro_no);
    $res->bindParam(':card_name', $data['title']);
    $res->bindParam(':card_date', $cardDate);
    $res->bindParam(':card_sta', $cardStatus);
    $res->execute();
    if($data['content']){
      foreach($data['content'] as $info){
        $sql = 'insert into `todo` (card_no, pro_no, todo_title) values (:card_no, :pro_no, :todo_title)';
        $res = $pdo->prepare($sql);
        $insert_id = $pdo->lastInsertId();
        $res->bindParam(':card_no', $insert_id);
        $res->bindParam(':pro_no', $pro_no);
        $res->bindParam(':todo_title', $info['title']);
        $res->execute();
        // if($info['lists']){
        //   $listStatus = $list['status'] ? '1' : '0';
        //   foreach($data['lists'] as $list){
        //     $sql = 'insert into `todo_content` (todo_no, todo_cont, todo_cont_sta) values (:todo_no, :todo_cont, :todo_cont_sta)';
        //     $res = $pdo->prepare($sql);
        //     $res->bindParam(':todo_no', $info['id']);
        //     $res->bindParam(':todo_cont', $list['content']);
        //     $res->bindParam(':todo_cont_sta', $listStatus);
        //     $res->execute();
        //   }
        // }
      }
    }
    // echo json_encode(['status'=>'success', 'content'=>'新建成功']);
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }