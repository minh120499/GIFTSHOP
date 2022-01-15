<?php
class Database {
    private $dbname;
    private $ps;
    private $username;
    private $servername;

    function __construct($dbname = 'GIFTSHOP', $ps = '', $username = 'root', $servername = 'localhost')
    {
        $this->dbname = $dbname;
        $this->ps = $ps;
        $this->username = $username;
        $this->servername = $servername;
    }
    function connect(){
        try {
            $cnn = new PDO("mysql:host=$this->servername;dbname=$this->dbname","$this->username","$this->ps");
            return $cnn;
        } catch (PDOException $e) {
            echo "Connect false " . $e->getMessage();
        }
    }
}

$db = new Database();
$conn = $db->connect();
