<?php

function scorePage(&$app) {

  $sql = "SELECT users.name, users.gain FROM users WHERE users.gain > -1 ORDER BY users.gain";
  $users = $app['db']->fetchAll($sql);
  return (array("users" => $users));
}

function scorePageType($app, $type) {

  $table = "";
  if ($type == "parking")
    $table = "pari_parking";
  else if ($type == "trafic")
    $table = "pari_traffic";
  else
    $app->abort(404, "Unknown type contest.");

  $sql = "SELECT users.name, " . $table . ".gain FROM users JOIN " . $table . " ON users.id = " . $table . ".user_id WHERE " . $table . ".date_pari IS NOT NULL ORDER BY " . $table . ".gain";
  //$sql = "SELECT users.name, :table.gain FROM users JOIN :table ON users.id = :table.user_id WHERE :table.date_pari IS NOT NULL ORDER BY :table.gain";

  $users = $app['db']->fetchAll($sql);
  return (array("type" => $type, "users" => $users));
}