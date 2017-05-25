<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "genero".
 *
 * @property integer $COD_GENERO
 * @property string $DESCRIPCION
 *
 * @property Persona[] $personas
 */
class Genero extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'genero';
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
            'COD_GENERO' => 'Cod  Genero',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonas()
    {
        return $this->hasMany(Persona::className(), ['GENERO_COD_GENERO' => 'COD_GENERO']);
    }
}
