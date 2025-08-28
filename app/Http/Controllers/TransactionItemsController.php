<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TransactionItems;
use Illuminate\Database\Eloquent\ModelNotFoundException;
class TransactionItemsController extends Controller
{
    public function index(){
        $sales = TransactionItems::latest()->get();
        return response()->json([
            'success' => true,
            'data'    => $sales
        ], 200);
    }

    public function show($id){
        try {
            $transaction = TransactionItems::findOrFail($id);
    
            return response()->json([
                'success' => true,
                'data'    => $transaction
            ], 200);
    
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Data transaksi tidak ditemukan',
                'data'    => null
            ], 404);
        }
    }
}
