<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "calle".
 *
 * @property integer $NRO_CALLE
 * @property string $NOMBRE_CALLE
 * @property integer $SECTOR_COD_SECTOR
 *
 * @property Sector $sECTORCODSECTOR
 * @property Vivienda[] $viviendas
 */
class Calle extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'calle';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['SECTOR_COD_SECTOR'], 'required'],
            [['SECTOR_COD_SECTOR'], 'integer'],
            [['NOMBRE_CALLE'], 'string', 'max' => 45],
            [['SECTOR_COD_SECTOR'], 'exist', 'skipOnError' => true, 'targetClass' => Sector::className(), 'targetAttribute' => ['SECTOR_COD_SECTOR' => 'COD_SECTOR']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'NRO_CALLE' => 'Nro  Calle',
            'NOMBRE_CALLE' => 'Calle',
            'SECTOR_COD_SECTOR' => 'Sector',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSECTORCODSECTOR()
    {
        return $this->hasOne(Sector::className(), ['COD_SECTOR' => 'SECTOR_COD_SECTOR']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getViviendas()
    {
        return $this->hasMany(Vivienda::className(), ['CALLE_NRO_CALLE' => 'NRO_CALLE']);
    }
}
