<?php

namespace App\Http\Controllers;

use App\Models\Receta;
use App\Models\Categoria;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    /* public function __construct()
    {
        $this->middleware('auth');
    } */

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // $votadas = Receta::has('likes', '>', 0)->get();
        $votadas = Receta::withCount('likes')->orderBy('likes_count', 'DESC')->take(3)->get();

        // $nuevas = Receta::orderBy('created_at', 'DESC')->get();
        $nuevas = Receta::latest()->take(5)->get();

        $categorias = Categoria::all();


        $recetas = [];

        foreach ($categorias as $categoria) {
            $recetas[Str::slug($categoria->nombre)][] = Receta::where('categoria_id', $categoria->id)->take(3)->get();
        }

        return view('home', compact('nuevas', 'recetas', 'votadas'));
    }
}
