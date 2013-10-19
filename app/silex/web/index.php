<?php

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();

$app->register(
        new Silex\Provider\DoctrineServiceProvider(),
        array(
                'db.options' => array(
                        'driver'    => 'pdo_mysql',
                        'host'      => '192.168.1.47',
                        'port'		=> '5700',
                        'dbname'    => 'pariouvert',
                        'user'      => 'pariouvert',
                        'password'  => 'pariouvert',
                        'charset'   => 'utf8',
                ),
        )
);


$app->register(new Silex\Provider\SecurityServiceProvider(), array(
        'security.firewalls' => array(
            'secured_area' => array(
                'pattern' => '^.*$',
                'anonymous' => true,
                'form' => array(
                    'login_path' => '/user/login',
                    'check_path' => '/user/login_check',
                 ),
                 'logout' => array(
                     'logout_path' => '/user/logout',
                ),
                'users' => $app->share(function($app) { return $app['user.manager']; }
            ),
        ),
    ),
));


$userServiceProvider = new SimpleUser\UserServiceProvider();
$app->register($userServiceProvider);
$app['user.controller']->setTemplates(
    array(
        "login" => "user/login.twig",
        "register" => "user/register.twig"
    )
);



$app->register(
    new Silex\Provider\SessionServiceProvider()
);
$app->register(
    new Silex\Provider\ServiceControllerServiceProvider()
);
$app->register(
    new Silex\Provider\UrlGeneratorServiceProvider()
);

$app->register(
    new Silex\Provider\RememberMeServiceProvider()
);



$app->mount('/user', $userServiceProvider);

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
