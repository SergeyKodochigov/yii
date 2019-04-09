<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: content-type');
 ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
</head>
<body class="container">
<?php if (!$_SESSION['user']) {?>
<form action="login.php" method="post">
<input type="text" name="name"/>
<input type="text" name="pas"/>
<input type="submit"/>
</form> 

<?php  exit; } ?>
<p class="lead">Добро пожаловать в чат!</p>

<form id="publish" class="form-inline">
  <input type="text" name="message"/>
  <input type="submit" class="btn btn-primary" value="Отправить"/>
</form>

<ul id="messages"></ul>

<script>
  publish.onsubmit = function() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "//quicker.local:3000/publish", true);
    xhr.send(JSON.stringify({message: this.elements.message.value}));
    console.log(this.elements.message.value);
    this.elements.message.value = '';
    return false;
  };
  subscribe();
  function subscribe() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "//quicker.local:3000/subscribe", true);
    xhr.onreadystatechange = function() {
      if (this.readyState != 4) return;
      if (this.status != 200) {
        setTimeout(subscribe, 500);
        return;
      }
      var li = document.createElement('li');
      li.appendChild(document.createTextNode(this.responseText));
      messages.appendChild(li);
      subscribe();
    };
    xhr.send(null);
  }
</script>
</body>
</html>