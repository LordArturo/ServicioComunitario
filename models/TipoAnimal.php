<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_animal".
 *
 * @property integer $COD_TIPO_ANIMAL
 * @property string $NOMBRE
 *
 * @property Animal[] $animals
 */
class TipoAnimal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_animal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['NOMBRE'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_TIPO_ANIMAL' => 'Cod  Tipo  Animal',
            'NOMBRE' => 'Nombre',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAnimals()
    {
        return $this->hasMany(Animal::className(), ['TIPO_ANIMAL_COD_TIPO_ANIMAL' => 'COD_TIPO_ANIMAL']);
    }
}
