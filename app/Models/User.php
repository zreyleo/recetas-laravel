<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'url'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Como hacer para crear un perfil cuando se registra un usuario
    protected static function boot()
    {
        parent::boot();

        // Asignar un perfil al crear el usuario
        static::created(function ($user) {
            $user->perfil()->create();
        });
    }

    // Relacion de 1 a mucho | un usuario puede tener varias recetas
    public function recetas()
    {
        return $this->hasMany(Receta::class);
    }

    // Relacion de 1 a 1 | un usuario tiene un perfil
    public function perfil()
    {
        return $this->hasOne(Perfil::class);
    }

    // Revisa los likes que tiene una receta
    public function likes()
    {
        return $this->belongsToMany(Receta::class, 'likes_receta');
    }
}
