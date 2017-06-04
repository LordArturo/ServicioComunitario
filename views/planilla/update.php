<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Planilla */

$this->title = 'Actualizar Planilla: ' . $model->NRO_PLANILLA;
$this->params['breadcrumbs'][] = ['label' => 'Planillas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ID_PLANILLA, 'url' => ['view', 'id' => $model->ID_PLANILLA]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="planilla-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'vivienda' => $vivienda,
        'personaPlanilla' => $personaPlanilla,
        'personaPlanillas' => $personaPlanillas,
        'persona' => $persona,
        'personas' => $personas,
        'actividadComercial' => $actividadComercial,
        'tiposCaracteristicas' => $tiposCaracteristicas,
        'enseres' => $enseres,
        'tipoAnimales' => $tipoAnimales,
        'enfermedades' => $enfermedades,
        'exclusiones' => $exclusiones,
        'tipoServicios' => $tipoServicios,
        'calle' => $calle,
    ]) ?>

</div>
