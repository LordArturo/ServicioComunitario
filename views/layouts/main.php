<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <?php //$this->registerCssFile("/css/style.css"); ?>
    <link rel="stylesheet" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/css/estilo.css">
    <script src="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/js/jquery.js"></script>
</head>
<body>
<?php $this->beginBody() ?>
<!--
<div class="wrap">
    <?php
    /*NavBar::begin([
        'brandLabel' => 'My Company',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'About', 'url' => ['/site/about']],
            ['label' => 'Contact', 'url' => ['/site/contact']],
            Yii::$app->user->isGuest ? (
                ['label' => 'Login', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post', ['class' => 'navbar-form'])
                . Html::submitButton(
                    'Logout (' . Yii::$app->user->identity->username . ')',
                    ['class' => 'btn btn-link']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();*/
    ?>
-->
<header class="container-fluid header">
            <div class="row">
                <div class="col-md-3" style="height:100%;">
                    <a href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/">
                    <div class="logo">
                    </div>
                    </a>
                </div>
                <div class="col-md-3 titulo">
                    <h1>Consejo Comunal<br>Gramalote<?php //echo Yii::$app->user->identity->getUsername()?></h1>
                </div>
                <div class="col-md-2 col-md-offset-4 text-center" style="height:100%;">
                    <div class="pull-right" style="margin-top:20px;">
                    <div>
                        <span class="glyphicon glyphicon-user" style="font-size:5em"></span>
                    </div>
                    <div style="margin-top:10px;">
                        <?php if(Yii::$app->user->isGuest){?>
                        <a href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/login" style="color:white;">Iniciar sesión</a>
                        <?php }else{ ?>
                        <a href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/logout" style="color:white;">Cerrar sesión</a>
                        <?php }?>
                    </div>
                    </div>
                </div>
            </div>
</header>
<?php /*
<!--
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>
-->
*/
?>
<section class="cuerpo container-fluid" >
            <div class="row">
                <!-- Menú de la página-->
                <div class="col-md-3">
                    <nav class="row">
                            <div class="text-center col-md-10 col-md-offset-1">
                                <ul class="nav" >
                                <?php if(Yii::$app->user->isGuest){?>
                                    <li >
                                        <a href='<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/mision' class="btn btn-danger opcion-menu">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-folder-open pull-left" style="font-size:1em"></span>
                                                Misión
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a href='<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/vision' class="btn btn-danger opcion-menu">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-eye-open pull-left" style="font-size:1em"></span>
                                                Visión
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a href='<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/contacto' class="btn btn-danger opcion-menu">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-envelope pull-left" style="font-size:1em"></span>
                                                Contacto
                                            </div>
                                        </a>
                                    </li>
                                <?php }else{?>
                                    <li >
                                        <a class="btn btn-danger opcion-menu" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/usuario/">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-user pull-left" style="font-size:1em"></span>
                                                Usuario
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="btn btn-danger opcion-menu" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/censo/">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-option-horizontal pull-left" style="font-size:1em"></span>
                                                Censo
                                            </div>
                                        </a>
                                    </li>
                                    <li >
                                        <a class="btn btn-danger opcion-menu" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/planilla/">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-file pull-left" style="font-size:1em"></span>
                                                Planilla
                                            </div>
                                        </a>
                                    </li>
                                    <!--
                                    <li >
                                        <a class="btn btn-danger opcion-menu" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/reporte/">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-list-alt pull-left" style="font-size:1em"></span>
                                                Reporte
                                            </div>
                                        </a>
                                    </li>
                                    -->
                                    <li >
                                        <a class="btn btn-danger opcion-menu" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/estadistica/">
                                            <div style="margin-top:10px;">
                                                <span class="glyphicon glyphicon-stats pull-left" style="font-size:1em"></span>
                                                Estadística
                                            </div>
                                        </a>
                                    </li>
                                    <?php }?>
                                </ul>
                            </div>
                        </nav>
                </div>
                <!-- Fin del menú-->
                <div class="col-md-9 cuerpo-contenido">
                    <div class="row">
                        <section class="col-md-12">
                            <div class="container-fluid">


                                <!-- INICIO DEL CUERPO PRINCIPAL -->
                                <?= $content ?>
                                <!-- FIN DEL CUERPO PRINCIPAL -->

                                
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
<!--
<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>
-->
<footer class="container-fluid footer">
            <div class="row">
                <nav class="col-md-3 col-md-offset-5" style="margin-top:40px;">
                    <div class="text-center">
                        <ul class="nav navbar-nav" >
                            <li >
                                <a class="nav-item" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/">Home</a>
                            </li>
                            <!--
                            <li >
                                <a class="nav-item" href="#">Mapa del sitio</a>
                            </li>
                            -->
                            <li >
                                <a class="nav-item" href="<?php echo Yii::$app->getUrlManager()->getBaseUrl();?>/site/contacto">Contacto</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
