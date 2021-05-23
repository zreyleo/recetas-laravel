@extends('layouts.app')

@section('styles')
<link 
    rel="stylesheet" 
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" 
    integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" 
    crossorigin="anonymous" referrerpolicy="no-referrer" />
@endsection

@section('hero')
    <div class="hero-categorias">
        <form class="container h-100" action="{{ route('recetas.search') }}">
            <div class="row h-100 align-items-center">
                <div class="col-md-4 texto-buscar">
                    <p class="display-4">Busca una Receta para cocinar</p>
                    <input type="search" name="buscar" placeholder="Ej: Camarón" class="form-control">
                </div>
            </div>
        </form>
    </div>
@endsection

@section('content')
    <div class="container nuevas-recetas">
        <h2 class="titulo-categoria text-uppercase mt-5 mb-4">Últimas Recetas</h2>

        <div class="owl-carousel owl-theme">
            @foreach ($nuevas as $receta)
                <div class="card">
                    <img src="/storage/{{$receta->imagen}}" alt="Imagen de receta" class="card-img-top">
                    <div class="card-body">
                        <h3>{{Str::title($receta->titulo)}}</h3>
                        <p>{{ Str::words( strip_tags($receta->preparacion), 20 ) }}</p>
                        <a href="{{ route('recetas.show', ['receta' => $receta->id]) }}" class="btn btn-primary d-block font-weight-bold uppercase">Ver Receta</a>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="container">
            <h2 class="titulo-categoria text-uppercase mt-5 mb-4">Recetas Más Valoradas</h2>

            <div class="row">
                @foreach ($votadas as $receta)
                    @include('ui.receta')
                @endforeach
            </div>
        </div>

        @foreach ($recetas as $key => $grupo)
            <div class="container">
                <h2 class="titulo-categoria text-uppercase mt-5 mb-4">{{str_replace('-', ' ',$key)}}</h2>

                <div class="row">
                    @foreach ($grupo as $recetas)
                        @foreach ($recetas as $receta)
                            @include('ui.receta')
                        @endforeach
                    @endforeach
                </div>
            </div>
        @endforeach
    </div>
@endsection
