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
$app->get('/pari/parking', function() use ($app) {
    $list = pariform();
    return $app['twig']->render(
                "formpari.twig", array("list" => $list, "user" => $app['user'])
    );
});

$app->match('/pari/parking', function (Request $request) use ($app) {

    // some default data for when the form is displayed the first time
    $userId = $request->get('userid');
    $parkingid = $request->get('parkingid');

    $datecreate = new DateTime();
    $datepari = DateTime::createFromFormat('d/m/Y H:i', $request->get('datepari'));
    

    $nbplaces = $request->get('nbplaces');
    $err_range = $app['validator']->validateValue($nbplaces, new Assert\Range(array('min' =>  0)));

    if (count($err_range) != 0 || !ctype_digit($nbplaces)){
        $list = pariform();
        return $app['twig']->render(
            "formpari.twig", array("list" => $list, "user" => $app['user']));
    }

    $mise = $request->get('mise');
    $err_range = $app['validator']->validateValue($mise, new Assert\Range(array('min' =>  1)));

    if (count($err_range) != 0 || !ctype_digit($mise)){
        $list = pariform();
        return $app['twig']->render(
            "formpari.twig", array("list" => $list, "user" => $app['user']));
    }

    
    
    //everything seems OK, just commit to the db
    $app['db']->insert('pari_parking', array(
                         'user_id' => $userId,
                         'parking_id' => $parkingid,
                         'nb_place_pari' => $nbplaces,
                         'mise' => $mise,
                         'date_pari' => $datepari->format('Y-m-d H:i:s'),
                         'date_create' => $datecreate->format('Y-m-d H:i:s'),
                         ));
    return $app->redirect("/");
})
    ->method('POST') ;


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
