<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\TransactionItems;
class SalesTransaction extends Model
{
    
    protected $fillable = ['cashier_name','total_amount', 'payment'];

    public function transactionItems(){
        return $this->hasMany(TransactionItems::class,'id_sales', 'id');
    }
}
