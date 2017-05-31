<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "caracteristica".
 *
 * @property integer $COD_CARACT_VIVIENDA
 * @property string $DESCRIPCION
 * @property integer $TIPO_CARACTERISTICA_COD_CARACTERISTICA
 *
 * @property Planilla[] $planillas
 * @property TipoCaracteristica $tIPOCARACTERISTICACODCARACTERISTICA
 */
class Caracteristica extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'caracteristica';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['TIPO_CARACTERISTICA_COD_CARACTERISTICA'], 'required'],
            [['TIPO_CARACTERISTICA_COD_CARACTERISTICA'], 'integer'],
            [['DESCRIPCION'], 'string', 'max' => 45],
            [['TIPO_CARACTERISTICA_COD_CARACTERISTICA'], 'exist', 'skipOnError' => true, 'targetClass' => TipoCaracteristica::className(), 'targetAttribute' => ['TIPO_CARACTERISTICA_COD_CARACTERISTICA' => 'COD_CARACTERISTICA']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_CARACT_VIVIENDA' => 'Cod  Caract  Vivienda',
            'DESCRIPCION' => 'Descripcion',
            'TIPO_CARACTERISTICA_COD_CARACTERISTICA' => 'Tipo  Caracteristica  Cod  Caracteristica',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA'])
            ->viaTable('caract_vivienda', ['CARACTERISTICA_COD_CARACT_VIVIENDA' => 'COD_CARACT_VIVIENDA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOCARACTERISTICACODCARACTERISTICA()
    {
        return $this->hasOne(TipoCaracteristica::className(), ['COD_CARACTERISTICA' => 'TIPO_CARACTERISTICA_COD_CARACTERISTICA']);
    }
}
