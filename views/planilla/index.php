<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Planillas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="planilla-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Planilla', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'NRO_PLANILLA',
            'FECHA',
            'VIVIENDA_COD_VIVIENDA',
            'ID_PLANILLA',
            'INGRESOS_CLASIF_COD_ING_FAM',
            // 'NUMERO_FAMILIAS',
            // 'OBSERVACIONES',
            // 'OCV',
            // 'CANT_HAB',
            // 'AYUDA',
            // 'DESCRIPCION_AYUDA',
            // 'CENSO_ID_CENSO',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
