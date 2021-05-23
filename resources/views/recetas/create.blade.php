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
    <h2 class="text-center mb-5">Crea tu Nueva Receta</h2>
    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <form method="POST" action="{{ route('recetas.store') }}" novalidate enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="titulo">Titulo Receta</label>
                    <input type="text" 
                        name="titulo" 
                        class="form-control 
                            @error ('titulo') is-invalid @enderror" 
                        id="titulo" 
                        placeholder="Ej: Pescado Apanado"
                        value="{{ old('titulo') }}"   
                    />

                    @error('titulo')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="categoria">Categoria</label>
                    <select name="categoria_id" id="categoria" class="form-control @error ('categoria_id') is-invalid @enderror">
                        <option value="" disabled selected>-- seleccione --</option>
                        @foreach ($categorias as $categoria)
                            <option 
                                value="{{ $categoria->id }}" 
                                {{ old('categoria_id') == $categoria->id ? 'selected' : '' }}>
                            {{ $categoria->nombre }}</option>
                        @endforeach
                    </select>

                    @error('categoria_id')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="ingredientes">Ingredientes</label>

                    <input type="hidden" id="ingredientes" name="ingredientes" value="{{ old('ingredientes') }}">

                    <trix-editor class="form-control @error ('ingredientes') is-invalid @enderror" input="ingredientes"></trix-editor>

                    @error('ingredientes')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="preparacion">Proparaci&oacute;n</label>

                    <input type="hidden" id="preparacion" name="preparacion" value="{{ old('preparacion') }}">

                    <trix-editor class="@error ('preparacion') is-invalid @enderror" input="preparacion"></trix-editor>

                    @error('preparacion')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="imagen">Imagen</label>
                    <input type="file" name="imagen" id="imagen" class="form-control @error ('imagen') is-invalid @enderror">

                    @error('imagen')
                        <span class="invalid-feedback d-block" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Guardar Receta">
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
