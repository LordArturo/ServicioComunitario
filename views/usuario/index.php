<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\models\Rol;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Usuarios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Crear Usuario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'ID_USER',
            'NOM_USER',
            'APELLIDO',
            'USERNAME',
            'CLAVE',
            ['attribute'=>'ROL_COD_ROL',
            'value'=>function($model){ $rol = Rol::findOne($model->ROL_COD_ROL);
                                        if($rol!=null)
                                            return $rol->DESCRIPCION;
                                        else return '';}
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
