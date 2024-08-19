<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
class BlogController extends Controller
{
    //
    public function blog_details(Request $request){
        return Inertia::render('Frontend/BlogDetails/BlogDetails', [
            'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        ]);
    }
}
