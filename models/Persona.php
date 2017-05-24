<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "persona".
 *
 * @property integer $CEDULA
 * @property string $APELLIDOS
 * @property string $NOMBRES
 * @property string $TELEF_CELULAR
 * @property string $TELEF_HAB
 * @property integer $GENERO_COD_GENERO
 * @property integer $ID_PERSONA
 * @property string $FECHA_NACIMIENTO
 *
 * @property Genero $gENEROCODGENERO
 * @property PersonaPlanilla[] $personaPlanillas
 */
class Persona extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'persona';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['CEDULA', 'GENERO_COD_GENERO', 'ID_PERSONA', 'FECHA_NACIMIENTO'], 'required'],
            [['CEDULA', 'GENERO_COD_GENERO', 'ID_PERSONA'], 'integer'],
            [['FECHA_NACIMIENTO'], 'safe'],
            [['APELLIDOS', 'NOMBRES', 'TELEF_CELULAR', 'TELEF_HAB'], 'string', 'max' => 45],
            //[['GENERO_COD_GENERO'], 'exist', 'skipOnError' => true, 'targetClass' => Genero::className(), 'targetAttribute' => ['GENERO_COD_GENERO' => 'COD_GENERO']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'CEDULA' => 'Cedula',
            'APELLIDOS' => 'Apellidos',
            'NOMBRES' => 'Nombres',
            'TELEF_CELULAR' => 'Telef  Celular',
            'TELEF_HAB' => 'Telef  Hab',
            'GENERO_COD_GENERO' => 'Genero  Cod  Genero',
            'ID_PERSONA' => 'Id  Persona',
            'FECHA_NACIMIENTO' => 'Fecha  Nacimiento',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGENEROCODGENERO()
    {
        return $this->hasOne(Genero::className(), ['COD_GENERO' => 'GENERO_COD_GENERO']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['PERSONA_ID_PERSONA' => 'ID_PERSONA']);
    }
}