<?php

namespace App\Http\Controllers;

use App\Models\Receta;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function update(Receta $receta)
    {
        // Almacena los like de un usuario hacia las recetas
        return auth()->user()->likes()->toggle($receta);
    }
}
