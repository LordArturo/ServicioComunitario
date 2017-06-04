<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "planilla".
 *
 * @property integer $NRO_PLANILLA
 * @property string $FECHA
 * @property integer $VIVIENDA_COD_VIVIENDA
 * @property integer $ID_PLANILLA
 * @property integer $INGRESOS_CLASIF_COD_ING_FAM
 * @property integer $NUMERO_FAMILIAS
 * @property string $OBSERVACIONES
 * @property integer $OCV
 * @property integer $CANT_HAB
 * @property integer $AYUDA
 * @property string $DESCRIPCION_AYUDA
 * @property integer $CENSO_ID_CENSO
 * @property integer $COD_SALUBRIDAD
 * @property integer $FORMA_TENENCIA_COD_FORM_TEN
 * @property integer $organizaciones_comunitarias
 * @property string $organizaciones_comunitarias_cuales
 * @property string $servicio_o_bien
 * @property string $principales_potencialidades
 * @property string $principales_problemas
 *
 * @property ActividadComercial[] $actividadComercial
 * @property Animal[] $animales
 * @property Caracteristica[] $caracteristicas
 * @property Enfermedad[] $enfermedades
 * @property Enseres[] $enseres
 * @property ExclusionPlanilla[] $exclusionPlanillas
 * @property Exclusion[] $exclusiones
 * @property FormaTenencia[] $formaTenencias
 * @property PersonaPlanilla[] $personaPlanillas
 * @property Vivienda $vIVIENDACODVIVIENDA
 * @property IngresosClasif $iNGRESOSCLASIFCODINGFAM
 * @property Censo $cENSOIDCENSO
 * @property FormaTenencia $fORMATENENCIACODFORMTEN
 * @property SalubridadVivienda[] $salubridadViviendas
 * @property Servicio[] $servicios
 * @property TipoSalubridad $cODSALUBRIDAD
 */
class Planilla extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'planilla';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['NRO_PLANILLA', 'INGRESOS_CLASIF_COD_ING_FAM', 'CENSO_ID_CENSO'], 'required'],
            [['NRO_PLANILLA', 'VIVIENDA_COD_VIVIENDA', 'INGRESOS_CLASIF_COD_ING_FAM', 'NUMERO_FAMILIAS', 'OCV', 'CANT_HAB', 'AYUDA', 'CENSO_ID_CENSO', 'organizaciones_comunitarias'], 'integer'],
            [['FECHA'], 'safe'],
            //['FECHA', 'default', 'value' => '23/06/2017'],
            [['OBSERVACIONES'], 'string', 'max' => 200],
            [['DESCRIPCION_AYUDA'], 'string', 'max' => 150],
            [['organizaciones_comunitarias_cuales'], 'string', 'max' => 150],
            [['servicio_o_bien'], 'string', 'max' => 150],
            [['principales_potencialidades'], 'string', 'max' => 150],
            [['principales_problemas'], 'string', 'max' => 150],
            [['VIVIENDA_COD_VIVIENDA'], 'exist', 'skipOnError' => true, 'targetClass' => Vivienda::className(), 'targetAttribute' => ['VIVIENDA_COD_VIVIENDA' => 'COD_VIVIENDA']],
            [['INGRESOS_CLASIF_COD_ING_FAM'], 'exist', 'skipOnError' => true, 'targetClass' => IngresosClasif::className(), 'targetAttribute' => ['INGRESOS_CLASIF_COD_ING_FAM' => 'COD_ING_FAM']],
            [['CENSO_ID_CENSO'], 'exist', 'skipOnError' => true, 'targetClass' => Censo::className(), 'targetAttribute' => ['CENSO_ID_CENSO' => 'ID_CENSO']],
            [['COD_SALUBRIDAD'], 'exist', 'skipOnError' => true, 'targetClass' => TipoSalubridad::className(), 'targetAttribute' => ['COD_SALUBRIDAD' => 'COD_TIPO_SALUBRIDAD']],
            [['FORMA_TENENCIA_COD_FORM_TEN'], 'exist', 'skipOnError' => true, 'targetClass' => FormaTenencia::className(), 'targetAttribute' => ['FORMA_TENENCIA_COD_FORM_TEN' => 'COD_FORM_TEN']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'NRO_PLANILLA' => 'Número de Planilla',
            'FECHA' => 'Fecha',
            'VIVIENDA_COD_VIVIENDA' => 'Vivienda  Cod  Vivienda',
            'ID_PLANILLA' => 'Id  Planilla',
            'INGRESOS_CLASIF_COD_ING_FAM' => 'Clasificación de ingreso',
            'NUMERO_FAMILIAS' => 'Número de Familias',
            'OBSERVACIONES' => 'Observaciones',
            'OCV' => 'Pertenece a una OCV',
            'CANT_HAB' => 'Cantidad Habitaciones',
            'AYUDA' => 'Necesita ayuda especial',
            'DESCRIPCION_AYUDA' => 'Descripción  de la Ayuda',
            'FORMA_TENENCIA_COD_FORM_TEN' => 'Forma de Vivienda',
            'CENSO_ID_CENSO' => 'Censo',
            'COD_SALUBRIDAD' => 'Salubridad de la Vivienda',
            'organizaciones_comunitarias' => '¿Existen organizaciones comunitarias?',
            'organizaciones_comunitarias_cuales' => '¿Cúales?',
            'servicio_o_bien' => '¿Qué tipo de bien o servicio le gustaría a usted o a algún miembro de su familia que se generará en la comunidad de acuerdo a sus necesidades?',
            'principales_potencialidades' => 'En orden de importancia ¿Cúales cree usted que son las principales potencialidades y aspectos ventajosos que tiene su comunidad?',
            'principales_problemas' => 'En orden de importancia ¿Cúales cree usted que son los principales y problemas de su comunidad?',

        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActividadComercial()
    {
        return $this->hasMany(ActividadComercial::className(), ['COD_ACT_COM' => 'ACT_COMERCIAL_COD_ACT_COM'])
            ->viaTable('act_com_vivienda', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAnimales()
    {
        return $this->hasMany(Animal::className(), ['COD_ANIMAL' => 'ANIMAL_COD_ANIMAL'])
            ->viaTable('animal_vivienda', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCaracteristicas()
    {
        return $this->hasMany(Caracteristica::className(), ['COD_CARACT_VIVIENDA' => 'CARACTERISTICA_COD_CARACT_VIVIENDA'])
            ->viaTable('caract_vivienda', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEnfermedades()
    {
        return $this->hasMany(Enfermedad::className(), ['COD_ENF' => 'ENFERMEDAD_COD_ENF'])
            ->viaTable('enfermedad_planilla', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEnseres()
    {
        return $this->hasMany(Enseres::className(), ['COD_ENSERES' => 'ENSERES_COD_ENSERES'])
            ->viaTable('enseres_vivienda', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExclusionPlanillas()
    {
        return $this->hasMany(ExclusionPlanilla::className(), ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExclusiones()
    {
        return $this->hasMany(Exclusion::className(), ['COD_EXCLUSION' => 'EXCLUSION_COD_EXCLUSION'])
            ->viaTable('exclusion_planilla', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPersonaPlanillas()
    {
        return $this->hasMany(PersonaPlanilla::className(), ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVIVIENDACODVIVIENDA()
    {
        return $this->hasOne(Vivienda::className(), ['COD_VIVIENDA' => 'VIVIENDA_COD_VIVIENDA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getINGRESOSCLASIFCODINGFAM()
    {
        return $this->hasOne(IngresosClasif::className(), ['COD_ING_FAM' => 'INGRESOS_CLASIF_COD_ING_FAM']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCENSOIDCENSO()
    {
        return $this->hasOne(Censo::className(), ['ID_CENSO' => 'CENSO_ID_CENSO']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCODSALUBRIDAD()
    {
        return $this->hasOne(TipoSalubridad::className(), ['COD_TIPO_SALUBRIDAD' => 'COD_SALUBRIDAD']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFORMATENENCIACODFORMTEN()
    {
        return $this->hasOne(FormaTenencia::className(), ['COD_FORM_TEN' => 'FORMA_TENENCIA_COD_FORM_TEN']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSalubridadViviendas()
    {
        return $this->hasMany(SalubridadVivienda::className(), ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getServicios()
    {
        return $this->hasMany(Servicio::className(), ['COD_SERVICIO' => 'SERVICIO_COD_SERVICIO'])
            ->viaTable('servicio_vivienda', ['PLANILLA_ID_PLANILLA' => 'ID_PLANILLA']);
    }
}
