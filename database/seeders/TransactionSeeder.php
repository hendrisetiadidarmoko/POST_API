<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\SalesTransaction;
use App\Models\TransactionItems;
class TransactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $sale = SalesTransaction::create([
            'cashier_name' => 'Zen',
            'payment' => 'cash',
            'total_amount' => 8000,
        ]);


        TransactionItems::create([
            'id_sales' => $sale->id,
            'id_products' => 1,
            'quantity' => 2,
            'price' => 3000,
            'subtotal' => 6000,
        ]);

        TransactionItems::create([
            'id_sales' => $sale->id,
            'id_products' => 3,
            'quantity' => 1,
            'price' => 2000,
            'subtotal' => 2000,
        ]);
    }
}
