<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_vivienda".
 *
 * @property integer $COD_TIPO_VIVIENDA
 * @property string $DESCRIPCION
 *
 * @property Vivienda[] $viviendas
 */
class TipoVivienda extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_vivienda';
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
            'COD_TIPO_VIVIENDA' => 'Cod  Tipo  Vivienda',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getViviendas()
    {
        return $this->hasMany(Vivienda::className(), ['TIPO_VIVIENDA_COD_TIPO_VIVIENDA' => 'COD_TIPO_VIVIENDA']);
    }
}
