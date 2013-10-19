<?php
namespace PariOuvert;


class UserManager extends \SimpleUser\UserManager
{
    protected function hydrateUser($data)
    {
        $user = new User($data['email']);

        $user->setId($data['id']);
        $user->setPassword($data['password']);
        $user->setSalt($data['salt']);
        $user->setName($data['name']);
        if ($roles = explode(',', $data['roles'])) {
            $user->setRoles($roles);
        }
        $user->setTimeCreated($data['time_created']);
        $user->setGain($data['gain']);
        return $user;

    }

}