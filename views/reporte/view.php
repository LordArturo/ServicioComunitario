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
<script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/dist/jspdf.debug.js"></script>
<script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/plugins/addimage.js"></script>
<script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/html2canvas.js"></script>
<script type="text/javascript" src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/libs/png_support/zlib.js"></script>
<script type="text/javascript" src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/libs/png_support/png.js"></script>
<script type="text/javascript" src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jsPDF/plugins/png_support.js"></script>
<script type="text/javascript" src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/FileSaver/FileSaver.js"></script>
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
      legend: {
                x: 100,
                y: 0,
                data: datosx
              },
      calculable: true,
      toolbox: {
                 show : true,
                 feature : {
                     mark : {show: false},
                     dataZoom : {show: false},
                     dataView : {show: false},
                     magicType : {
                                   show: true,
                                   title: {line: 'Línea', bar: 'Barras'},
                                   type: ['line', 'bar']
                                },
                     saveAsImage : {show: true, title: 'Guardar Imagen'}
                 }
              },
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


var imagenes = [];

$("#echart_line canvas").each(function(){
    imagenes.push($(this)[0]);
    });

var doc = new jsPDF('p', 'mm');
                doc.setFont("helvetica");
                doc.setFontType("bold");
                doc.setFontSize(12);

    //titulo del pdf
    /*var text = prompt("Título", "");
    if(text == null)
      text = "";
    doc.text(5, 10, text);
    doc.setFontSize(10);*/


html2canvas(imagenes, {
            onrendered: function(canvas) {
                var y = 0;
                var p = 0;
                for (var i = 0; i < imagenes.length; i++) {         
                var imgData = imagenes[i].toDataURL(
                    'image/png');   


                pageHeight= doc.internal.pageSize.height;
                pageWidth= doc.internal.pageSize.width;
                // Before adding new contentx
                y = y + 30; // Height position of new content
                doc.text(5, y+10, "Gráfico:");
                doc.addImage(imgData, 'PNG', 10, y, pageWidth*0.90, (pageHeight / 2)-50);
                //doc.save('reporte.pdf');
            }
        }});  

    

</script>
