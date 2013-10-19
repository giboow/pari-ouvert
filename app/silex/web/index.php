<?php


$loader = require_once __DIR__.'/../vendor/autoload.php';
$loader->add("PariOuvert", "../src/lib/");
$app = new Silex\Application();
$app["config"] = require 'configApp.php';

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
$app->get('/score/{type}', function() {
    return 'Hello!';
});


$app->run();
