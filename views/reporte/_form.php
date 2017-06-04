<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Censo;

/* @var $this yii\web\View */
/* @var $model app\models\Censo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="censo-form">

    <?php $form = ActiveForm::begin(); ?>
<div class="row">
    <div class="col-md-4">
        <?= $form->field($model, 'CENSO_ID_CENSO')->dropDownList(
            ArrayHelper::map(Censo::find()->all(),'ID_CENSO','DESCRIPCION'),
            ['prompt'=>'Seleccione Censo']
      ) ?>
            
        </div>

        <div class="col-md-4">
        <?= $form->field($model, 'NRO_PLANILLA')->dropDownList(
            ['1' => 'Cantidad personas por estado civil',]
            //['prompt'=>'Trabaja']
      )->label("Tipo de consulta") ?>
        </div>

        

        </div>
<div class="col-md-8">
    <div class="form-group pull-right">
        <?= Html::submitButton($model->isNewRecord ? 'Generar' : 'Generar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
</div>

    <?php ActiveForm::end(); ?>

</div>
