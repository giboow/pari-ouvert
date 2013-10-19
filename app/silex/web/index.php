<?php

require_once __DIR__.'/../vendor/autoload.php';
require_once __DIR__.'/../src/score.inc.php';

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
$app->get('/score', function() use ($app) {
    return ($app['twig']->render("score.twig", scorePage($app)));
  });
$app->get('/score/{type}', function($type) use ($app) {
    return ($app['twig']->render("score.twig", scorePageType($app, $type)));
});


$app->run();
