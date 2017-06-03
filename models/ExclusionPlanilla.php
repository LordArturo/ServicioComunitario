<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "exclusion_planilla".
 *
 * @property integer $CANTIDAD
 * @property integer $PLANILLA_ID_PLANILLA
 * @property integer $EXCLUSION_COD_EXCLUSION
 *
 * @property Exclusion $eXCLUSIONCODEXCLUSION
 * @property Planilla $pLANILLAIDPLANILLA
 */
class ExclusionPlanilla extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'exclusion_planilla';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['CANTIDAD', 'PLANILLA_ID_PLANILLA', 'EXCLUSION_COD_EXCLUSION'], 'integer'],
            [['PLANILLA_ID_PLANILLA', 'EXCLUSION_COD_EXCLUSION'], 'required'],
            [['EXCLUSION_COD_EXCLUSION'], 'exist', 'skipOnError' => true, 'targetClass' => Exclusion::className(), 'targetAttribute' => ['EXCLUSION_COD_EXCLUSION' => 'COD_EXCLUSION']],
            [['PLANILLA_ID_PLANILLA'], 'exist', 'skipOnError' => true, 'targetClass' => Planilla::className(), 'targetAttribute' => ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'CANTIDAD' => 'Cantidad',
            'PLANILLA_ID_PLANILLA' => 'Planilla  Id  Planilla',
            'EXCLUSION_COD_EXCLUSION' => 'Exclusion  Cod  Exclusion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEXCLUSIONCODEXCLUSION()
    {
        return $this->hasOne(Exclusion::className(), ['COD_EXCLUSION' => 'EXCLUSION_COD_EXCLUSION']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPLANILLAIDPLANILLA()
    {
        return $this->hasOne(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA']);
    }
}
