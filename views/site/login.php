<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            //'template' => "{label}\n<div class=\"col-lg-3\">{input}</div>\n<div class=\"col-lg-8\">{error}</div>",
            'template' => '<div class="col-md-8 col-md-offset-2 text-center" style="margin-top:20px">
                                                {input}
                                            </div>',
            //'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

        <div class="row" style="margin-top:40px; margin-bottom:40px;">
                                    <div class="col-md-8 col-md-offset-2">
                                            <div class="row">
                                                <div class="col-md-8 col-md-offset-2 text-center" style=" height:100px; margin-top:20px">
                                                    <span class="glyphicon glyphicon-user" style="font-size:6em"></span>
                                                </div>
                                                    <?= $form->field($model, 'username')->textInput(
                                                    ['autofocus' => true, 'style' => 'width:80%; text-align:center;',
                                                     'class'=>'', 'placeholder'=>'Nombre de Usuario', 'required'=>'required'])
                                                    ->label(false) ?>

                                                    <?= $form->field($model, 'password')->passwordInput(
                                                    ['style' => 'width:80%; text-align:center;', 'class'=>'', 'placeholder'=>'Contraseña'])->label(false) ?>

                                                    <?= $form->field($model, 'rememberMe')->checkbox([
                                                    'template' => 
                                                    "<div class=\"col-lg-offset-3 col-lg-3\">{input} {label}</div>\n<div class=\"col-lg-8\">{error}</div>",
                                                    ]) ?>

                                                <div class="col-md-8 col-md-offset-2 text-center" style="margin-top:0px">
                                                    <?= Html::submitButton('Ingresar al sistema', ['class' => 'btn btn-success', 'name' => 'login-button']) ?>
                                            </div>
                                                <div class="col-md-8 col-md-offset-2 text-center" style="margin-top:20px">
                                                <a href="">¿Olvidó su contraseña?</a>
                                            </div>

                                            </div>
                                            <div class="col-lg-offset-1" style="color:#999;">
        Te podrás loguear con <strong>admin/admin</strong>.<br>
    </div>
                                    </div>
                                </div>
        


        <div class="form-group">
            <div class="col-lg-offset-1 col-lg-11">
                
            </div>
        </div>

    <?php ActiveForm::end(); ?>

    
</div>

