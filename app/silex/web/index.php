<?php
$loader = require_once __DIR__.'/../vendor/autoload.php';
require_once __DIR__.'/../src/score.inc.php';
$loader->add("PariOuvert", "../src/lib/");

$app = new Silex\Application();
$app["config"] = require 'configApp.php';

if(file_exists("configAppDev.php")) {
    $configDev = require "configAppDev.php";
    if (is_array($configDev))
        $app['config'] = array_replace_recursive($app['config'], $configDev);
}

include 'config.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\Constraints as Assert;

$app->get('/', function() use ($app) {
    return $app['twig']->render(
        "index.twig", array("msg" => "hello")
    );
});

// page de pari
$app->get('/pari/{type}', function($type) use ($app) {
    $list = pariform();
    return $app['twig']->render(
                "formpari.twig", array("list" => $list, "user" => $app['user'])
    );
});

$app->post('/pari/{type}', function(Request $request) use ($app){

    $userId = $request->get('userid');

    $current_date = new DateTime();
    $current_date = $current_date->format('dd-mm-YYYY HH:ii');

    $parkingid = $request->get('parkingid');

    $datepari = $request->get('datepari');
    if(!preg_match('/^(0[1-9]|1[0-9]|2[0-9]|3[01])\/(0[1-9]|1[012])\/[0-9]{4}$/',$datepari)){
        return new Response("Il y a une erreur dans la date du pari !", 400);
    }

    $nbplaces = $request->get('nbplaces');
    $err_range = $app['validator']->validateValue($nbplaces, new Assert\Range(array('min' =>  0)));

    if (count($err_range) != 0 || !ctype_digit($nbplaces)){
        return new Response("Il y a une erreur dans le nombre de places !", 400);
    }

    $mise = $request->get('mise');
    $err_range = $app['validator']->validateValue($mise, new Assert\Range(array('min' =>  1)));

    if (count($err_range) != 0 || !ctype_digit($mise)){
        return new Response("Il y a une erreur dans la mise !", 400);
    }

    //everything seems OK, just commit to the db
    $app['db']->insert('pari_parking', array(
                         'user_id' => $userId,
                         'parking_id' => $parkingid,
                         'nb_place_pari' => $nbplaces,
                         'mise' => $mise,
                         'date_pari' => $datepari,
                         'date_create' => $current_date,
                         ));
    return new Response("Le pari a été enregistré !", 201);
  });

// page point
$app->get('/score', function() use ($app) {
    var_dump($app['user.manager']->getCurrentUser());
    return ($app['twig']->render("score.twig", scorePage($app)));
  });
$app->get('/score/{type}', function($type) use ($app) {
    return ($app['twig']->render("score.twig", scorePageType($app, $type)));
});


$app->run();

function pariform(){
    global $app;
    $p = $app['db']->fetchAll('SELECT * FROM parking');
    return $p;
}
