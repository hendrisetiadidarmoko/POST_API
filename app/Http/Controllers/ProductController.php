<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Database\Eloquent\ModelNotFoundException;
class ProductController extends Controller
{
    protected function rules(){
        return [
            'name' => 'required|string|max:50',
            'stock' => 'required|numeric|min:0',
            'price' => 'required|numeric|min:0',
        ];
    }
    public function index(){
        $product = Product::latest()->get();
        return response()->json([
            'success' => true,
            'data'    => $product
        ], 200);
    }


    public function show($id){
        try {
            $product = Product::findOrFail($id);
    
            return response()->json([
                'success' => true,
                'data'    => $product
            ], 200);
    
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Produk tidak ditemukan',
                'data'    => null
            ], 404);
        }
    }

    public function store(Request $request){
        $validated = $request->validate($this->rules());
        
        $product = Product::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'Produk telah tersimpan',
            'data' => $product
        ],201);
    }

    public function update(Request $request, $id){
        try{
            $validated = $request->validate($this->rules());

            $product = Product::findOrFail($id);
            $product ->update($validated);

            return response()->json([
                'success' => true,
                'message' => 'Produk telah diperbarui',
                'data' => $product,
            ],200);
        }
        catch(ModelNotFoundException $e){
            return response()->json([
                'success' => false,
                'message' => 'Produk tidak ditemukan',
                'data'=> null,
            ],404);
        }
    }

    public function delete($id){
        try{
            $product = Product::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'Produk telah terhapus',
                'data' => $product
            ],200);
        }
        catch(ModelNotFoundException $e){
            return response()->json([
                'success' => false,
                'message' => 'Produk tidak ditemukan',
                'data'=> null,
            ],404);
        }
    }
}
