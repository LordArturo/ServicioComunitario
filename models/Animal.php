<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "animal".
 *
 * @property integer $COD_ANIMAL
 * @property string $NOMBRE_ANIMAL
 * @property integer $TIPO_ANIMAL_COD_TIPO_ANIMAL
 *
 * @property TipoAnimal $tIPOANIMALCODTIPOANIMAL
 * @property Planillas[] $planillas
 */
class Animal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'animal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['TIPO_ANIMAL_COD_TIPO_ANIMAL'], 'required'],
            [['TIPO_ANIMAL_COD_TIPO_ANIMAL'], 'integer'],
            [['NOMBRE_ANIMAL'], 'string', 'max' => 45],
            [['TIPO_ANIMAL_COD_TIPO_ANIMAL'], 'exist', 'skipOnError' => true, 'targetClass' => TipoAnimal::className(), 'targetAttribute' => ['TIPO_ANIMAL_COD_TIPO_ANIMAL' => 'COD_TIPO_ANIMAL']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_ANIMAL' => 'Cod  Animal',
            'NOMBRE_ANIMAL' => 'Nombre  Animal',
            'TIPO_ANIMAL_COD_TIPO_ANIMAL' => 'Tipo  Animal  Cod  Tipo  Animal',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOANIMALCODTIPOANIMAL()
    {
        return $this->hasOne(TipoAnimal::className(), ['COD_TIPO_ANIMAL' => 'TIPO_ANIMAL_COD_TIPO_ANIMAL']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA'])
            ->viaTable('animal_vivienda', ['ANIMAL_COD_ANIMAL' => 'COD_ANIMAL']);
    }
}
