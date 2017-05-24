<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "salubridad_vivienda".
 *
 * @property integer $TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD
 * @property integer $PLANILLA_ID_PLANILLA
 *
 * @property Planilla $pLANILLAIDPLANILLA
 * @property TipoSalubridad $tIPOSALUBRIDADCODTIPOSALUBRIDAD
 */
class SalubridadVivienda extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'salubridad_vivienda';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD', 'PLANILLA_ID_PLANILLA'], 'required'],
            [['TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD', 'PLANILLA_ID_PLANILLA'], 'integer'],
            [['PLANILLA_ID_PLANILLA'], 'exist', 'skipOnError' => true, 'targetClass' => Planilla::className(), 'targetAttribute' => ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']],
            [['TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD'], 'exist', 'skipOnError' => true, 'targetClass' => TipoSalubridad::className(), 'targetAttribute' => ['TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD' => 'COD_TIPO_SALUBRIDAD']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD' => 'Tipo  Salubridad  Cod  Tipo  Salubridad',
            'PLANILLA_ID_PLANILLA' => 'Planilla  Id  Planilla',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPLANILLAIDPLANILLA()
    {
        return $this->hasOne(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOSALUBRIDADCODTIPOSALUBRIDAD()
    {
        return $this->hasOne(TipoSalubridad::className(), ['COD_TIPO_SALUBRIDAD' => 'TIPO_SALUBRIDAD_COD_TIPO_SALUBRIDAD']);
    }
}
