<?php 
session_start(); 

if ($_SESSION['user']) {
    header('Location: /');
}
?>
<form action="" method="post">
<input type="text" name="name">
<input type="text" name="pas">
<input type="submit" >
</form>

<?php
require_once ('MysqliDb.php');
$db = new MysqliDb ('localhost', 'root', 'root', 'quick');


$db->where ('name', $_POST['name']);
$results = $db->get ('users');


if ($results[0]['pass'] == md5($_POST['pas'])) {
    $_SESSION['user'] = $results[0]['id'];
    echo 'location.href("http://newcoder.ru/cat/web/");';
} else {
  
}