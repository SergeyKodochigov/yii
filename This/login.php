<?php
require_once ('MysqliDb.php');
$db = new MysqliDb ('localhost', 'root', 'root', 'quick');


$data = Array ("name" => $_POST['name'],
               "pass" => md5($_POST['pas'])
);
$id = $db->insert ('users', $data);
if($id)
    echo 'user was created. Id=' . $id;

