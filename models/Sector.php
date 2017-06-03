<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sector".
 *
 * @property integer $COD_SECTOR
 * @property string $NOMBRE_SECTOR
 *
 * @property Calle[] $calles
 */
class Sector extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sector';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['NOMBRE_SECTOR'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'COD_SECTOR' => 'Cod  Sector',
            'NOMBRE_SECTOR' => 'Nombre  Sector',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCalles()
    {
        return $this->hasMany(Calle::className(), ['SECTOR_COD_SECTOR' => 'COD_SECTOR']);
    }
}
