<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\User;
use App\Model\Contacts;
use App\Model\News;
use App\Model\Media;
use App\Model\Favorites;
use App\Model\Bookings;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function insert(Request $request){
        $user = new User;
        $user->first_name=$request->input('first_name');
        $user->email=$request->input('email');  
        $user->phone=$request->input('phone');
        $user->password=Hash::make($request->input('password'));
        $user->verificationID=$request->input('verificationID');
        $user->save();
        return response()->json($user,201);
    }

    public function update(Request $request2){
        $user2 = User::find($request2->id);
        $user2->password=Hash::make($request2->password);
        $user2->verificationID=$request2->verificationID;
        $user2->save();
        return response()->json($user2, 200);
    }

    public function postContacts(Request $request3){
        $contacts = new Contacts;
        $contacts->name=$request3->input('name');
        $contacts->email=$request3->input('email');
        $contacts->message=$request3->input('message');
        $contacts->status='sent';
        $contacts->create_user=$request3->input('create_user');
        $contacts->save();
        return response()->json($contacts, 201);
    }

    public function addFavor(Request $request4){
        $favorites = new Favorites;
        $favorites->object_id=$request4->input('object_id');
        $favorites->customer_id=$request4->input('customer_id');
        $favorites->save();
        return response()->json($favorites, 201);
    }

    public function deletebyId(Request $request5){
        $favorites = Favorites::find($request5->id);
        $favorites->delete();
        return response()->json($favorites, 200);
    }

    public function postBooking(Request $req6){
        $book = new Bookings;
        $book->customer_id=$req6->input('customer_id');
        $book->object_id=$req6->input('object_id');
        $book->start_date=$req6->input('start_date');
        $book->end_date=$req6->input('end_date');
        $book->save();
        return response()->json(['message' => 'Success!'], 201);
    }

    public function deleteBookingbyId(Request $req7){
        $booking = Bookings::find($req7->id);
        $booking->delete();
        return response()->json(['message' => 'Success!'], 200);
    }

    public function deleteUser(Request $req8){
        $user = User::find($req8->id);
        $user->delete();
        return response()->json(['message' => 'Success!'], 200);
    }

    public function updateUser(Request $req9){
        $user = User::find($req9->id);
        $user->phone=$req9->phone;
        $user->first_name=$req9->first_name;
        $user->imageForMobile=$req9->imageForMobile;
        $user->save();
        return response()->json($user, 200);
    }
}
