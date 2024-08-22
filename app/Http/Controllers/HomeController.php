<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Blog;
use Inertia\Inertia;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    //


    public function home(Request $request)
    {
        $blogs = Blog::with('user')-> where('status','active')->get();
        // $users = $blogs->user;
        return Inertia::render('Frontend/Home/Home', [
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
            'laravelVersion' => Application::VERSION,
            'phpVersion' => PHP_VERSION,
            'blogs' => $blogs,
            // 'users' => $users,
        ]);
    }
    public function dashboard(Request $request)
    {
        // Fetch paginated users
        $query = $request->input('search', '');
        $page = $request->input('page', 1);

        $users = User::query()
            ->where('name', 'like', "%{$query}%")
            ->orWhere('email', 'like', "%{$query}%")
            ->paginate(10, ['*'], 'page', $page);

        return inertia('Admin/Dashboard', [
            'users' => $users->items(),
            'totalPages' => $users->lastPage(),
            'currentPage' => $users->currentPage(),
        ]);
    }
    public function block_users(Request $request)
    {
        // Fetch the search query and the page number
        $query = $request->input('search', '');
        $page = $request->input('page', 1);

        // Query to fetch only soft-deleted users with search functionality
        $users = User::onlyTrashed() // Fetch only soft-deleted users
            ->where(function ($queryBuilder) use ($query) {
                $queryBuilder->where('name', 'like', "%{$query}%")
                    ->orWhere('email', 'like', "%{$query}%");
            })
            ->paginate(10, ['*'], 'page', $page);

        // Return the paginated result to the Inertia component
        return inertia('Admin/BlockUsers/BlockUsers', [
            'users' => $users->items(),
            'totalPages' => $users->lastPage(),
            'currentPage' => $users->currentPage(),
        ]);
    }



    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
        ]);

        $user->update($data);

        return redirect()->route('dashboard')->with('success', 'User updated successfully.');
    }

    public function destroy(User $user)
    {
        $user->delete();

        // return response()->json(['message' => 'User unblocked successfully.' . $user]);

        return redirect()->route('dashboard')->with('success', 'User deleted successfully.');
    }


    public function users_unblock($id)
    {
        $user = User::withTrashed()->where("id", $id)->first();

        if ($user) {
            $user->restore();
            return redirect()->route('block.user')->with('success', 'User deleted successfully.');
        } else {
            return redirect()->route('block.user')->with('success', 'User deleted successfully.');
        }
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


        // $image = $request->file('image'); // Get the uploaded file
        // $imageName = $image; // Generate a unique name for the image
        // dd($imageName);



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
