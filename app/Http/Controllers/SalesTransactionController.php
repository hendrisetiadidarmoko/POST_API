<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SalesTransaction;
use App\Models\Product;
use App\Models\TransactionItems;
use Illuminate\Support\Facades\DB;
use Mockery\Expectation;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Validation\ValidationException;

class SalesTransactionController extends Controller
{
    //menampilkan sales transaction
    public function index(){
        $sales = SalesTransaction::latest()->get();
        return response()->json([
            'success' => true,
            'data'    => $sales
        ], 200);
    }

    //menampilkan menurut id
    public function show($id){
        try {
            $sales = SalesTransaction::findOrFail($id);
    
            return response()->json([
                'success' => true,
                'data'    => $sales
            ], 200);
    
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
                'data'    => null
            ], 404);
        }
    }

    //menampilkan transaksinya
    public function showTransaction(){
        try {
            $transaction = SalesTransaction::with('transactionItems.product')->get();
    
            return response()->json([
                'success' => true,
                'data'    => $transaction
            ], 200);
    
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
                'data'    => null
            ], 404);
        }
    }

    //menampiilkan transaksi menurut id
    public function showTransactionId($id){
        try {
            $transaction = SalesTransaction::with('transactionItems.product')->findOrFail($id);
    
            return response()->json([
                'success' => true,
                'data'    => $transaction
            ], 200);
    
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan',
                'data'    => null
            ], 404);
        }
    }

    //membuat transaksi
    public function store(Request $request){
        try {
            $validated = $request->validate([
                'cashier_name' => 'required|max:50',
                'payment' => 'required|in:cash,card,wallet',
                'product' => 'required|array',
                'product.*.id' => 'required|numeric',
                'product.*.quantity' => 'required|numeric',
            ]);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors' => $e->errors()
            ], 422);
        }
        DB::beginTransaction();
        try{
            $sale = SalesTransaction::create([
                'cashier_name' => $validated['cashier_name'],
                'total_amount' => 0,
                'payment' => $validated['payment'],
            ]);
            $total = 0;
            foreach($validated['product'] as $items){
                $product = Product::findOrFail($items['id']);

                if($product->stock  < $items['quantity']){
                    return response()->json([
                        'success' => false,
                        'message' => "Stok produk {$product ->name} tidak mencukupi",
                    ], 400);
                }

                $subtotal = $items['quantity'] * $product->price;
                $total += $subtotal;

                TransactionItems::create([
                    'id_products'=> $product->id,
                    'id_sales' => $sale->id,
                    'quantity' => $items['quantity'],
                    'price' => $product->price,
                    'subtotal' => $subtotal,
                ]);
            }

            $sale->update([
                'total_amount' => $total,
            ]);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'Transaksi telah berhasil',
                'data' => $sale->load('transactionItems')
            ],201);

        } catch(\Exception  $e){
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Transaksi gagal',
            ],500);
        }
    }
}
