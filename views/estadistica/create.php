<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Censo */

$this->title = 'Generar Gráfica';
$this->params['breadcrumbs'][] = ['label' => 'Censos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="censo-create">

    <h1 style="font-style: oblique; margin-top: 20px; margin-bottom: 50px;"><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
