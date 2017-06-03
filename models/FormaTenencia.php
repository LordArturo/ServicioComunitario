<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "forma_tenencia".
 *
 * @property integer $COD_FORM_TEN
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class FormaTenencia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'forma_tenencia';
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
            'COD_FORM_TEN' => 'Cod  Form  Ten',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['FORMA_TENENCIA_COD_FORM_TEN' => 'COD_FORM_TEN']);
    }
}
