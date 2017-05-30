<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_trabajo".
 *
 * @property integer $COD_TIP_TRAB
 * @property string $DESCRIPCION
 *
 * @property PersonaPlanilla[] $personaPlanillas
 */
class TipoTrabajo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_trabajo';
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
            'COD_TIP_TRAB' => 'Cod  Tip  Trab',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['TIPO_TRABAJO_COD_TIP_TRAB' => 'COD_TIP_TRAB']);
    }
}
