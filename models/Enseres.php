<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "enseres".
 *
 * @property integer $COD_ENSERES
 * @property string $DESCRIPCION
 *
 * @property Planilla[] $planillas
 */
class Enseres extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'enseres';
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
            'COD_ENSERES' => 'Cod  Enseres',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA'])
            ->viaTable('enseres_vivienda', ['ENSERES_COD_ENSERES' => 'COD_ENSERES']);
    }
}
