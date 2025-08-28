<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
use App\Models\SalesTransaction;
class TransactionItems extends Model
{
    protected $fillable = ['id_products', 'id_sales', 'quantity', 'price', 'subtotal', 'created_at'];

    public function Product(){
        return $this->belongsTo(Product::class, 'id_products', 'id');
    }

    public function SalesTransaction(){
        return $this->belongsTo(SalesTransaction::class, 'id_sales', 'id');
    }
}
