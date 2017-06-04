<?php

namespace app\controllers;

use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;


use app\models\Planilla;
use app\models\Vivienda;
use app\models\PersonaPlanilla;
use app\models\Persona;
use app\models\Genero;
use app\models\ActividadComercial;
use app\models\TipoCaracteristica;
use app\models\Caracteristica;
use app\models\Enseres;
use app\models\Animal;
use app\models\TipoAnimal;
use app\models\Enfermedad;
use app\models\Exclusion;
use app\models\ExclusionPlanilla;
use app\models\TipoServicio;
use app\models\Servicio;
use app\models\Calle;

use yii\base\Model;

/**
 * PlanillaController implements the CRUD actions for Planilla model.
 */
class PlanillaController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            'access' => [
                'class' => \yii\filters\AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Planilla models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Planilla::find(),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Planilla model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Planilla model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Planilla();
        $vivienda = new Vivienda();
        $personaPlanilla = new PersonaPlanilla();
        $personaPlanillas = array();
        $persona = new Persona();
        $personas = array();
        $actividadComercial = ActividadComercial::find()->all();
        $tiposCaracteristicas = TipoCaracteristica::find()->all();
        $enseres = Enseres::find()->all();
        $tipoAnimales = TipoAnimal::find()->all();
        $enfermedades = Enfermedad::find()->all();
        $exclusiones = Exclusion::find()->all();
        $tipoServicios = TipoServicio::find()->all();
        $calle = new Calle();


        for ($i=0; $i < 7; $i++) { 
             $personaPlanillas[$i] = new PersonaPlanilla();
             $personas[$i] = new Persona();
         } 

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
            //calle y sector
            $calle->load(Yii::$app->request->post());
            $calle->save();
            //vivienda
            $vivienda->load(Yii::$app->request->post());
            $vivienda->CALLE_NRO_CALLE= $calle->NRO_CALLE;
            $vivienda->save();
            $model->VIVIENDA_COD_VIVIENDA= $vivienda->COD_VIVIENDA;
            $model->save();
            //persona jefe de familia
            $persona->load(Yii::$app->request->post());
            $persona->save();
            $personaPlanilla->load(Yii::$app->request->post());
            $personaPlanilla->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
            $personaPlanilla->PERSONA_ID_PERSONA = $persona->ID_PERSONA;
            $personaPlanilla->JEFE_FAMILIA = 1;
            $personaPlanilla->save();
            //Model::validateMultiple($dates)
            Model::loadMultiple($personaPlanillas, Yii::$app->request->post());
            Model::loadMultiple($personas, Yii::$app->request->post());

            /*
            muchos a muchos luego de haber guardado $user->link('markets', $market);
            */

            //integrantes de la familia
            for ($i=0; $i < 7; $i++) { 
                if(strlen($personas[$i]->NOMBRES)<=0)
                    continue;
                $personas[$i]->save();
                $personaPlanillas[$i]->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
                $personaPlanillas[$i]->PERSONA_ID_PERSONA = $personas[$i]->ID_PERSONA;
                $personaPlanillas[$i]->save();
            } 

            //Actividad Comercial
            foreach ($actividadComercial as $actividad) {
                if(Yii::$app->request->post('actividadComercial'.$actividad->COD_ACT_COM)){
                    $model->link('actividadComercial', $actividad);
                }
            }

            //Características
            foreach ($tiposCaracteristicas as $tipo) {
                if($tipo->DESCRIPCION == "Habitaciones de vivienda") {
                    foreach ($tipo->caracteristicas as $caracteristica) {
                        if(Yii::$app->request->post('caracteristica'.$caracteristica->COD_CARACT_VIVIENDA))
                            $model->link('caracteristicas', $caracteristica);
                    }
                }else{
                    $idBuscado = 0;
                    foreach ($tipo->caracteristicas as $caracteristica) {
                        if(Yii::$app->request->post('tiposCaracteristica'.$tipo->COD_CARACTERISTICA) == $caracteristica->COD_CARACT_VIVIENDA)
                            $model->link('caracteristicas', $caracteristica);
                    }
                }
            }

            //Enseres de la vivienda
            foreach ($enseres as $enser) {
                if(Yii::$app->request->post('enser'.$enser->COD_ENSERES)){
                    $model->link('enseres', $enser);
                }
            }

            //Animales
            foreach ($tipoAnimales as $tipo) {
                foreach ($tipo->animals as $animal) {
                    if(Yii::$app->request->post('animal'.$animal->COD_ANIMAL))
                        $model->link('animales', $animal);
                }
            }

            //Enfermedades
            foreach ($enfermedades as $enfermedad) {
                if(Yii::$app->request->post('enfermedad'.$enfermedad->COD_ENF)){
                    $model->link('enfermedades', $enfermedad);
                }
            }

            //Exclusión
            foreach ($exclusiones as $exclusion) {
                if(Yii::$app->request->post('exclusion'.$exclusion->COD_EXCLUSION)){
                    $aux = new ExclusionPlanilla();
                    $aux->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
                    $aux->EXCLUSION_COD_EXCLUSION = $exclusion->COD_EXCLUSION;
                    $aux->CANTIDAD = Yii::$app->request->post('exclusionCantidad'.$exclusion->COD_EXCLUSION);
                    $aux->save();
                }
            }

            //Servicios
            foreach ($tipoServicios as $tipo) {
                foreach ($tipo->servicios as $servicio) {
                    if(Yii::$app->request->post('servicio'.$servicio->COD_SERVICIO))
                        $model->link('servicios', $servicio);
                }
            }
            
            return $this->redirect(['view', 'id' => $model->ID_PLANILLA]);
        } else {
            return $this->render('create', [
                'model' => $model,
                'vivienda' => $vivienda,
                'personaPlanilla' => $personaPlanilla,
                'personaPlanillas' => $personaPlanillas,
                'persona' => $persona,
                'personas' => $personas,
                'actividadComercial' => $actividadComercial,
                'tiposCaracteristicas' => $tiposCaracteristicas,
                'enseres' => $enseres,
                'tipoAnimales' => $tipoAnimales,
                'enfermedades' => $enfermedades,
                'exclusiones' => $exclusiones,
                'tipoServicios' => $tipoServicios,
                'calle' => $calle,
            ]);
        }
    }

    /**
     * Updates an existing Planilla model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $vivienda = $model->vIVIENDACODVIVIENDA;

        $personaPlanilla = new PersonaPlanilla();
        $persona = new Persona();
        $personaPlanillas = array();
        $personas = array();
        for ($i=0; $i < 7; $i++) { 
             $personaPlanillas[$i] = new PersonaPlanilla();
             $personas[$i] = new Persona();
        } 
        $cant = 0;
        foreach ($model->personaPlanillas as $personaP) {
            if($personaP->JEFE_FAMILIA == 1){
                $personaPlanilla = $personaP;
                $persona = $personaP->pERSONAIDPERSONA;
            }
            else{
                $personaPlanillas[$cant] = $personaP;
                $personas[$cant++] = $personaP->pERSONAIDPERSONA;
            }
        }
        
        $calle = $vivienda->cALLENROCALLE;
        $actividadComercial = ActividadComercial::find()->all();
        $tiposCaracteristicas = TipoCaracteristica::find()->all();
        $enseres = Enseres::find()->all();
        $tipoAnimales = TipoAnimal::find()->all();
        $enfermedades = Enfermedad::find()->all();
        $exclusiones = Exclusion::find()->all();
        $tipoServicios = TipoServicio::find()->all();

        

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //calle y sector
            $calle->load(Yii::$app->request->post());
            $calle->save();
            //vivienda
            $vivienda->load(Yii::$app->request->post());
            $vivienda->CALLE_NRO_CALLE= $calle->NRO_CALLE;
            $vivienda->save();
            $model->VIVIENDA_COD_VIVIENDA= $vivienda->COD_VIVIENDA;
            $model->save();
            //persona jefe de familia
            $persona->load(Yii::$app->request->post());
            $persona->save();
            $personaPlanilla->load(Yii::$app->request->post());
            $personaPlanilla->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
            $personaPlanilla->PERSONA_ID_PERSONA = $persona->ID_PERSONA;
            $personaPlanilla->JEFE_FAMILIA = 1;
            $personaPlanilla->save();
            //Model::validateMultiple($dates)
            Model::loadMultiple($personaPlanillas, Yii::$app->request->post());
            Model::loadMultiple($personas, Yii::$app->request->post());

            /*
            muchos a muchos luego de haber guardado $user->link('markets', $market);
            */

            //integrantes de la familia
            for ($i=0; $i < 7; $i++) { 
                if(strlen($personas[$i]->NOMBRES)<=0)
                    continue;
                $personas[$i]->save();
                $personaPlanillas[$i]->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
                $personaPlanillas[$i]->PERSONA_ID_PERSONA = $personas[$i]->ID_PERSONA;
                $personaPlanillas[$i]->save();
            } 

            //Actividad Comercial
            foreach ($actividadComercial as $actividad) {
                $model->unlink('actividadComercial', $actividad, $delete = true);
                if(Yii::$app->request->post('actividadComercial'.$actividad->COD_ACT_COM)){
                    $model->link('actividadComercial', $actividad);
                }
            }

            //Características
            foreach ($tiposCaracteristicas as $tipo) {
                if($tipo->DESCRIPCION == "Habitaciones de vivienda") {
                    foreach ($tipo->caracteristicas as $caracteristica) {
                        $model->unlink('caracteristicas', $caracteristica, $delete = true);
                        if(Yii::$app->request->post('caracteristica'.$caracteristica->COD_CARACT_VIVIENDA))
                            $model->link('caracteristicas', $caracteristica);
                    }
                }else{
                    $idBuscado = 0;
                    foreach ($tipo->caracteristicas as $caracteristica) {
                        $model->unlink('caracteristicas', $caracteristica, $delete = true);
                        if(Yii::$app->request->post('tiposCaracteristica'.$tipo->COD_CARACTERISTICA) == $caracteristica->COD_CARACT_VIVIENDA)
                            $model->link('caracteristicas', $caracteristica);
                    }
                }
            }

            //Enseres de la vivienda
            foreach ($enseres as $enser) {
                $model->unlink('enseres', $enser, $delete = true);
                if(Yii::$app->request->post('enser'.$enser->COD_ENSERES)){
                    $model->link('enseres', $enser);
                }
            }

            //Animales
            foreach ($tipoAnimales as $tipo) {
                foreach ($tipo->animals as $animal) {
                    $model->unlink('animales', $animal, $delete = true);
                    if(Yii::$app->request->post('animal'.$animal->COD_ANIMAL))
                        $model->link('animales', $animal);
                }
            }

            //Enfermedades
            foreach ($enfermedades as $enfermedad) {
                $model->unlink('enfermedades', $enfermedad, $delete = true);
                if(Yii::$app->request->post('enfermedad'.$enfermedad->COD_ENF)){
                    $model->link('enfermedades', $enfermedad);
                }
            }

            //Exclusión
            /*foreach ($model->exclusionPlanillas as $exclusion) {
                $exclusion->delete();
            }*/
            foreach ($exclusiones as $exclusion) {
                $model->unlink('exclusiones', $exclusion, $delete = true);
                if(Yii::$app->request->post('exclusion'.$exclusion->COD_EXCLUSION)){
                    $aux = new ExclusionPlanilla();
                    $aux->PLANILLA_ID_PLANILLA = $model->ID_PLANILLA;
                    $aux->EXCLUSION_COD_EXCLUSION = $exclusion->COD_EXCLUSION;
                    $aux->CANTIDAD = Yii::$app->request->post('exclusionCantidad'.$exclusion->COD_EXCLUSION);
                    $aux->save();
                }
            }

            //Servicios
            foreach ($tipoServicios as $tipo) {
                foreach ($tipo->servicios as $servicio) {
                    $model->unlink('servicios', $servicio, $delete = true);
                    if(Yii::$app->request->post('servicio'.$servicio->COD_SERVICIO))
                        $model->link('servicios', $servicio);
                }
            }

            return $this->redirect(['view', 'id' => $model->ID_PLANILLA]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'vivienda' => $vivienda,
                'personaPlanilla' => $personaPlanilla,
                'personaPlanillas' => $personaPlanillas,
                'persona' => $persona,
                'personas' => $personas,
                'actividadComercial' => $actividadComercial,
                'tiposCaracteristicas' => $tiposCaracteristicas,
                'enseres' => $enseres,
                'tipoAnimales' => $tipoAnimales,
                'enfermedades' => $enfermedades,
                'exclusiones' => $exclusiones,
                'tipoServicios' => $tipoServicios,
                'calle' => $calle,
            ]);
        }
    }

    /**
     * Deletes an existing Planilla model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Planilla model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Planilla the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Planilla::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
