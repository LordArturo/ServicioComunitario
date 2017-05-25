<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "nivel_instruccion".
 *
 * @property integer $COD_NIV_INST
 * @property string $DESCRIPCION
 *
 * @property PersonaPlanilla[] $personaPlanillas
 */
class NivelInstruccion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'nivel_instruccion';
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
            'COD_NIV_INST' => 'Cod  Niv  Inst',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['NIVEL_INSTRUCCION_COD_NIV_INST' => 'COD_NIV_INST']);
    }
}
