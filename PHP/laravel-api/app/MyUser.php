<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MyUser extends Model
{
    protected $table = 'user';
    protected $primaryKey = "id";
}
