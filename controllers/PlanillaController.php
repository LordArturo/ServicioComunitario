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


        for ($i=0; $i < 7; $i++) { 
             $personaPlanillas[$i] = new PersonaPlanilla();
             $personas[$i] = new Persona();
         } 

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            //vivienda
            $vivienda->load(Yii::$app->request->post());
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

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ID_PLANILLA]);
        } else {
            return $this->render('update', [
                'model' => $model,
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
