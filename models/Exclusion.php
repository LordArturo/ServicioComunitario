<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "exclusion".
 *
 * @property integer $COD_EXCLUSION
 * @property string $NOMBRE
 *
 * @property ExclusionPlanilla[] $exclusionPlanillas
 */
class Exclusion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'exclusion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['COD_EXCLUSION'], 'required'],
            [['COD_EXCLUSION'], 'integer'],
            [['NOMBRE'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_EXCLUSION' => 'Cod  Exclusion',
            'NOMBRE' => 'Nombre',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExclusionPlanillas()
    {
        return $this->hasMany(ExclusionPlanilla::className(), ['EXCLUSION_COD_EXCLUSION' => 'COD_EXCLUSION']);
    }
}
