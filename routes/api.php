<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SalesTransactionController;
use App\Http\Controllers\TransactionItemsController;


//Route produk CRUD
Route::get('/product', [ProductController::class, 'index'])->name('product');

Route::post('/product', [ProductController::class, 'store'])->name('product.store');

Route::get('/product/{id}', [ProductController::class, 'show'])->name('product.show');

Route::put('/product/{id}', [ProductController::class, 'update'])->name('product.update');

Route::delete('/product/{id}', [ProductController::class, 'delete'])->name('product.delete');


//Route menampilkan sales transaction
Route::get('/sales',[SalesTransactionController::class, 'index'])->name('sales');

Route::get('/sales/{id}',[SalesTransactionController::class, 'show'])->name('sales.show');

//Route transaksi

Route::post('/transaction',[SalesTransactionController::class, 'store'])->name('transaction');

Route::get('/transaction-show',[SalesTransactionController::class, 'showTransaction'])->name('transaction.show');

Route::get('/transaction-show/{id}',[SalesTransactionController::class, 'showTransactionId'])->name('transaction.show.id');


//Route menampilkan table transaksi item
Route::get('/transaction-items',[TransactionItemsController::class, 'index'])->name('transaction.items');
Route::get('/transaction-items/{id}',[TransactionItemsController::class, 'show'])->name('transaction.items.show');