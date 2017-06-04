<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use yii\bootstrap\ActiveForm;

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
use app\models\TipoSalubridad;
use app\models\FormaTenencia;
use app\models\Sector;

/* @var $this yii\web\View */
/* @var $model app\models\Planilla */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="planilla-form">

    <?php $form = ActiveForm::begin([
        //'layout' => 'horizontal',
        'fieldConfig' => [//"{label}\n{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}"
            'template' => "{label}\n{beginWrapper}\n{input}\n{hint}\n{endWrapper}",
            'horizontalCssClasses' => [
                'label' => 'col-sm-4',
                'offset' => '',//col-sm-offset-4
                'wrapper' => 'col-sm-8',
                'error' => '',
                'hint' => '',
            ],
        ]
    ]); ?>

    <!-- 
    Encabezado de la página 1
    -->


    <div class="row">
        <div class="col-md-4">
        <?= $form->field($model, 'CENSO_ID_CENSO')->dropDownList(
            ArrayHelper::map(Censo::find()->all(),'ID_CENSO','DESCRIPCION'),
            ['prompt'=>'Seleccione Censo']
      ) ?>
            
        </div>
        <div class="col-md-4">
        <?= $form->field($model, 'NRO_PLANILLA')->textInput(['maxlength' => true, 'type' => 'number']/*['class' => 'col-md-6']*/) ?>
            
        </div>
        <div class="col-md-4">

        <?= $form->field($model, 'FECHA')->widget(\yii\jui\DatePicker::classname(), [
    //'language' => 'ru',
    //'dateFormat' => 'yyyy-MM-dd',
    //'value'=> '1970-01-01',
    'options' => ['class' => 'form-control'],
    //'clientOptions' => ['defaultDate' => '2014-01-01']
    'clientOptions' => ['dateFormat' => 'yy-mm-dd']
     ])?>
            
        </div>


        <!-- 
    Sector y dirección
    -->
        <div class="col-md-6">
        <?= $form->field($calle, 'SECTOR_COD_SECTOR')->dropDownList(
            ArrayHelper::map(Sector::find()->all(),'COD_SECTOR','NOMBRE_SECTOR'),
            ['prompt'=>'Seleccione Sector']
      ) ?>
        </div>
        <div class="col-md-6"> 
        <?= $form->field($calle, 'NOMBRE_CALLE')->textInput() ?>
        </div>


        <div class="col-md-12"> 
        <h2>Jefe de familia</h2>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'NOMBRES')->textInput(['maxlength' => true]) ?> 
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'APELLIDOS')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'CEDULA')->textInput(['maxlength' => true, 'type' => 'number']) ?> 
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'FECHA_NACIMIENTO')->widget(\yii\jui\DatePicker::classname(), [
            'options' => ['class' => 'form-control'],
            'clientOptions' => ['dateFormat' => 'yy-mm-dd']
        ])?>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'GENERO_COD_GENERO')->dropDownList(
            ArrayHelper::map(Genero::find()->all(),'COD_GENERO','DESCRIPCION'),
            ['prompt'=>'Seleccione Sexo']
      ) ?>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'TELEF_CELULAR')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($persona, 'TELEF_HAB')->textInput(['maxlength' => true]) ?> 
        </div>
        <div class="col-md-4"> 
        <?= $form->field($personaPlanilla, 'CORREO')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4"> 
        <?= $form->field($personaPlanilla, 'ESTADO_CIVIL_COD_EST_CIV')->dropDownList(
            ArrayHelper::map(EstadoCivil::find()->all(),'COD_EST_CIV','DESCRIPCION'),
            ['prompt'=>'Seleccione Estado Civil']
      ) ?>
      
        </div>
        <div class="col-md-4">
        <?= $form->field($personaPlanilla, 'NIVEL_INSTRUCCION_COD_NIV_INST')->dropDownList(
            ArrayHelper::map(NivelInstruccion::find()->all(),'COD_NIV_INST','DESCRIPCION'),
            ['prompt'=>'Seleccione Nivel de Instrucción']
      ) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($personaPlanilla, 'PROFESION_COD_PROFESION')->dropDownList(
            ArrayHelper::map(Profesion::find()->all(),'COD_PROFESION','DESCRIPCION'),
            ['prompt'=>'Seleccione Profesión']
      ) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($personaPlanilla, 'TRABAJA')->dropDownList(
            ['1' => 'Sí', '0' => 'No']
            //['prompt'=>'Trabaja']
      ) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($model, 'INGRESOS_CLASIF_COD_ING_FAM')->dropDownList(
            ArrayHelper::map(IngresosClasif::find()->all(),'COD_ING_FAM','VALOR')
            //['prompt'=>'Seleccione Clasificación de ingresos']
      ) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($personaPlanilla, 'INGRESO')->textInput(['maxlength' => true, 'type' => 'number']) ?>
        </div>


        <div class="col-md-12"> 
        <h2>Características del grupo familiar</h2>
        </div>
        <div class="col-md-4">
        <?= $form->field($model, 'NUMERO_FAMILIAS')->textInput(['maxlength' => true, 'type' => 'number']) ?>
        </div>


        <div class="col-md-12"> 
        <h4>Integrantes:</h4>
        </div> 
    <!--
      Pendiente de este código para múltiples modelos
    --> 
    <div class="col-md-12"> 
    <div class="table-responsive text-center">
    <table class="table table-bordered table-striped" cellspacing="0" width="100%">
        <tr>
            <th class="text-center" style="min-width: 150px;">Nombres</th>
            <th class="text-center" style="min-width: 150px;">Apellidos</th>
            <th class="text-center" style="min-width: 100px;">Sexo</th>
            <th class="text-center" style="min-width: 150px;">Cédula</th>
            <th class="text-center" style="min-width: 200px;">Fecha de Nacimiento</th>
            <th class="text-center" style="min-width: 100px;">Parentesco</th>
            <th class="text-center" style="min-width: 120px;">Ingreso</th>
            <th class="text-center" style="min-width: 200px;">Nivel de Instrucción</th>
            <th class="text-center" style="min-width: 100px;">Profesión</th>
        </tr>
        <?php for($i=0; $i < 7; $i++) { ?>
        <tr>
            <td style="width: 500px;">
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
                <?= $form->field($personas[$i], '['.$i.']CEDULA')->textInput(['maxlength' => true, 'type' => 'number'])->label('') ?>
            </td>
            <td class="col-sm-2">
                <?= $form->field($personas[$i], '['.$i.']FECHA_NACIMIENTO')->widget(\yii\jui\DatePicker::classname(), [
                'options' => ['class' => 'form-control'],
                'clientOptions' => ['dateFormat' => 'yy-mm-dd']
                ])->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']PARENTESCO_COD_PARENTESCO')->dropDownList(
                        ArrayHelper::map(Parentesco::find()->all(),'COD_PARENTESCO','DESCRIPCION'),
                        ['prompt'=>'Seleccione Parentesco']
                )->label('') ?>
            </td>
            <td>
                <?= $form->field($personaPlanillas[$i], '['.$i.']INGRESO')->textInput(['maxlength' => true, 'type' => 'number'])->label('') ?>
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
    </div>
    </div>


        <div class="col-md-12" style="margin-top: 10px;">
        <?= $form->field($model, 'OBSERVACIONES')->textarea(['rows' => '6']) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($personaPlanilla, 'TIPO_TRABAJO_COD_TIP_TRAB')->dropDownList(
            ArrayHelper::map(TipoTrabajo::find()->all(),'COD_TIP_TRAB','DESCRIPCION'),
            ['prompt'=>'Seleccione tipo de trabajo']
      ) ?>
        </div>
        <div class="col-md-12">
        <!--
      Actividad Comercial
    --> 
    <h4 style="display: inline;">Actividad Comercial: </h4>
    
    <?php foreach ($actividadComercial as $actividad) {?>
        <div style="display: inline; margin-left: 5px;">
            <?= $actividad->DESCRIPCION ?>
            <?php 
                $text=''; 
                if(in_array($actividad, $model->actividadComercial))
                    $text = 'checked'; ?>
            <input type="checkbox" name="actividadComercial<?= $actividad->COD_ACT_COM ?>" <?= $text ?>>
        </div>
    <?php } ?>
        </div>
        <div class="col-md-12">
        <h2>Características de la vivienda</h2> 
        </div>
        <div class="col-md-4">
        <!--
    <?= $form->field($vivienda, 'DESCRIPCION')->textInput(['maxlength' => true]) ?>  
    -->
    <?= $form->field($vivienda, 'TIPO_VIVIENDA_COD_TIPO_VIVIENDA')->dropDownList(
            ArrayHelper::map(TipoVivienda::find()->all(),'COD_TIPO_VIVIENDA','DESCRIPCION'),
            ['prompt'=>'Seleccione Tipo de Vivienda']
      ) ?>
        </div>
        <div class="col-md-4">
        <!--
      Forma Tenencia Vivienda
    --> 
    <?= $form->field($model, 'FORMA_TENENCIA_COD_FORM_TEN')->dropDownList(
            ArrayHelper::map(FormaTenencia::find()->all(),'COD_FORM_TEN','DESCRIPCION'),
            ['prompt'=>'Seleccione Tipo de Tenencia de la Vivienda']
      ) ?>
        </div>
        <div class="col-md-4">
        <?= $form->field($model, 'OCV')->dropDownList(
            ['1' => 'Sí', '0' => 'No']
            //['prompt'=>'Trabaja']
        ) ?>
        </div>

    <!--
      Características Vivienda
    --> 
    <?php foreach ($tiposCaracteristicas as $tipo) {?>
    <?php if($tipo->DESCRIPCION == "Habitaciones de vivienda") {?>
        <div class="col-md-12">
    <?php }else{?>
    <div class="col-md-4" style="margin-top: 5px;">
    <?php }?>
        <label style="display: inline;"><?= $tipo->DESCRIPCION ?>: </label>
            <?php if($tipo->DESCRIPCION == "Habitaciones de vivienda") {?>

                <?php foreach ($tipo->caracteristicas as $caracteristica) {?>
                
                <?php 
                $text=''; 
                if(in_array($caracteristica, $model->caracteristicas))
                    $text = 'checked'; ?>

                    <div style="display: inline; margin-left: 5px;">
                        <?= $caracteristica->DESCRIPCION ?>
                        <input type="checkbox" name="caracteristica<?= $caracteristica->COD_CARACT_VIVIENDA ?>" <?= $text ?>>
                    </div>
                <?php } ?>

            <?php }else{ ?>
                <div>
                <select class="form-control" name="tiposCaracteristica<?= $tipo->COD_CARACTERISTICA ?>">
                <?php foreach ($tipo->caracteristicas as $caracteristica) { ?>

                <?php 
                $text=''; 
                if(in_array($caracteristica, $model->caracteristicas))
                    $text = 'selected'; ?>

                    <option value="<?= $caracteristica->COD_CARACT_VIVIENDA ?>" <?= $text ?>><?= $caracteristica->DESCRIPCION ?></option>
                <?php } ?>
                </select>
            </div>

            <?php }?>
        </div>
    <?php } ?>
        <div class="col-md-4">
        <?= $form->field($model, 'CANT_HAB')->textInput(['maxlength' => true, 'type' => 'number']) ?>
        </div>
        <div class="col-md-12">
        <!--
      Enseres de la vivienda
    --> 
    <label style="display: inline;">Enseres de la vivienda: </label>
    
    <?php foreach ($enseres as $enser) {?>
            <?php 
                $text=''; 
                if(in_array($enser, $model->enseres))
                    $text = 'checked'; ?>

        <div style="display: inline; margin-left: 5px;">
            <?= $enser->DESCRIPCION ?>
            <input type="checkbox" name="enser<?= $enser->COD_ENSERES ?>" <?= $text ?>>
        </div>
    <?php } ?>
        </div>
        <div class="col-md-4" style="margin-top: 10px;">
        <!--
      Salubridad de la vivienda
    --> 
    <?= $form->field($model, 'COD_SALUBRIDAD')->dropDownList(
            ArrayHelper::map(TipoSalubridad::find()->all(),'COD_TIPO_SALUBRIDAD','DESCRIPCION'),
            ['prompt'=>'Seleccione Salubridad']
      ) ?>
        </div>

        
         <!--
      Animales domesticos o insectos y roedores
    --> 
    <?php foreach ($tipoAnimales as $tipo) {?>
        <div class="col-md-12">
        <label style="display: inline;"><?= $tipo->NOMBRE ?>: </label>
            <?php foreach ($tipo->animals as $animal) {?>

            <?php 
                $text=''; 
                if(in_array($animal, $model->animales))
                    $text = 'checked'; ?>

                <div style="display: inline; margin-left: 5px;">
                    <?= $animal->NOMBRE_ANIMAL ?>
                    <input type="checkbox" name="animal<?= $animal->COD_ANIMAL ?>" <?= $text ?>>
                </div>
            <?php } ?>
        </div>
    <?php } ?>

    <div class="col-md-12"> 
        <h2>Salud y servicios</h2>
    </div>

    <div class="col-md-12">
    <!--
      Enfermedades
    --> 

    <label style="display: inline;">Salud: </label>
    <?php foreach ($enfermedades as $enfermedad) {?>
            
            <?php 
                $text=''; 
                if(in_array($enfermedad, $model->enfermedades))
                    $text = 'checked'; ?>

        <div style="display: inline; margin-left: 5px;">
            <?= $enfermedad->DESCRIPCION ?>
            <input type="checkbox" name="enfermedad<?= $enfermedad->COD_ENF ?>" <?= $text ?>>
        </div>
    <?php } ?>
        </div>

        <div class="col-md-4" style="margin-top: 5px;">
        <?= $form->field($model, 'AYUDA')->dropDownList(
            ['1' => 'Sí', '0' => 'No']
            //['prompt'=>'Trabaja']
        ) ?>
        </div>
        <div class="col-md-12">
        <?= $form->field($model, 'DESCRIPCION_AYUDA')->textarea(['rows' => '5']) ?>
        </div>


        <div class="col-md-12"> 
            <h4>Situación de exclusión</h4>
        </div>

        <!--
      Exclusión
    --> 
    
    <?php foreach ($exclusiones as $exclusion) {?>
            
            <?php 
                $text=''; 
                $value = 0;
                if(in_array($exclusion, $model->exclusiones)){
                    $text = 'checked'; 
                    foreach ($model->exclusionPlanillas as $ex) {
                        if($ex->EXCLUSION_COD_EXCLUSION == $exclusion->COD_EXCLUSION)
                            $value = $ex->CANTIDAD;
                    }
                }

            ?>
        
        <div class="col-md-12">
        <div class="col-md-5">
            <?= $exclusion->NOMBRE ?>
            <input type="checkbox" name="exclusion<?= $exclusion->COD_EXCLUSION ?>" <?= $text ?>>
            ¿Cuantos?

            </div>
            <div class="col-md-4">
            <input type="number" class="form-control" name="exclusionCantidad<?= $exclusion->COD_EXCLUSION ?>" value="<?= $value ?>">
            </div>
        </div>
    <?php } ?>


    <!--
      Servicios de la vivienda e incluído parte de servicios comunales
    --> 
    <div class="col-md-12"> 
        <h4>Servicios</h4>
    </div>
    
    <?php foreach ($tipoServicios as $tipo) {?>
        <div class="col-md-12">
            <label style="display: inline;"><?= $tipo->DESCRIPCION ?>: </label>
            <?php foreach ($tipo->servicios as $servicio) {?>
            
            <?php 
                $text=''; 
                if(in_array($servicio, $model->servicios))
                    $text = 'checked'; ?>

                <div style="display: inline; margin-left: 5px;">
                    <?= $servicio->DESCRIPCION ?>
                    <input type="checkbox" name="servicio<?= $servicio->COD_SERVICIO ?>" <?= $text ?>>
                </div>
            <?php } ?>
        </div>
    <?php } ?>

    <!--
      Participación comunitaria y situación de la comunidad
    --> 

    

    
    
    
    

    

        <div class="col-md-6" style="margin-top: 15px;">
        <?= $form->field($model, 'organizaciones_comunitarias')->dropDownList(
            ['1' => 'Sí', '0' => 'No']
            //['prompt'=>'Trabaja']
        ) ?>
        </div>
        <div class="col-md-12">
        <?= $form->field($model, 'organizaciones_comunitarias_cuales')->textarea(['rows' => '4']) ?>
        </div>
        <div class="col-md-12">
        <?= $form->field($model, 'servicio_o_bien')->textarea(['rows' => '4']) ?>
        </div>
        <div class="col-md-12">
        <?= $form->field($model, 'principales_potencialidades')->textarea(['rows' => '4']) ?>
        </div>
        <div class="col-md-12">
        <?= $form->field($model, 'principales_problemas')->textarea(['rows' => '4']) ?>
        </div>
        <div class="col-md-6">
        <?= $form->field($personaPlanilla, 'ACTIVISTA_COMUNAL')->dropDownList(
            ['1' => 'Sí', '0' => 'No']
            //['prompt'=>'Trabaja']
        ) ?>
        </div>

    </div>
    

    


    


    

    

    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



<script type="text/javascript">
    //alert("será");
</script>
