<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();


//CONF
$app->register(new Silex\Provider\TwigServiceProvider(), array(
        'twig.path' => __DIR__.'/../src/views',
        'debug' => true,
));

$app->get('/index', function() use ($app) {
    return $app['twig']->render(
            "index.twig", array()
    );
});



$app->get('/hello', function() {
    return 'Hello!';
});

$app->run();
