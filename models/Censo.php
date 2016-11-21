<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "censo".
 *
 * @property integer $ID_CENSO
 * @property integer $ANO
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class Censo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'censo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ANO', 'DESCRIPCION'], 'required'],
            [['ANO'], 'integer'],
            [['DESCRIPCION'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID_CENSO' => 'Id  Censo',
            'ANO' => 'Año',
            'DESCRIPCION' => 'Descripción',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['CENSO_ID_CENSO' => 'ID_CENSO']);
    }
}
