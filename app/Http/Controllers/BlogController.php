<?php

namespace App\Http\Controllers;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Blog;
use App\Models\Tag;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Storage; // Import Storage facade

class BlogController extends Controller
{
    //
    public function blog_details($slug){
        // dd($slug);
        $blogs = Blog::with('user')->with('tags')->where('slug',$slug)->first();
        $latestblogs = Blog::with('user')
        ->latest()
        ->take(4)
        ->get();
        $blogs->increment('view');

        return Inertia::render('Frontend/BlogDetails/BlogDetails', [
            'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'blogs' => $blogs,
        'latestblogs' => $latestblogs,
        ]);
    }
    public function blog_delete($slug){
        // dd($slug);
        $blog = Blog::with('user')->where('slug',$slug)->first();

        if ($blog->image && file_exists(public_path($blog->image))) {
            unlink(public_path($blog->image));
        }


        $blog->delete();


    }

    public function blogs(Request $request)
    {
        $blogs = Blog::with('user')->orderBy('created_at', 'desc')->paginate(10);
        return inertia('Admin/Blog/Blog', [
            'blogs' => $blogs,
        ]);
    }
    
    public function tag(Request $request)
    {
        $tags = Tag::paginate(7);
        return inertia('Admin/Tag/Tag', [
            'tags' => $tags,
        ]);
    }
    public function tag_add(Request $request)
    {
     

       $tag = new Tag();
       $tag->name = $request->name;
       $tag->save();

    //    dd('done');
    }
    public function tag_delete($id)
    {
    //  dd($id);

       $tag = Tag::where('id',$id)->first();
       $tag->delete();

    //    dd('done');
    }

    public function blogs_create(Request $request)
    {
        // $blogs = Blog::get();
        $tags = Tag::get();
        return inertia('Admin/Blog/BlogCreate', [
            // 'blogs' => $blogs,
            'tags' => $tags,
        ]);
    }

    public function blog_edit($slug)
    {
        $blogs = Blog::with('user')->where('slug',$slug)->first();
        return inertia('Admin/Blog/BlogEdit', [
            'blogs' => $blogs,
        ]);
    }





    public function blogs_update(Request $request)
    {

    
        $blog = Blog::with('user')->where('slug', $request->slug)->first();
    
        // dd($blog->title);
        if (!$blog) {
            dd('image not found');
            return redirect()->back()->withErrors(['error' => 'Blog not found.']);
        }
    
        // Handle the new image upload
        if ($request->hasFile('image')) {
            // Delete the old image if it exists
            if ($blog->image && file_exists(public_path($blog->image))) {
                unlink(public_path($blog->image));
            }
    
            // Upload the new image
            $image = $request->file('image'); 
            $imageName = '/images/' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images'), $imageName);
    

            // Update blog with new image
            $blog->image = $imageName;
        }
    
        // Update other blog fields
        $blog->user_id = Auth::id(); // Set the user_id to the authenticated user's ID
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->status = $request->status;
        $blog->save();
    
        // // Redirect or return response as needed
        // return redirect()->route('blog.details', $blog->slug)
        //     ->with('success', 'Blog updated successfully');
    }
    
    

    public function blogs_add(Request $request)
    {

        // dd($request->tags);
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


        if ($request->tags) {
            $blog->tags()->attach($request->tags);
        }

        return redirect()->route('blogs')->with('success', 'User deleted successfully.');
        // return response()->json(['message' => 'Blog created successfully.']);
    }


// =================================================================api for anguler========================================================================


        public function api_blogs(Request $request)
        {
            $blogs = Blog::with('user')->get();
            return response()->json($blogs->toArray());
        }


    public function api_blogs_update(Request $request)
    {

    
        $blog = Blog::with('user')->where('slug', $request->slug)->first();
    
        // dd($blog->title);
        if (!$blog) {
            dd('image not found');
            return redirect()->back()->withErrors(['error' => 'Blog not found.']);
        }
    
        // Handle the new image upload
        if ($request->hasFile('image')) {
            // Delete the old image if it exists
            if ($blog->image && file_exists(public_path($blog->image))) {
                unlink(public_path($blog->image));
            }
    
            // Upload the new image
            $image = $request->file('image'); 
            $imageName = '/images/' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images'), $imageName);
    

            // Update blog with new image
            $blog->image = $imageName;
        }
    
        // Update other blog fields
        $blog->user_id = Auth::id(); // Set the user_id to the authenticated user's ID
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->status = $request->status;
        $blog->save();
    
        // // Redirect or return response as needed
        // return redirect()->route('blog.details', $blog->slug)
        //     ->with('success', 'Blog updated successfully');
    }
    
    

    public function api_blogs_add(Request $request)
    {


        // return response()->json(['message' => 'Blog created successfully.']);

        $slug = Str::slug($request->title);

        // if ($request->hasFile('image')) {
        //     $image = $request->file('image'); // Get the uploaded file
        //     $imageName = '/images/' . time() . '.' . $image->getClientOriginalExtension();
        //     $image->move(public_path('images'), $imageName);
        // } else {
        //     return response()->json(['error' => 'Image not uploaded.'], 400);
        // }




        // Create a new blog instance and save it to the database
        $blog = new Blog();
        // $blog->user_id = ''; // Set the user_id to the authenticated user's ID
        $blog->slug = $slug; // Save the generated slug
        $blog->title = $request->title;
        $blog->description = $request->description;
        $blog->status = $request->status;
        // $blog->image = $imageName; // Save the image name
        $blog->save();

        return response()->json('done');

        // return redirect()->route('blogs')->with('success', 'User deleted successfully.');
        // return response()->json(['message' => 'Blog created successfully.']);
    }


    public function api_blog_delete($slug){
        // dd($slug);
        $blog = Blog::with('user')->where('slug',$slug)->first();

        if ($blog->image && file_exists(public_path($blog->image))) {
            unlink(public_path($blog->image));
        }


        $blog->delete();


    }



}
