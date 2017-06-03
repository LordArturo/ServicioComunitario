<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "servicio".
 *
 * @property integer $COD_SERVICIO
 * @property string $DESCRIPCION
 * @property integer $TIPO_SERVICIO_COD_TIPO_SERV
 *
 * @property TipoServicio $tIPOSERVICIOCODTIPOSERV
 * @property Planilla[] $planillas
 */
class Servicio extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'servicio';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['TIPO_SERVICIO_COD_TIPO_SERV'], 'required'],
            [['TIPO_SERVICIO_COD_TIPO_SERV'], 'integer'],
            [['DESCRIPCION'], 'string', 'max' => 45],
            [['TIPO_SERVICIO_COD_TIPO_SERV'], 'exist', 'skipOnError' => true, 'targetClass' => TipoServicio::className(), 'targetAttribute' => ['TIPO_SERVICIO_COD_TIPO_SERV' => 'COD_TIPO_SERV']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_SERVICIO' => 'Cod  Servicio',
            'DESCRIPCION' => 'Descripcion',
            'TIPO_SERVICIO_COD_TIPO_SERV' => 'Tipo  Servicio  Cod  Tipo  Serv',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOSERVICIOCODTIPOSERV()
    {
        return $this->hasOne(TipoServicio::className(), ['COD_TIPO_SERV' => 'TIPO_SERVICIO_COD_TIPO_SERV']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanilla()
    {
        return $this->hasMany(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA'])
            ->viaTable('servicio_vivienda', ['SERVICIO_COD_SERVICIO' => 'COD_SERVICIO']);
    }
}
