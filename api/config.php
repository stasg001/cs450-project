<?php
return [
    'LOG_PATH' => __DIR__ . '/logs',
    'LOG_REQUESTS' => true,
    'JWT_KEY' => getenv('JWT_SHARED_KEY'),
    'JWT_ALGO' => getenv('JWT_ALGO'),
];
