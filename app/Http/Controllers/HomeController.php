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

    return redirect()->route('dashboard')->with('success', 'User deleted successfully.');
}
}
