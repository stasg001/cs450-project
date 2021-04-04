<?php
return [
    'LOG_PATH' => __DIR__ . '/logs',
    'LOG_REQUESTS' => true,
    'JWT_KEY' => getenv('JWT_SHARED_KEY'),
    'JWT_ALGO' => getenv('JWT_ALGO'),
    'DB_INFO' => array(
        'HOST' => getenv('MYSQL_HOST'),
        'NAME' => getenv('MYSQL_DATABASE'),
        'USER' => getenv('MYSQL_USER'),
        'PASSWORD' => getenv('MYSQL_PASSWORD'),
    ),
    'DEBUG' => true,
];
