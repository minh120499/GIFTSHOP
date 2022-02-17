<?php
class Database {
    function connect(){
        try{
            $connect=new PDO("mysql:host=localhost;dbname=giftshop","root","");
            return $connect;
        }catch (PDOException $a){
            echo "Errors : ".$a->getMessage();
        }
    }
}
