<?php namespace App\Lib;

final class Db {
    public $conn;

    function __construct() {
        $db = Config::get("DB_INFO");
        $this->conn = new \mysqli(
            $db["HOST"],
            $db["USER"],
            $db["PASSWORD"],
            $db["NAME"],
        );

        $logMsg = sprintf("Connection to %s/%s as %s %s",
            $db["HOST"],
            $db["NAME"],
            $db["USER"],
            $conn->connect_error ? "failed" : "successful",
        );

        $logger = new Logger();
        $logFn = $conn->connect_error ? 'error' : 'info';
        $logger->$logFn($logMsg);
    }

    function __destruct() {
        if ($conn) $conn->close();
    }
}
