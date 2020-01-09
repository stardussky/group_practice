<?php
  try{
    require_once('../pdo.php');
    $sql = 'select * from `card` where pro_no = :pro_no';
    $res = $pdo->prepare($sql);
    $res->bindParam(':pro_no', $_POST['pro_no']);
    $res->execute();
    if($res->rowCount()){
      $cards = $res->fetchAll(PDO::FETCH_ASSOC);
      $step0 = array();
      $step1 = array();
      $step2 = array();
      foreach($cards as $card){
        $info = [
          'content'=>array(),
          'deadLine'=>"未設定",
          'files'=>array(),
          'id'=>$card['card_no'],
          'status'=>$card['card_sta'] ? true:  false,
          'title'=>$card['card_name']
        ];
        switch ($card['card_type']){
          case '0':
            $step0[] = $info;
            break;
          case '1':
            $step1[] = $info;
            break;
          default;
            $step2[] = $info;
        }
      }
      echo json_encode(['status'=>'success', 'data'=>array($step0, $step1, $step2)]);
    }else {
      echo json_encode(['status'=>'error', 'content'=>'沒有資料']);
    }
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }