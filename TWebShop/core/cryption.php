<?php
define("T_CRYPTION_DEFAULT_KEY", "");
define("T_CRYPTION_DEFAULT_FILE", "cryption.sig");

class tcryption {

    static private $instance = NULL;
    private $key = "";
    private $init = "\0\0\0\0\0\0\0\0";
    private $encrypt = "";
    private $decrypt = "";

    const CLASS_NAME = "PHP5CLASS T_CRYPTION";

    public function __construct($key) {
        $this->key = ($key == "") ? $this->readKeyFromFile(T_CRYPTION_DEFAULT_FILE) : $key;
        $this->initiate();
    }

    static public function create($key = T_CRYPTION_DEFAULT_KEY) {
        if (!self::$instance) {
            self::$instance = new tcryption($key);
        }
        return self::$instance;
    }

    private function initiate() {
        $i = "\0\0\0\0\0\0\0\0";
        $this->init = ($this->key != "") ? mcrypt_encrypt(MCRYPT_BLOWFISH, $this->key, $i, MCRYPT_MODE_ECB, $i) : $this->init;
    }

    public function readKeyFromFile($file) {
        if (file_exists($file)) {
            $this->key = file_get_contents($file);
            $this->initiate();
        }
        return $this->key;
    }

    public function encrypt($enc) {
        $this->encrypt = $enc;
        $str = $enc;
        $str = mcrypt_encrypt(MCRYPT_BLOWFISH, $this->key, $str, MCRYPT_MODE_cfb, $this->init );
        $str = base64_encode($str);
        $str = urlencode($str);
        return $str;
    }

    public function decrypt($dec) {
        $this->decrypt = $dec;
        $str = $dec;
        // URLDECODE wird von PHP oder APACHE erledigt, DARF NICHT mehr durchgeführt werden
        $str = base64_decode($str);
        $str = mcrypt_decrypt(MCRYPT_BLOWFISH, $this->key, $str, MCRYPT_MODE_cfb, $this->init );
        return $str;
    }

    public function getEncrypt() {
        return $this->encrypt;
    }

    public function getDecrypt() {
        return $this->decrypt;
    }

    public function __toString() {
        return self::CLASS_NAME;
    }

}
?>