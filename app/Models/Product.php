<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\SalesTransaction;
use App\Models\TransactionItems;
class Product extends Model
{
    protected $fillable = ['name','stock', 'price', 'created_at'];


    public function TransactionItems(){
        return $this->hasMany(TransactionItems::class,'id_sales', 'id');
    }
}
