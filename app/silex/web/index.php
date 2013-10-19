<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

include 'config.php';

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
