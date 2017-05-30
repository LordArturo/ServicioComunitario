<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "act_comercial".
 *
 * @property integer $COD_ACT_COM
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class ActividadComercial extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'act_comercial';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['DESCRIPCION'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_ACT_COM' => 'Cod  Act  Com',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActComViviendas()
    {
        return $this->hasMany(Planilla::className(), ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA'])
            ->viaTable('act_com_vivienda', ['ACT_COMERCIAL_COD_ACT_COM' => 'COD_ACT_COM']);
    }
}
