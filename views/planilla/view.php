<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Planilla */

$this->title = $model->ID_PLANILLA;
$this->params['breadcrumbs'][] = ['label' => 'Planillas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="planilla-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->ID_PLANILLA], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->ID_PLANILLA], [
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
            'NRO_PLANILLA',
            'FECHA',
            'VIVIENDA_COD_VIVIENDA',
            'ID_PLANILLA',
            'INGRESOS_CLASIF_COD_ING_FAM',
            'NUMERO_FAMILIAS',
            'OBSERVACIONES',
            'OCV',
            'CANT_HAB',
            'AYUDA',
            'DESCRIPCION_AYUDA',
            'CENSO_ID_CENSO',
        ],
    ]) ?>

</div>
