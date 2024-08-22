<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Blog;
use App\Models\Contact;
use App\Models\Home;
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

        $title = Home::where('type','title')->first();
        $description = Home::where('type','description')->first();
        $facebook = Home::where('type','facebook')->first();
        $instagram = Home::where('type','instagram')->first();
        $twitter = Home::where('type','twitter')->first();
        $threads = Home::where('type','threads')->first();
        $about = Home::where('type','about')->first();
        // $users = $blogs->user;
        return Inertia::render('Frontend/Home/Home', [
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
            'laravelVersion' => Application::VERSION,
            'phpVersion' => PHP_VERSION,
            'blogs' => $blogs,
            'title' => $title,
            'description' => $description,
            'facebook' => $facebook,
            'instagram' => $instagram,
            'twitter' => $twitter,
            'threads' => $threads,
            'about' => $about,
            // 'users' => $users,
        ]);
    }

    public function home_banner(Request $request)
    {
   

        $title = Home::where('type','title')->first();
        $description = Home::where('type','description')->first();
        $facebook = Home::where('type','facebook')->first();
        $instagram = Home::where('type','instagram')->first();
        $twitter = Home::where('type','twitter')->first();
        $threads = Home::where('type','threads')->first();
        $about = Home::where('type','about')->first();
        // $users = $blogs->user;
        return Inertia::render('Admin/HomeBanner/HomeBanner', [
            'canLogin' => Route::has('login'),
            'canRegister' => Route::has('register'),
            'laravelVersion' => Application::VERSION,
            'phpVersion' => PHP_VERSION,
            'title' => $title,
            'description' => $description,
            'facebook' => $facebook,
            'instagram' => $instagram,
            'twitter' => $twitter,
            'threads' => $threads,
            'about' => $about,
            // 'users' => $users,
        ]);
    }
    public function home_banner_update(Request $request)
    {
        // Update the title
        $title = Home::where('type', 'title')->first();
        if ($title) {
            $title->title = $request->title;  // Assuming 'title' is the input name in the form
            $title->save();
        }
    
        // Update the description
        $description = Home::where('type', 'description')->first();
        if ($description) {
            $description->title = $request->description;  // Assuming 'description' is the input name in the form
            $description->save();
        }
    
        // Update the Facebook link
        $facebook = Home::where('type', 'facebook')->first();
        if ($facebook) {
            $facebook->title = $request->facebook;  // Assuming 'facebook' is the input name in the form
            $facebook->save();
        }
    
        // Update the Instagram link
        $instagram = Home::where('type', 'instagram')->first();
        if ($instagram) {
            $instagram->title = $request->instagram;  // Assuming 'instagram' is the input name in the form
            $instagram->save();
        }
    
        // Update the Twitter link
        $twitter = Home::where('type', 'twitter')->first();
        if ($twitter) {
            $twitter->title = $request->twitter;  // Assuming 'twitter' is the input name in the form
            $twitter->save();
        }
    
        // Update the Threads link
        $threads = Home::where('type', 'threads')->first();
        if ($threads) {
            $threads->title = $request->threads;  // Assuming 'threads' is the input name in the form
            $threads->save();
        }
    
        // Update the About section
        $about = Home::where('type', 'about')->first();
        if ($about) {
            $about->title = $request->about;  // Assuming 'about' is the input name in the form
            $about->save();
        }
    
        // dd('done');
        return redirect()->back()->with('success', 'Home Banner updated successfully!');
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


    public function contact_submit(Request $request){
        // dd($request);

        $blog = new Contact();
  
        $blog->name = $request->fullName;
        $blog->email = $request->email;
        $blog->subject = $request->subject;
        $blog->message = $request->message;
        $blog->save();
    }

    public function contact_list(Request $request){
        // dd($request);

        $contacts = Contact::paginate(10);
        return Inertia::render('Admin/Contact/Contact', [
         
            'contacts' => $contacts,
            // 'users' => $users,
        ]);
 
    }




}
