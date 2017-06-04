<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Censo */

$this->title = 'Gráfica';
$this->params['breadcrumbs'][] = ['label' => 'Censos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="censo-view">

    <h1 style="font-style: oblique;">Gráfica</h1>

    <div class="row">
        <br />
        <div id="echart_line" style="height:400px;"></div>
    </div>


</div>


<script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/Chart.min.js"></script>
<script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/echarts.min.js"></script>
<script type="text/javascript">

var array = <?php echo json_encode($resultado); ?>;
var data = [];
var datos = [];
var datosx = [];

for(var i = 0; i < array.length; i++){
    datos.push(array[i]['cantidad']);
    datosx.push(array[i]['nombre']);
    
}

data.push({
          name: 'datos',
          type: 'bar',
          smooth: true,
          itemStyle: {
            normal: {

                /*color: function(params) {

                  return colores[datosColores[params.seriesIndex][params.dataIndex]];
                },*/
              areaStyle: {
              }
            }
          },
          data: datos//[29, 29, 28, 28, 28, 27, 26, 25, 28, 29]
        });

echartLine = echarts.init(document.getElementById('echart_line'));
    echartLine.setOption({
      /*tooltip: {
        trigger: 'axis'
      },*/
      tooltip: {
      trigger: 'item',//a titulo b name, c value, d cantidad o porcentaje
      formatter: "{b} = {c}"
      },
      calculable: true,
      //formatter: "{b}",
      //color: ['red',],
      /*
      grid sirve para dar más areal al lienzo de dibujo del gráfico ya que manipula los margin
      */
      //grid: {y: 20, y2:20, x2:30},
      xAxis: [{
        type: 'category',
        //boundaryGap: false,
        data: datosx//xData//trabajar con las fechas reales
      }],
      yAxis: [{
        type: 'value'
         }],
         series: data
       });

    

</script>
