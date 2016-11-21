<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Censo */

$this->title = $model->ID_CENSO;
$this->params['breadcrumbs'][] = ['label' => 'Censos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="censo-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->ID_CENSO], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->ID_CENSO], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ID_CENSO',
            'ANO',
            'DESCRIPCION',
        ],
    ]) ?>

</div>
