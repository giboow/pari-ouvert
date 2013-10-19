<?php
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

$app->register(new Silex\Provider\ValidatorServiceProvider());



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



$app->register(
        new Silex\Provider\TwigServiceProvider(),
        array(
                'twig.path' => __DIR__.'/../src/views',
                'debug' => true,
        )
);

$userServiceProvider = new SimpleUser\UserServiceProvider();
$app->register($userServiceProvider);
$app['user.controller']->setTemplates(
    array(
        "login" => "user/login.twig",
        "register" => "user/register.twig",
        "list" => "user/list.twig",
        "view" => "user/view.twig",
        "edit" => "user/edit.twig",
    )
);
$app->mount('/user', $userServiceProvider);


