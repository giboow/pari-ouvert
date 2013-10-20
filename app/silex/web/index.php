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

$app->get('/pari', function() use ($app){
    return $app['twig']->render(
            "pari.twig", array()
    );
});

// page de pari
$app->get('/pari/parking', function() use ($app) {
    $list = pariform();
    return $app['twig']->render(
                "formpari.twig", array("list" => $list, "user" => $app['user'])
    );
});


// page de pari
$app->get('/pari/troncon', function() use ($app) {
    $list = tronconlist();
    return $app['twig']->render(
                "tronconform.twig", array("list" => $list, "user" => $app['user'])
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

$app->match('/pari/troncon', function (Request $request) use ($app) {

    // some default data for when the form is displayed the first time
    $userId = $request->get('userid');
    $troncon_id = $request->get('troncon_id');

    $datecreate = new DateTime();
    $datepari = DateTime::createFromFormat('d/m/Y H:i', $request->get('datepari'));
    

    $tps_trajet_pari = $request->get('tps_trajet_pari');
    $err_range = $app['validator']->validateValue($tps_trajet_pari, new Assert\Range(array('min' =>  0)));

    if (count($err_range) != 0 || !ctype_digit($tps_trajet_pari)){
        $list = tronconlist();
        return $app['twig']->render(
            "tronconform.twig", array("list" => $list, "user" => $app['user']));
    }

    $mise = $request->get('mise');
    $err_range = $app['validator']->validateValue($mise, new Assert\Range(array('min' =>  1)));

    if (count($err_range) != 0 || !ctype_digit($mise)){
        $list = tronconlist();
        return $app['twig']->render(
            "tronconform.twig", array("list" => $list, "user" => $app['user']));
    }

    
    //everything seems OK, just commit to the db
    $app['db']->insert('pari_traffic', array(
                         'user_id' => $userId,
                         'troncon_id' => $troncon_id,
                         'tps_trajet_pari' => $tps_trajet_pari,
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

$app->get('/bet', function() use ($app) {
    $sql = "SELECT * FROM pari_bicloo JOIN bicloo ON bicloo.id = pari_bicloo.bicloo_id  WHERE date_pari IS NOT NULL AND user_id = ".$app['user.manager']->getCurrentUser()->getId()." ORDER BY date_pari";
    $bicloo = $app['db']->fetchAll($sql);

    $sql = "SELECT * FROM pari_parking JOIN parking ON parking.id = pari_parking.parking_id  WHERE date_pari IS NOT NULL AND user_id = ".$app['user.manager']->getCurrentUser()->getId()." ORDER BY date_pari";
    $parking = $app['db']->fetchAll($sql);


    $sql = "SELECT * FROM pari_traffic JOIN troncon ON troncon.id = pari_traffic.troncon_id  WHERE date_pari IS NOT NULL AND user_id = ".$app['user.manager']->getCurrentUser()->getId()." ORDER BY date_pari";
    $traffic = $app['db']->fetchAll($sql);
    return ($app['twig']->render("lastBet.twig", array("bicloo" => $bicloo, "parking" => $parking, "traffic" => $traffic)));
});


$app->run();

function pariform(){
    global $app;
    $p = $app['db']->fetchAll('SELECT * FROM parking');
    return $p;
}


function tronconlist(){
    global $app;
    $p = $app['db']->fetchAll('SELECT * FROM troncon');
    return $p;
}

