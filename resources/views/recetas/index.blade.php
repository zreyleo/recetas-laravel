@extends('layouts.app')

@section('botones')
    @include('ui.navegacion')
@endsection

@section('content')
    <h2 class="text-center mb-5">Administra tus Recetas</h2>

    <div class="col-md-12 mx-auto bg-white p-3">
        <table class="table">
            <thead class="bg-primary text-light">
                <tr>
                    <th scope="col" class="text-center">T&iacute;tulo</th>
                    <th scope="col" class="text-center">Categor&iacute;a</th>
                    <th class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($recetas as $receta)    
                    <tr>
                        <td>{{ $receta->titulo }}</td>
                        <td>{{ $receta->categoria->nombre }}</td>
                        <td class="d-flex justify-content-center">
                            <eliminar-receta receta-id="{{ $receta->id }}"></eliminar-receta>
                            <a href="{{ route('recetas.edit', ['receta' => $receta->id]) }}" class="btn btn-dark mr-1 flex-grow-1">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 icono-small" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                </svg>
                                Editar
                            </a>
                            <a href="{{ route('recetas.show', ['receta' => $receta->id]) }}" 
                                class="btn btn-success flex-grow-1 d-flex align-items-center justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 icono-small mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                  </svg>
                                Ver
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="col-12 mt-4 d-flex justify-content-center">
            {{ $recetas->links() }}
        </div>

        @if (count($usuario->likes) > 0)
            <h2 class="text-center my-5">Recetas que me gustan:</h2>
            <div class="col-md-7 mx-auto bg-white p-3">
                <ul class="list-group">
                    @foreach ($usuario->likes as $receta)
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <p>{{$receta->titulo}}</p>
                            <a href="{{ route('recetas.show', ['receta' => $receta->id]) }}" 
                                class="btn btn-outline-success d-flex align-items-center justify-content-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-1 icono-small" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                                </svg>
                                Ver
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>
        @endif
    </div>
@endsection
