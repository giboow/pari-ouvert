<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

$app->register(
    new Silex\Provider\DoctrineServiceProvider(),
    array(
        'db.options' => array(
            'driver'    => 'pdo_mysql',
            'host'      => '192.168.1.47',
            'dbname'    => 'pariouvert',
            'user'      => 'pariouvert',
            'password'  => 'pariouvert',
            'charset'   => 'utf8',
        ),
    )
);


//CONF
$app->register(
    new Silex\Provider\TwigServiceProvider(),
        array(
            'twig.path' => __DIR__.'/../src/views',
            'debug' => true,
    )
);

$app->get('/', function() use ($app) {
    return $app['twig']->render(
        "index.twig", array("msg" => "hello")
    );
});



// page de pari
$app->get('/pari/{type}', function($type) use ($app) {

});

// page point
$app->get('/score', function() {
    return 'Hello!';

});


$app->run();
