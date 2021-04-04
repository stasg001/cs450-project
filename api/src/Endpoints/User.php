<?php namespace App\Endpoints;

use Firebase\JWT\JWT;

use App\Lib\Db;
use App\Lib\Logger;
use App\Lib\Config;
use App\Types\Password;
use App\Types\EmailAddress;
use App\Endpoints\User\RegisterUserInfo;
use App\Endpoints\User\RegistrationFailureException;

final class User {
    private function __construct() {}

    private static function makeJwt(string $uid): string {
        $payload = array(
            "uid" => $uid
        );

        $key = Config::get('JWT_SHARED_KEY');
        return JWT::encode($payload, $key);
    }

    public static function register(RegisterUserInfo $userInfo): string {
        $logger = new Logger();
        $logger->info("registering your user: " . print_r($userInfo, true));

        // Insert into database
        $db = new Db();
        
        $insertQ = "INSERT INTO tbl_fact_users(name, email, password, department) VALUES (?, ?, ?, 1);";
        $stmt = $db->conn->prepare($insertQ);

        if (!$stmt) {
            $errMsg = sprintf("An error occurred preparing your query: %s - %s", $insertQ, $db->conn->error);
            throw new RegistrationFailureException($errMsg);
        }

        $executed = $stmt->bind_param(
            "sss", 
            $userInfo->name,
            $userInfo->email,
            $userInfo->password,
        ) && $stmt->execute() && $stmt->close();
        
        if (!$executed) {
            if (Self::errorIsEmailExists($db->conn->error_list[0]["errno"])) {
                $logger->info(sprintf(
                    "Existing user found checking password %s %s",
                    $userInfo->email,
                    $userInfo->password,
                ));
                
                // check if passwords match.
                // -> if so log the user in
                // else -> redirect to login with error email exists
                
                $selectEmailQ = "SELECT id, password FROM tbl_fact_users WHERE email=?";
                $stmt = $db->conn->prepare($selectEmailQ);
                
                if (!$stmt) {
                    $errMsg = sprintf("An error occurred preparing your query: %s, %s", $selectEmailQ, $db->conn->error);
                    throw new RegistrationFailureException($errMsg);
                }
                    
                $executed = $stmt->bind_param(
                    "s",
                    $userInfo->email,
                ) && $stmt->execute();
                    
                if (!$executed) {
                    throw new RegistrationFailureException($db->conn->error);
                }

                $stmt->bind_result($uid, $storedPassword);
                $stmt->fetch();

                $logger->info("GOT ID " . $uid);

                if ($userInfo->password->verifyhash($storedPassword)) {
                    $logger->info(sprintf(
                        "Found existing user (%s) with same password found. Logging in",
                        $userInfo->email
                    ));
                    return Self::makeJwt($uid);
                }

                throw new RegistrationFailureException("email exists");

                // User exists but passwords dont match
            } else {
                throw new RegistrationFailureException($db->conn->error);
            }
        }


        $uid = $db->conn->insert_id;
        $logger->info(sprintf("Make new user id: %d", $uid));
        return Self::makeJwt($uid);
    }

    private static function errorIsEmailExists(int $errorcode): bool {
        return $errorcode == 1062;
    }
}
