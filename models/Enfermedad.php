<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "enfermedad".
 *
 * @property integer $COD_ENF
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class Enfermedad extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'enfermedad';
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
            'COD_ENF' => 'Cod  Enf',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA'])
            ->viaTable('enfermedad_planilla', ['ENFERMEDAD_COD_ENF' => 'COD_ENF']);
    }
}
