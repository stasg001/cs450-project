<?php declare(strict_types=1);
namespace App\Types;

final class Password {
    private const MIN_LENGTH = 4;
    private $hashed;
    private $plain;

    public static function fromString($plaintext): self {
        self::validatePassword($plaintext);
        return new Password($plaintext, password_hash($plaintext, PASSWORD_DEFAULT));
    }

    private function __construct(string $plain, string $hashed) {
        $this->plain = $plain;
        $this->hashed = $hashed;
    }

    public function verifyHash(string $hash): bool {
        return password_verify($this->plain, $hash);
    }

    private static function validatePassword($password) {
        if (strlen($password) < self::MIN_LENGTH) {
            throw new \InvalidArgumentException(
                sprintf(
                    "%d characters is too few characters",
                    strlen($password)
                )
            );
        }
    }

    public function __toString() {
        return $this->hashed;
    }
}
