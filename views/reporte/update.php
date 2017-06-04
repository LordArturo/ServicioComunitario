<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Censo */

$this->title = 'Update Censo: ' . $model->ID_CENSO;
$this->params['breadcrumbs'][] = ['label' => 'Censos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ID_CENSO, 'url' => ['view', 'id' => $model->ID_CENSO]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="censo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
