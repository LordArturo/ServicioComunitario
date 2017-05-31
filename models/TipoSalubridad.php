<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_salubridad".
 *
 * @property integer $COD_TIPO_SALUBRIDAD
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class TipoSalubridad extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_salubridad';
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
            'COD_TIPO_SALUBRIDAD' => 'Cod  Tipo  Salubridad',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['COD_SALUBRIDAD' => 'COD_TIPO_SALUBRIDAD']);
    }
}
