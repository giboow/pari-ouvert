<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

include 'config.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

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
    $current_date = $current_date->format('dd-mm-YYYY');
    $datepari = $request->get('datepari');
    $parkingid = $request->get('parkingid');
    $nbplaces = $request->get('nbplaces');

    $app['db']->insert('pari_parking', array(
					     'user_id' => $userId,
					     'parking_id' => $parkingid,
					     'nb_place_pari' => $nbplaces,
					     'date_pari' => $datepari,
					     'date_create' => $current_date,
					     
					     ));
    
    return new Response("Le pari a été enregistré !", 201);
  });

// page point
$app->get('/score', function() {
    return 'Hello!';
});
$app->get('/score/{type}', function() {
    return 'Hello!';
});


$app->run();

function pariform(){
    global $app;
    $p = $app['db']->fetchAll('SELECT * FROM parking');
    return $p;
}
