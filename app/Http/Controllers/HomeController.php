<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Inertia\Inertia;

class HomeController extends Controller
{
    //


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
    


    // public function users_unblock(User $user)
    // {
    //     $user->restore();

    //     return response()->json(['message' => 'User unblocked successfully.'. $user]);

    //     // return redirect()->route('block.user')->with('success', 'User deleted successfully.');
    // }
}
