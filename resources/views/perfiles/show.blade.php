@extends('layouts.app')

@section('botones')
    @include('ui.volver')
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                @if ($perfil->imagen)
                    <img src="/storage/{{$perfil->imagen}}" alt="Imagen de perfil" class="w-100 rounded-circle">
                @endif
            </div>
            <div class="col-md-7">
                <h2 class="text-center mb-2 text-primary">
                    {{$perfil->usuario->name}}
                </h2>
                <a href=""></a>
                <div class="biografia">
                    {!! $perfil->biografia !!}
                </div>
            </div>
        </div>
    </div>
    <h2 class="my-5 text-center">Mis Recetas</h2>
    <div class="container">
        <div class="row mx-auto bg-white p-4">
            @if (count($recetas) > 0)
                @foreach ($recetas as $receta)
                    <div class="col-md-4 mb 4">
                        <div class="card">
                            <img src="/storage/{{$receta->imagen}}" alt="imagen receta" class="card-img-top">
                            <div class="card-body">
                                <h3>{{$receta->titulo}}</h3>
                                <a href="{{ route('recetas.show', ['receta' => $receta->id]) }}" class="btn btn-primary d-block mt-3 uppercase font-weight-bold">Ver Receta</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <p class="text-center w-100">No hay recetas a&uacute;n...</p>
            @endif

        </div>
        <div class="d-flex justify-content-center">{{$recetas->links()}}</div>
    </div>
@endsection