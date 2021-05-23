<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Perfil extends Model
{
    use HasFactory;

    // Relacion 1 a 1 | un perfil pertenece a un usuario
    public function usuario()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
