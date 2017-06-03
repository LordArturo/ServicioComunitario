<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Planilla */

$this->title = 'Crear Planilla';
$this->params['breadcrumbs'][] = ['label' => 'Planillas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="planilla-create">

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

<div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        </div>
        <div class="col-md-4"> 
        </div>
    </div>
