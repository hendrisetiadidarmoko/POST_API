<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;
class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Product::create([
            'name' => 'Tango Coklat',
            'stock' => 100,
            'price' => 3000,
        ]);

        Product::create([
            'name' => 'Aqua Botol 600ml',
            'stock' => 50,
            'price' => 4000,
        ]);

        Product::create([
            'name' => 'Nabati Keju',
            'stock' => 80,
            'price' => 2000,
        ]);

        Product::create([
            'name' => 'Nabati Coklat',
            'stock' => 60,
            'price' => 2000,
        ]);
        Product::create([
            'name' => 'Tango Coklat',
            'stock' => 60,
            'price' => 3000,
        ]);
    }
}
