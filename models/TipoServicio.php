<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_servicio".
 *
 * @property integer $COD_TIPO_SERV
 * @property string $DESCRIPCION
 *
 * @property Servicio[] $servicios
 */
class TipoServicio extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tipo_servicio';
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
            'COD_TIPO_SERV' => 'Cod  Tipo  Serv',
            'DESCRIPCION' => 'Descripcion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getServicios()
    {
        return $this->hasMany(Servicio::className(), ['TIPO_SERVICIO_COD_TIPO_SERV' => 'COD_TIPO_SERV']);
    }
}
