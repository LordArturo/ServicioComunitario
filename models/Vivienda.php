<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vivienda".
 *
 * @property integer $COD_VIVIENDA
 * @property string $DESCRIPCION
 * @property integer $TIPO_VIVIENDA_COD_TIPO_VIVIENDA
 * @property integer $CALLE_NRO_CALLE
 *
 * @property Planilla[] $planillas
 * @property Calle $cALLENROCALLE
 * @property TipoVivienda $tIPOVIVIENDACODTIPOVIVIENDA
 */
class Vivienda extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vivienda';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['TIPO_VIVIENDA_COD_TIPO_VIVIENDA', 'CALLE_NRO_CALLE'], 'required'],
            [['TIPO_VIVIENDA_COD_TIPO_VIVIENDA', 'CALLE_NRO_CALLE'], 'integer'],
            [['DESCRIPCION'], 'string', 'max' => 45],
            //[['CALLE_NRO_CALLE'], 'exist', 'skipOnError' => true, 'targetClass' => Calle::className(), 'targetAttribute' => ['CALLE_NRO_CALLE' => 'NRO_CALLE']],
            [['TIPO_VIVIENDA_COD_TIPO_VIVIENDA'], 'exist', 'skipOnError' => true, 'targetClass' => TipoVivienda::className(), 'targetAttribute' => ['TIPO_VIVIENDA_COD_TIPO_VIVIENDA' => 'COD_TIPO_VIVIENDA']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_VIVIENDA' => 'Cod  Vivienda',
            'DESCRIPCION' => 'Descripcion',
            'TIPO_VIVIENDA_COD_TIPO_VIVIENDA' => 'Tipo  Vivienda  Cod  Tipo  Vivienda',
            'CALLE_NRO_CALLE' => 'Calle  Nro  Calle',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['VIVIENDA_COD_VIVIENDA' => 'COD_VIVIENDA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCALLENROCALLE()
    {
        return $this->hasOne(Calle::className(), ['NRO_CALLE' => 'CALLE_NRO_CALLE']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOVIVIENDACODTIPOVIVIENDA()
    {
        return $this->hasOne(TipoVivienda::className(), ['COD_TIPO_VIVIENDA' => 'TIPO_VIVIENDA_COD_TIPO_VIVIENDA']);
    }
}
