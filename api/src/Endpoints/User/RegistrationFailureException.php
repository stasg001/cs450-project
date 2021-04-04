<?php namespace App\Endpoints\User;

use App\Lib\Logger;
use App\Lib\Config;

final class RegistrationFailureException extends \Exception
{
    public function __construct($message = null, $code = 0, \Throwable $previous = null) {
        $logger = new Logger();
        $logger->error($message);

        $message = Config::Get("DEBUG", false)
            ? $message
            : "🔥 An unexpected error occurred. Come back soon!";

        parent::__construct($message, $code, $previous);
    }
}
