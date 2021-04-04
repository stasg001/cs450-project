<?php declare(strict_types=1);
use Firebase\JWT\JWT;

use PHPUnit\Framework\TestCase;

use App\Lib\Config;
use App\Endpoints\User;
use App\Endpoints\User\RegisterUserInfo;

final class UserTest extends TestCase {
    public function testRegisterCreatesJwtWithGoodData(): void {
        $key = Config::get("JWT_SHARED_KEY", null, __DIR__ . "/testdata/config.php");

        $registerInfo = RegisterUserInfo::create("test", "hi@example.com", "Abc12345");
        $jwt = User::register($registerInfo);

        $this->assertTrue(
            array_key_exists(
                'uid',
                JWT::decode($jwt, 
                    $key,
                    array('HS256')
                )
            ),
        );
    }
}
