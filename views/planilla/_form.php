<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

use yii\helpers\ArrayHelper;
use app\models\Censo;
use app\models\IngresosClasif;
use app\models\TipoVivienda;
use app\models\Genero;
use app\models\EstadoCivil;
use app\models\NivelInstruccion;
use app\models\Profesion;
use app\models\Parentesco;
use app\models\TipoTrabajo;

/* @var $this yii\web\View */
/* @var $model app\models\Planilla */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="planilla-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'CENSO_ID_CENSO')->dropDownList(
            ArrayHelper::map(Censo::find()->all(),'ID_CENSO','DESCRIPCION'),
            ['prompt'=>'Seleccione Censo']
      ) ?>

    <!-- 
    Encabezado de la página 1
    -->

    <?= $form->field($model, 'NRO_PLANILLA')->textInput() ?>

    <?= $form->field($model, 'FECHA')->textInput() ?>

    <!-- 
    Sector y dirección
    -->

    <div>Aquí va el jefe de familia</div> 
    <?= $form->field($persona, 'NOMBRES')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($persona, 'APELLIDOS')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($persona, 'CEDULA')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($persona, 'FECHA_NACIMIENTO')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($persona, 'GENERO_COD_GENERO')->dropDownList(
            ArrayHelper::map(Genero::find()->all(),'COD_GENERO','DESCRIPCION'),
            ['prompt'=>'Seleccione Sexo']
      ) ?>
    <?= $form->field($persona, 'TELEF_CELULAR')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($persona, 'TELEF_HAB')->textInput(['maxlength' => true]) ?> 

    <?= $form->field($personaPlanilla, 'CORREO')->textInput(['maxlength' => true]) ?> 
    <?= $form->field($personaPlanilla, 'ESTADO_CIVIL_COD_EST_CIV')->dropDownList(
            ArrayHelper::map(EstadoCivil::find()->all(),'COD_EST_CIV','DESCRIPCION'),
            ['prompt'=>'Seleccione Estado Civil']
      ) ?>
      

    <?= $form->field($personaPlanilla, 'NIVEL_INSTRUCCION_COD_NIV_INST')->dropDownList(
            ArrayHelper::map(NivelInstruccion::find()->all(),'COD_NIV_INST','DESCRIPCION'),
            ['prompt'=>'Seleccione Nivel de Instrucción']
      ) ?>
    <?= $form->field($personaPlanilla, 'PROFESION_COD_PROFESION')->dropDownList(
            ArrayHelper::map(Profesion::find()->all(),'COD_PROFESION','DESCRIPCION'),
            ['prompt'=>'Seleccione Profesión']
      ) ?>
    <?= $form->field($personaPlanilla, 'TRABAJA')->textInput(['maxlength' => true]) ?> 

    <?= $form->field($model, 'INGRESOS_CLASIF_COD_ING_FAM')->dropDownList(
            ArrayHelper::map(IngresosClasif::find()->all(),'COD_ING_FAM','VALOR'),
            ['prompt'=>'Seleccione Clasificación de ingresos']
      ) ?>

    <?= $form->field($personaPlanilla, 'INGRESO')->textInput(['maxlength' => true]) ?>



    <?= $form->field($model, 'NUMERO_FAMILIAS')->textInput() ?>


    <div>Aquí va el resto de intregrantes de la familia</div> 
    <!--
      Pendiente de este código para múltiples modelos
    --> 

    <table>
        <tr>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Sexo</th>
            <th>Cédula</th>
            <th>Fecha de Nacimiento</th>
            <th>Parentesco</th>
            <th>Ingreso</th>
            <th>Nivel de Instrucción</th>
            <th>Profesión</th>
        </tr>
        <?php for($i=0; $i < 7; $i++) { ?>
        <tr>
            <td>
                <?= $form->field($personas[$i], '['.$i.']NOMBRES')->textInput(['maxlength' => true])->label('') ?>
            </td>
            <td>
                <?= $form->field($personas[$i], '['.$i.']APELLIDOS')->textInput(['maxlength' => true])->label('') ?>
            </td>
            <td>
                <?= $form->field($personas[$i], '['.$i.']GENERO_COD_GENERO')->dropDownList(
                        ArrayHelper::map(Genero::find()->all(),'COD_GENERO','DESCRIPCION'),
                        ['prompt'=>'Seleccione Sexo']
                )->label('') ?>
            </td>
            <td>
                <?= $form->field($personas[$i], '['.$i.']CEDULA')->textInput(['maxlength' => true])->label('') ?>
            </td>
            <td>
                <?= $form->field($personas[$i], '['.$i.']FECHA_NACIMIENTO')->textInput(['maxlength' => true])->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']PARENTESCO_COD_PARENTESCO')->dropDownList(
                        ArrayHelper::map(Parentesco::find()->all(),'COD_PARENTESCO','DESCRIPCION'),
                        ['prompt'=>'Seleccione Parentesco']
                )->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']INGRESO')->textInput(['maxlength' => true])->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']NIVEL_INSTRUCCION_COD_NIV_INST')->dropDownList(
                        ArrayHelper::map(NivelInstruccion::find()->all(),'COD_NIV_INST','DESCRIPCION'),
                        ['prompt'=>'Seleccione Nivel de Instrucción']
                )->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']PROFESION_COD_PROFESION')->dropDownList(
                        ArrayHelper::map(Profesion::find()->all(),'COD_PROFESION','DESCRIPCION'),
                        ['prompt'=>'Seleccione Profesión']
                )->label('') ?>
            </td>
        </tr>
        <?php } ?>

    </table>

    <?= $form->field($model, 'OBSERVACIONES')->textInput(['maxlength' => true]) ?>

    <?= $form->field($personaPlanilla, 'TIPO_TRABAJO_COD_TIP_TRAB')->dropDownList(
            ArrayHelper::map(TipoTrabajo::find()->all(),'COD_TIP_TRAB','DESCRIPCION'),
            ['prompt'=>'Seleccione tipo de trabajo']
      ) ?>

    <!--
      Actividad Comercial
    --> 
    Actividad Comercial
    <?php foreach ($actividadComercial as $actividad) {?>
        <div>
            <?= $actividad->DESCRIPCION ?>
            <input type="checkbox" name="actividadComercial<?= $actividad->COD_ACT_COM ?>">
        </div>
    <?php } ?>

    <div>Aquí va la vivienda</div> 
    <!--
    <?= $form->field($vivienda, 'DESCRIPCION')->textInput(['maxlength' => true]) ?>  
    -->
    <?= $form->field($vivienda, 'TIPO_VIVIENDA_COD_TIPO_VIVIENDA')->dropDownList(
            ArrayHelper::map(TipoVivienda::find()->all(),'COD_TIPO_VIVIENDA','DESCRIPCION'),
            ['prompt'=>'Seleccione Tipo de Vivienda']
      ) ?>

    <!--
      Forma Vivienda, es manyToMany?
    --> 

    <?= $form->field($model, 'OCV')->textInput() ?>



    <?= $form->field($model, 'CANT_HAB')->textInput() ?>

    

    <?= $form->field($model, 'AYUDA')->textInput() ?>

    <?= $form->field($model, 'DESCRIPCION_AYUDA')->textInput(['maxlength' => true]) ?>

    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



<script type="text/javascript">
    //alert("será");
</script>
