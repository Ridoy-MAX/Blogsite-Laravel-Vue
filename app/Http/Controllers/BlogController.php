<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Blog;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
class BlogController extends Controller
{
    //
    public function blog_details($slug){
        // dd($slug);
        $blogs = Blog::with('user')->where('slug',$slug)->first();
        $blogs->increment('view');

        return Inertia::render('Frontend/BlogDetails/BlogDetails', [
            'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'blogs' => $blogs,
        ]);
    }
    public function blog_delete($slug){
        // dd($slug);
        $blogs = Blog::with('user')->where('slug',$slug)->first();
        $blogs->delete();


    }

    public function blogs(Request $request)
    {
        $blogs = Blog::with('user')->get();
        return inertia('Admin/Blog/Blog', [
            'blogs' => $blogs,
        ]);
    }

    public function blogs_create(Request $request)
    {
        $blogs = Blog::get();
        return inertia('Admin/Blog/BlogCreate', [
            'blogs' => $blogs,
        ]);
    }

    public function blog_edit($slug)
    {
        $blogs = Blog::with('user')->where('slug',$slug)->first();
        return inertia('Admin/Blog/BlogEdit', [
            'blogs' => $blogs,
        ]);
    }
    public function blogs_update(Request $request ,$slug)
    {
        $blogs = Blog::with('user')->where('slug',$slug)->first();
        dd($request);
    }

    public function blogs_add(Request $request)
    {

        // return response()->json(['message' => 'Blog created successfully.']);

        $slug = Str::slug($request->title);

        if ($request->hasFile('image')) {
            $image = $request->file('image'); // Get the uploaded file
            $imageName = '/images/' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images'), $imageName);
        } else {
            return response()->json(['error' => 'Image not uploaded.'], 400);
        }





        // Create a new blog instance and save it to the database
        $blog = new Blog();
        $blog->user_id = Auth::id(); // Set the user_id to the authenticated user's ID
        $blog->slug = $slug; // Save the generated slug
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->status = $request->status;
        $blog->image = $imageName; // Save the image name
        $blog->save();

        return redirect()->route('blogs')->with('success', 'User deleted successfully.');
        // return response()->json(['message' => 'Blog created successfully.']);
    }
}
