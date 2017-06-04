<?php

namespace app\controllers;

use Yii;
use app\models\Censo;
use app\models\Planilla;
use app\models\EstadoCivil;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * EstadisticaController implements the CRUD actions for Censo model.
 */
class EstadisticaController extends Controller
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
     * Lists all Censo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $model = new Planilla();

        if ($model->load(Yii::$app->request->post())) {
            return $this->redirect(['view',
             'id' => $model->CENSO_ID_CENSO,
             'tipo' => $model->NRO_PLANILLA]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays a single Censo model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id, $tipo)
    {
        $censo = $this->findModel($id);
        $resultado = array();
        $estados = EstadoCivil::find()->all();

        if($tipo==1){//por estado civil
            foreach ($estados as $estado) {
                array_push($resultado, [
                    'id' => $estado->COD_EST_CIV,
                    'nombre' => $estado->DESCRIPCION,
                    'cantidad' => 0,
                    ]
                );
            }
            foreach ($censo->planillas as $planilla) {
                foreach ($planilla->personaPlanillas as $personaPlanilla) {
                    if($personaPlanilla->ESTADO_CIVIL_COD_EST_CIV > 0){
                        for ($i = 0; $i < count($resultado); $i++) {
                            if($personaPlanilla->eSTADOCIVILCODESTCIV->COD_EST_CIV == $resultado[$i]['id']){
                                $resultado[$i]['cantidad']++;
                                break;
                            }
                        }
                    }
                }
            }

        }


        return $this->render('view', [
            'model' => $this->findModel($id),
            'resultado' => $resultado,
        ]);
    }

    /**
     * Creates a new Censo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Censo();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ID_CENSO]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Censo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ID_CENSO]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Censo model.
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
     * Finds the Censo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Censo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Censo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
