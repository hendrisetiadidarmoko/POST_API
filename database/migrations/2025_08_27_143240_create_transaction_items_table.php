<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transaction_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_products');
            $table->unsignedBigInteger('id_sales');
            $table->integer('quantity');
            $table->decimal('price', 12,2);
            $table->decimal('subtotal',12,2);
            $table->timestamps();

            $table->foreign('id_products')->references('id')->on('products')->onDelete('cascade');
            $table->foreign('id_sales')->references('id')->on('sales_transactions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaction_items');
    }
};
