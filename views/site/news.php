<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Новости';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
<?php foreach ($model as $news):?>
<div class="news">
    <div class="news_label"><?=$news['name']?></div>
    <div class="news_content"><?=$news['content']?></div>
</div>
<?php endforeach; ?>
</div>