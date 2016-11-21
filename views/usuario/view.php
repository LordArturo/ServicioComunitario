<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Rol;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = $model->ID_USER;
$this->params['breadcrumbs'][] = ['label' => 'Usuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->ID_USER], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->ID_USER], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Está seguro de querer borrar este registro?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ID_USER',
            'NOM_USER',
            'APELLIDO',
            'USERNAME',
            'CLAVE',
            ['attribute'=>'ROL_COD_ROL',
            'value'=>(Rol::findOne($model->ROL_COD_ROL)?Rol::findOne($model->ROL_COD_ROL)->DESCRIPCION:'')]
        ],
    ]) ?>

</div>
