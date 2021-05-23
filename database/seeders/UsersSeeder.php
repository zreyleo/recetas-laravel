<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Regynald',
            'email' => 'correo@correo.com',
            'password' => Hash::make('123456789'),
            'url' => 'http://zreyleo-code.com',
        ]);

        User::create([
            'name' => 'Leonardo',
            'email' => 'correo2@correo.com',
            'password' => Hash::make('123456789')
        ]);

        // seed sin model
        /* DB::table('users')->insert([
            'name' => 'Regynald',
            'email' => 'correo@correo.com',
            'password' => Hash::make('123456789'),
            'url' => 'http://zreyleo-code.com',
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]); */
    }
}
