<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use app\models\Rol;
use app\models\RolUser;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
//echo Html::a("Link", ["user/view"]);
?>

<div class="usuario-form">


    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'NOM_USER')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'APELLIDO')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'USERNAME')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'CLAVE')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'ROL_COD_ROL')->dropDownList(
	    	ArrayHelper::map(Rol::find()->all(),'COD_ROL','DESCRIPCION'),
	    	['prompt'=>'Seleccione Rol']
	  ) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
