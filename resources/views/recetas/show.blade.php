@extends('layouts.app')

@section('content')
    <article class="contenido-receta bg-white shadow p-5">
        <h1 class="text-center mb-4">{{ $receta->titulo }}</h1>

        <div class="imagen-receta">
            <img src="/storage/{{ $receta->imagen }}" alt="{{ $receta->titulo }}" class="w-100">
        </div>

        <div class="receta-meta mt-2">
            <p class="mt-3">
                <span class="font-weight-bold text-primary">Categoría:</span>
                <a class="text-dark" href="{{ route('categorias.show', ['categoria' => $receta->categoria_id]) }}">{{ $receta->categoria->nombre }}</a>
            </p>

            <p>
                <span class="font-weight-bold text-primary">Autor:</span>
                <a class="text-dark" href="{{ route('perfiles.show', ['perfil' => $receta->user_id]) }}">{{ $receta->autor->name }}</a>
            </p>

            <p>
                <span class="font-weight-bold text-primary">Fecha de Publicaci&oacute;n:</span>
                <fecha-receta fecha="{{ $receta->created_at }}"></fecha-receta>
            </p>

            

            <div class="ingredientes">
                <h2 class="my-3 text-primary">Ingredientes</h2>
                {!! $receta->ingredientes !!}
            </div>

            <div class="preparacion">
                <h2 class="my-3 text-primary">Preparaci&oacute;n</h2>
                {!! $receta->preparacion !!}
            </div>
            <div class="justify-content-center row text-center">
                <clap-button receta-id="{{$receta->id}}" like="{{$like}}" likes="{{$likes}}"></clap-button>
            </div>
        </div>
    </article>
@endsection