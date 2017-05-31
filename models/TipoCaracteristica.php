<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_caracteristica".
 *
 * @property integer $COD_CARACTERISTICA
 * @property string $DESCRIPCION
 *
 * @property Caracteristica[] $caracteristicas
 */
class TipoCaracteristica extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_caracteristica';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['DESCRIPCION'], 'required'],
            [['DESCRIPCION'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_CARACTERISTICA' => 'Cod  Caracteristica',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasMany(Caracteristica::className(), ['TIPO_CARACTERISTICA_COD_CARACTERISTICA' => 'COD_CARACTERISTICA']);
    }
}
