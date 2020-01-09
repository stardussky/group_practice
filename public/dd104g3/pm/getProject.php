<?php
  try{
    require_once('../pdo.php');
    $sql = 'select c.card_no, c.pro_no, card_name, card_date, card_type, card_sta, t.todo_no, todo_title, file_no, file_name, file_src, todo_cont_no, todo_cont, todo_cont_sta, todo_cont_clock, todo_timer from `card` c
    LEFT JOIN `todo` t on c.pro_no = t.pro_no AND c.card_no = t.card_no LEFT JOIN `card_file` f on f.pro_no = c.pro_no AND f.card_no = c.card_no LEFT JOIN `todo_content` tc on tc.pro_no = c.pro_no AND tc.todo_no = t.todo_no 
    WHERE c.pro_no = :pro_no';
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
          'content'=>array(
            [
              'title'=>$card['todo_title'],
              'id'=>$card['todo_no'],
              'lists'=>array([
                'content'=>$card['todo_cont'],
                'id'=>$card['todo_cont_no'],
                'status'=>$card['todo_cont_sta'] ? true:  false,
                'isClock'=>$card['todo_cont_clock'] ? true:  false,
                'timer'=>$card['todo_timer']
              ])
            ]
          ),
          'deadLine'=>"未設定",
          'files'=>array([
            'id'=>$card['file_no'],
            'name'=>$card['file_name'],
            'src'=>$card['file_src']
          ]),
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