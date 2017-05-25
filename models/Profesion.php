<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "profesion".
 *
 * @property integer $COD_PROFESION
 * @property string $DESCRIPCION
 *
 * @property PersonaPlanilla[] $personaPlanillas
 */
class Profesion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profesion';
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
            'COD_PROFESION' => 'Cod  Profesion',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['PROFESION_COD_PROFESION' => 'COD_PROFESION']);
    }
}
