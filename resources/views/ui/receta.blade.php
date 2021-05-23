<div class="col-md-4 mt-4">
    <div class="card shadow">
        <img src="/storage/{{$receta->imagen}}" alt="{{$receta->titulo}}" class="card-img-top">
        <div class="card-body">
            <h3>{{$receta->titulo}}</h3>
            <div class="meta-receta d-flex justify-content-between">
                <p class="text-primary fecha">
                    <fecha-receta fecha="{{ $receta->created_at }}"></fecha-receta>
                </p>
                <p class="d-flex align-items-center">
                    <span class="clap-btn clap-active clap-small"></span>
                    {{count($receta->likes)}}
                    les gusta esta receta
                </p>
            </div>
            <div class="card-text">
                <p>{{ Str::words( strip_tags($receta->preparacion), 20 ) }}</p>
                <a href="{{ route('recetas.show', ['receta' => $receta->id]) }}" class="btn btn-primary d-block font-weight-bold uppercase">Ver Receta</a>
            </div>
        </div>
    </div>
</div>