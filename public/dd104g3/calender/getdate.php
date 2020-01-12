<?php
  try{
    require_once('../pdo.php');
    $sql = "select * FROM `card` c LEFT JOIN `member` m on (m.mem_no = 1) 
    WHERE TO_DAYS(now()) - TO_DAYS(card_date) <= 7";
  }catch(PDOException $e){
    echo $e->getLine();
    echo $e->getMessage();
  }