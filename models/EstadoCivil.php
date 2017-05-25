<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "estado_civil".
 *
 * @property integer $COD_EST_CIV
 * @property string $DESCRIPCION
 *
 * @property PersonaPlanilla[] $personaPlanillas
 */
class EstadoCivil extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'estado_civil';
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
            'COD_EST_CIV' => 'Cod  Est  Civ',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['ESTADO_CIVIL_COD_EST_CIV' => 'COD_EST_CIV']);
    }
}
