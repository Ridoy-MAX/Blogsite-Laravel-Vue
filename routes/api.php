<?php

use Illuminate\Http\Request;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

    Route::get('/user', function (Request $request) {
        return $request->user();
    })->middleware('auth:sanctum');





    //   blog lis 
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

    Route::get('Admin/blogs/list', [BlogController::class, 'api_blogs'])->name('blogs');

    // craete blog
    Route::post('Admin/blogs/add', [BlogController::class, 'api_blogs_add'])->name('blog.add');

    // blog edit
    Route::post('Admin/blogs/update', [BlogController::class, 'blogs_update'])->name('blog.update');

    // blog delete
    Route::get('/blog/delete/{slug}', [BlogController::class, 'api_blog_delete'])->name('blog.delete');