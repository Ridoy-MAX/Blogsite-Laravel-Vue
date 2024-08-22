<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\HomeController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;



Route::get('/', [HomeController::class, 'home'])->name('home');

Route::get('/blog/details/{slug}', [BlogController::class, 'blog_details'])->name('blog.details');


// Route::get('', function () {
//     return Inertia::render('Admin/Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    //user profile 
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');


    // user mangement
    Route::get('Admin/dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
    Route::get('Admin/dashboard/block/user', [HomeController::class, 'block_users'])->name('block.user');
    Route::post('Admin/user/unblock/{id}', [HomeController::class, 'users_unblock'])->name('users.unblock');
    Route::put('users/{user}', [HomeController::class, 'update'])->name('users.update');
    Route::delete('users/{user}', [HomeController::class, 'destroy'])->name('users.destroy');

    // blog management
    Route::get('Admin/blogs/list', [BlogController::class, 'blogs'])->name('blogs');
    Route::get('Admin/blogs/create', [BlogController::class, 'blogs_create'])->name('blog.create');
    Route::put('Admin/blogs/update/{slug}', [BlogController::class, 'blogs_update'])->name('blog.update');

    Route::post('Admin/blogs/add', [BlogController::class, 'blogs_add'])->name('blog.add');
    Route::get('/blog/delete/{slug}', [BlogController::class, 'blog_delete'])->name('blog.delete');
    Route::get('/blog/edit/{slug}', [BlogController::class, 'blog_edit'])->name('blog.edit');
    // home page

});

require __DIR__.'/auth.php';
