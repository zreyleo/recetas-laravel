<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Receta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class RecetaController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth', ['except' => ['show', 'search']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $recetas = auth()->user()->recetas;
        $usuario = auth()->user();

        $recetas = Receta::where('user_id', $usuario->id)->paginate(10);

        return view('recetas.index')
            ->with('recetas', $recetas)
            ->with('usuario', $usuario);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // $categorias = DB::table('categorias')->get()->pluck('nombre', 'id');

        $categorias = Categoria::all(['id', 'nombre']);

        return view('recetas.create')->with('categorias', $categorias);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // dd($request['imagen']->store('uploads-recetas', 'public'));
        $data = request()->validate([
            'titulo' => 'required|min:6',
            'categoria_id' => 'required',
            'ingredientes' => 'required',
            'preparacion' => 'required',
            'imagen' => 'required|image'
        ]);

        $ruta_imagen = $request['imagen']->store('uploads-recetas', 'public');

        $img = Image::make(public_path("storage/{$ruta_imagen}"))->fit(1000, 500);
        $img->save();

        // Guardar en la base de datos sin utilizar model
        /* DB::table('recetas')->insert([
            'titulo' => $data['titulo'],
            'ingredientes' => $data['ingredientes'],
            'preparacion' => $data['preparacion'],
            'imagen' => $ruta_imagen,
            'categoria_id' => $data['categoria_id'],
            'user_id' => Auth::user()->id,
        ]); */

        // Guardar en la base de datos con model
        auth()->user()->recetas()->create([
            'titulo' => $data['titulo'],
            'ingredientes' => $data['ingredientes'],
            'preparacion' => $data['preparacion'],
            'imagen' => $ruta_imagen,
            'categoria_id' => $data['categoria_id'],
        ]);

        // Redireccionar
        return redirect()->action('RecetaController@index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function show(Receta $receta)
    {
        // Obtener si el usuario autenticado le gusta la receta mostrada
        $like = (auth()->user() ? auth()->user()->likes->contains($receta->id) : false);
        $likes = $receta->likes->count();
        return view('recetas.show', compact('receta', 'like', 'likes'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function edit(Receta $receta)
    {
        $this->authorize('view', $receta);
        $categorias = Categoria::all(['id', 'nombre']);
        return view('recetas.edit', compact('categorias', 'receta'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Receta $receta)
    {
        $this->authorize('update', $receta);

        $data = request()->validate([
            'titulo' => 'required|min:6',
            'categoria_id' => 'required',
            'ingredientes' => 'required',
            'preparacion' => 'required'
        ]);

        $receta->titulo = $data['titulo'];
        $receta->categoria_id = $data['categoria_id'];
        $receta->ingredientes = $data['ingredientes'];
        $receta->preparacion = $data['preparacion'];

        if (request('imagen')) {
            $ruta_imagen = $request['imagen']->store('uploads-recetas', 'public');

            $img = Image::make(public_path("storage/{$ruta_imagen}"))->fit(1000, 500);
            $img->save();

            $receta->imagen = $ruta_imagen;
        }

        $receta->save();
        return redirect()->action('RecetaController@index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Receta $receta)
    {
        // Ejecutar el policy
        $this->authorize('delete', $receta);

        // Eliminar receta
        $receta->delete();
        return redirect()->action('RecetaController@index');
    }

    public function search(Request $request)
    {
        $busqueda = $request['buscar'];

        $recetas = Receta::where('titulo', 'like', '%' . $busqueda . '%')->paginate(6);
        $recetas->appends(['buscar' => $busqueda]);

        return view('recetas.search', compact('recetas', 'busqueda'));
    }
}
