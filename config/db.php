<?php
class Connect extends PDO
{
    public function __construct()
    {
        parent::__construct("mysql:host=localhost;dbname=u750269652_tabiri", 'u750269652_tabiri', 'Tabiri@2023');
    $this->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $this->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    }
}
?>