<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class payment extends Model
{
    protected $table = 'payment';
    protected $primaryKey = "id";
    protected $fillable = array([
        "subscription_id",
        "amount",
        "expirationDate",
        "startDate"
    ]);
}
