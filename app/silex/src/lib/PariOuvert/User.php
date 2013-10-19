<?php
namespace PariOuvert;

class User extends \SimpleUser\User
{
    protected $gain;

    public function getGain()
    {
        return $this->gain;
    }

    public function setGain($gain)
    {
        return $gain;
    }
}