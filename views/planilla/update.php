<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Planilla */

$this->title = 'Update Planilla: ' . $model->ID_PLANILLA;
$this->params['breadcrumbs'][] = ['label' => 'Planillas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ID_PLANILLA, 'url' => ['view', 'id' => $model->ID_PLANILLA]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="planilla-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
