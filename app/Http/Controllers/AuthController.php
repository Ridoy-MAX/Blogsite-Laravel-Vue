<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //

    public function login(Request $request)
    {
        // Validate the request
        $request->validate([
            'email' => 'required|email|exists:users,email', // Ensure the email exists in the users table
            'password' => 'required'
        ]);
    
        // Attempt to retrieve the user by email
        $user = User::where('email', $request->email)->first();
    
        // Check if the user exists and the provided password is correct
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'The provided credentials are incorrect.'
            ], 401); // Return a 401 Unauthorized response
        }
    
        // Create a token for the user
        $token = $user->createToken('API Token')->plainTextToken;
    
        // Return the user and token
        return response()->json([
            'user' => $user,
            'token' => $token
        ]);
    }
    
    public function register(Request $request){


        $user_request = $request->validate([
            'name' => 'required|max:255',
            'email' =>'required|email|unique:users',
            'password'=> 'required|confirmed'
        ]);

       $user = User::create($user_request);
       $token = $user->createToken($request->name);
        return [
            'user' => $user,
            'token' => $token
        ];

   
    }
    public function logout(Request $request){
        $request->user()->tokens()->delete();

        return response()->json([
            'message' => 'You are logout'
        ]);
 
    }
}
