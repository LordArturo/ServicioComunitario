<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "persona_planilla".
 *
 * @property integer $PLANILLA_ID_PLANILLA
 * @property integer $PERSONA_ID_PERSONA
 * @property string $CORREO
 * @property integer $ESTADO_CIVIL_COD_EST_CIV
 * @property integer $NIVEL_INSTRUCCION_COD_NIV_INST
 * @property integer $PROFESION_COD_PROFESION
 * @property integer $TRABAJA
 * @property integer $TIPO_TRABAJO_COD_TIP_TRAB
 * @property double $INGRESO
 * @property integer $JEFE_FAMILIA
 * @property integer $PARENTESCO_COD_PARENTESCO
 * @property integer $ACTIVISTA_COMUNAL
 *
 * @property EstadoCivil $eSTADOCIVILCODESTCIV
 * @property NivelInstruccion $nIVELINSTRUCCIONCODNIVINST
 * @property Parentesco $pARENTESCOCODPARENTESCO
 * @property Persona $pERSONAIDPERSONA
 * @property Planilla $pLANILLAIDPLANILLA
 * @property Profesion $pROFESIONCODPROFESION
 * @property TipoTrabajo $tIPOTRABAJOCODTIPTRAB
 */
class PersonaPlanilla extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'persona_planilla';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            //[['PLANILLA_ID_PLANILLA', 'PERSONA_ID_PERSONA', 'ESTADO_CIVIL_COD_EST_CIV', 'NIVEL_INSTRUCCION_COD_NIV_INST', 'PROFESION_COD_PROFESION', 'TIPO_TRABAJO_COD_TIP_TRAB', 'PARENTESCO_COD_PARENTESCO'], 'required'],
            [['PLANILLA_ID_PLANILLA', 'PERSONA_ID_PERSONA', 'ESTADO_CIVIL_COD_EST_CIV', 'NIVEL_INSTRUCCION_COD_NIV_INST', 'PROFESION_COD_PROFESION', 'TRABAJA', 'TIPO_TRABAJO_COD_TIP_TRAB', 'JEFE_FAMILIA', 'PARENTESCO_COD_PARENTESCO', 'ACTIVISTA_COMUNAL'], 'integer'],
            [['INGRESO'], 'number'],
            [['CORREO'], 'string', 'max' => 45],
            //[['ESTADO_CIVIL_COD_EST_CIV'], 'exist', 'skipOnError' => true, 'targetClass' => EstadoCivil::className(), 'targetAttribute' => ['ESTADO_CIVIL_COD_EST_CIV' => 'COD_EST_CIV']],
            //[['NIVEL_INSTRUCCION_COD_NIV_INST'], 'exist', 'skipOnError' => true, 'targetClass' => NivelInstruccion::className(), 'targetAttribute' => ['NIVEL_INSTRUCCION_COD_NIV_INST' => 'COD_NIV_INST']],
            //[['PARENTESCO_COD_PARENTESCO'], 'exist', 'skipOnError' => true, 'targetClass' => Parentesco::className(), 'targetAttribute' => ['PARENTESCO_COD_PARENTESCO' => 'COD_PARENTESCO']],
            //[['PERSONA_ID_PERSONA'], 'exist', 'skipOnError' => true, 'targetClass' => Persona::className(), 'targetAttribute' => ['PERSONA_ID_PERSONA' => 'ID_PERSONA']],
            [['PLANILLA_ID_PLANILLA'], 'exist', 'skipOnError' => true, 'targetClass' => Planilla::className(), 'targetAttribute' => ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']],
            //[['PROFESION_COD_PROFESION'], 'exist', 'skipOnError' => true, 'targetClass' => Profesion::className(), 'targetAttribute' => ['PROFESION_COD_PROFESION' => 'COD_PROFESION']],
            //[['TIPO_TRABAJO_COD_TIP_TRAB'], 'exist', 'skipOnError' => true, 'targetClass' => TipoTrabajo::className(), 'targetAttribute' => ['TIPO_TRABAJO_COD_TIP_TRAB' => 'COD_TIP_TRAB']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'PLANILLA_ID_PLANILLA' => 'Planilla  Id  Planilla',
            'PERSONA_ID_PERSONA' => 'Persona  Id  Persona',
            'CORREO' => 'Correo',
            'ESTADO_CIVIL_COD_EST_CIV' => 'Estado Civil',
            'NIVEL_INSTRUCCION_COD_NIV_INST' => 'Nivel  Instruccion  Cod  Niv  Inst',
            'PROFESION_COD_PROFESION' => 'Profesion  Cod  Profesion',
            'TRABAJA' => 'Trabaja',
            'TIPO_TRABAJO_COD_TIP_TRAB' => 'Tipo  Trabajo',
            'INGRESO' => 'Ingreso',
            'JEFE_FAMILIA' => 'Jefe  Familia',
            'PARENTESCO_COD_PARENTESCO' => 'Parentesco  Cod  Parentesco',
            'ACTIVISTA_COMUNAL' => 'Activista  Comunal',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getESTADOCIVILCODESTCIV()
    {
        return $this->hasOne(EstadoCivil::className(), ['COD_EST_CIV' => 'ESTADO_CIVIL_COD_EST_CIV']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNIVELINSTRUCCIONCODNIVINST()
    {
        return $this->hasOne(NivelInstruccion::className(), ['COD_NIV_INST' => 'NIVEL_INSTRUCCION_COD_NIV_INST']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPARENTESCOCODPARENTESCO()
    {
        return $this->hasOne(Parentesco::className(), ['COD_PARENTESCO' => 'PARENTESCO_COD_PARENTESCO']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPERSONAIDPERSONA()
    {
        return $this->hasOne(Persona::className(), ['ID_PERSONA' => 'PERSONA_ID_PERSONA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPLANILLAIDPLANILLA()
    {
        return $this->hasOne(Planilla::className(), ['ID_PLANILLA' => 'PLANILLA_ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPROFESIONCODPROFESION()
    {
        return $this->hasOne(Profesion::className(), ['COD_PROFESION' => 'PROFESION_COD_PROFESION']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTIPOTRABAJOCODTIPTRAB()
    {
        return $this->hasOne(TipoTrabajo::className(), ['COD_TIP_TRAB' => 'TIPO_TRABAJO_COD_TIP_TRAB']);
    }
}
