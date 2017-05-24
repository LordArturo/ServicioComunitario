<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ingresos_clasif".
 *
 * @property integer $COD_ING_FAM
 * @property string $VALOR
 *
 * @property Planilla[] $planillas
 */
class IngresosClasif extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ingresos_clasif';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['VALOR'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_ING_FAM' => 'Cod  Ing  Fam',
            'VALOR' => 'Valor',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlanillas()
    {
        return $this->hasMany(Planilla::className(), ['INGRESOS_CLASIF_COD_ING_FAM' => 'COD_ING_FAM']);
    }
}
