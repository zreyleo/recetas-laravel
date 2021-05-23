@extends('layouts.app')

@section('styles')
<link rel="stylesheet" 
    href="https://cdnjs.cloudflare.com/ajax/libs/trix/1.3.1/trix.min.css" 
    integrity="sha512-5m1IeUDKtuFGvfgz32VVD0Jd/ySGX7xdLxhqemTmThxHdgqlgPdupWoSN8ThtUSLpAGBvA8DY2oO7jJCrGdxoA==" 
    crossorigin="anonymous" />
@endsection

@section('botones')
    @include('ui.volver')
@endsection

@section('content')
    <h1 class="text-center">Editar mi Perfil</h1>

    <div class="row justify-content-center mt-5">
        <div class="col-md-10 bg-white p-3">
            <form action="{{ route('perfiles.update', ['perfil' => $perfil->id]) }}"
                method="POST"
                enctype="multipart/form-data"
            >
                @csrf
                @method('PUT')

                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" 
                        name="nombre" 
                        class="form-control 
                            @error ('nombre') is-invalid @enderror" 
                        id="nombre" 
                        placeholder="Tu Nombre"
                        value="{{ $perfil->usuario->name }}"   
                    />

                    @error('nombre')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="url">Sitio web</label>
                    <input type="text" 
                        name="url" 
                        class="form-control 
                            @error ('url') is-invalid @enderror" 
                        id="url" 
                        placeholder="Ej: www.tu-pagina-web.com | Tu Facebook | Tu Instagram"
                        value="{{ $perfil->usuario->url }}"   
                    />

                    @error('url')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="biografia">Biograf&iacute;a</label>

                    <input type="hidden" id="biografia" name="biografia" value="{{ $perfil->biografia }}">

                    <trix-editor class="form-control @error ('biografia') is-invalid @enderror" input="biografia"></trix-editor>

                    @error('biografia')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="imagen">Tu Imagen</label>
                    <input type="file" name="imagen" id="imagen" class="form-control @error ('imagen') is-invalid @enderror">

                    @if ($perfil->imagen)
                        
                    @endif
                    <div class="mt-4">
                        <p>Imagen actual:</p>
                        <img src="/storage/{{$perfil->imagen}}" style="width: 300px">
                    </div>

                    @error('imagen')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Actualizar Perfil">
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/trix/1.3.1/trix.js" 
    integrity="sha512-/1nVu72YEESEbcmhE/EvjH/RxTg62EKvYWLG3NdeZibTCuEtW5M4z3aypcvsoZw03FAopi94y04GhuqRU9p+CQ==" 
    crossorigin="anonymous"
    defer></script>
@endsection