<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "parentesco".
 *
 * @property integer $COD_PARENTESCO
 * @property string $DESCRIPCION
 *
 * @property PersonaPlanilla[] $personaPlanillas
 */
class Parentesco extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'parentesco';
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
            'COD_PARENTESCO' => 'Cod  Parentesco',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['PARENTESCO_COD_PARENTESCO' => 'COD_PARENTESCO']);
    }
}
