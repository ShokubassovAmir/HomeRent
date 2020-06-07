<?php

use Illuminate\Http\Request;
use App\Model\User;
use App\Model\Apartments;
use App\Model\Favorites;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/adduser', 'UserController@insert');

Route::put('/updatepassword', 'UserController@update');

Route::post('/postContacts', 'UserController@postContacts');

Route::get('/getNews', function (){
    $news = DB::select('select core_news.id, core_news.title, media_files.file_path from core_news inner join media_files on core_news.image_id = media_files.id');
    return response()->json($news, 200);
});

Route::get('/getApartments', function(){
    $apartments = DB::select('select bravo_tours.id, bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, media_files.file_path as imageid_path, bravo_tours.is_featured
    from bravo_tours inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join media_files on media_files.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user');
    return response()->json($apartments, 200);
});

Route::get('/getApartmentsbyId', function(Request $request2){
    $query = $request2->query('id');
    $apartments = DB::select('select bravo_tours.id, bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, media_files.file_path as imageid_path, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, group_concat(media_files.file_path) as file_path
    from bravo_tours inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join media_files as imageid_path on imageid_path.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user
    inner join media_files on FIND_IN_SET(media_files.id, bravo_tours.gallery) where bravo_tours.id = ?', [$query]);
    return response()->json($apartments, 200);

});

Route::get('/getApartmentsbyFilter', function(Request $req2){
    $location = $req2->query('location');
    $rooms = $req2->query('rooms');
    $isfeatured = $req2->query('is_featured');
    $category = $req2->query('category');
    $pricefrom = $req2->query('price_from');
    $priceto = $req2->query('price_to');
    $filter = DB::select("select bravo_tours.id, bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, media_files.file_path as imageid_path, bravo_tours.is_featured from bravo_tours 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join media_files on media_files.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user
    where bravo_locations.name = '$location' and bravo_tour_category.name = '$category'
    and bravo_tours.duration = '$rooms' and (bravo_tours.is_featured = '$isfeatured' or bravo_tours.is_featured is NULL)
    and bravo_tours.sale_price > '$pricefrom' and bravo_tours.sale_price < '$priceto'");
    return response()->json($filter, 200);
});

Route::get('/getbyphone', function (Request $req3){
    $user = $req3->query('phone');
    $results = DB::select('select id from users where phone = ?', [$user]);
    return response()->json($results, 200);
});

Route::get('/getuserbyphoneandpassword', function(Request $req4){
    $phone = $req4->query('phone');
    $password = $req4->query('password');
    $user = User::where('phone', '=', $phone)->first();
    if (!$user) {
        return response()->json(['success'=>false, 'message' => 'Login Fail, please check a phone']);
    }
    if (!Hash::check($password, $user->password)) {
        return response()->json(['success'=>false, 'message' => 'Login Fail, pls check password']);
    }
        return response()->json($user, 200);
});

Route::post('/postFavorite', 'UserController@addFavor');

Route::get('/getFavorite', function(Request $req5){
    $favorite = $req5->query('customer_id');
    $result = DB::select('select favorites.id, favorites.object_id, favorites.customer_id, bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, media_files.file_path as imageid_path, bravo_tours.is_featured
    from bravo_tours inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join media_files on media_files.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user
    inner join favorites on favorites.object_id = bravo_tours.id where favorites.customer_id = ?', [$favorite]);
    return response()->json($result, 200);
});

Route::delete('/deleteFavorite', 'UserController@deletebyId');

Route::post('/postBooking', 'UserController@postBooking');

Route::get('/getBooking', function(Request $req6){
    $id = $req6->query('customer_id');
    $results = DB::select('select bravo_bookings.id, bravo_bookings.customer_id, bravo_bookings.object_id, 
    bravo_bookings.start_date, bravo_bookings.end_date,
    bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, media_files.file_path as imageid_path, bravo_tours.is_featured
    from bravo_tours inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join media_files on media_files.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user
    inner join bravo_bookings on bravo_bookings.object_id = bravo_tours.id
    where bravo_bookings.customer_id = ?', [$id]);
    return response()->json($results, 200);

});

Route::delete('/deleteBooking', 'UserController@deleteBookingbyId');

Route::get('/getComfortbyId', function(Request $req7){
    $id = $req7->query('id');
    $result = DB::select('select bravo_tours.id, bravo_tours.title, bravo_tour_category.name as category, users.first_name as create_user, users.phone,
    bravo_tours.sale_price, bravo_tours.duration as rooms, media_files.file_path as imageid_path, bravo_tours.address, bravo_locations.name as location, 
    bravo_tours.created_at, bravo_locations.map_lat, 
    bravo_locations.map_lng, bravo_tours.bedPlaces, bravo_tours.floor, bravo_tours.content, group_concat(bravo_terms.name) as comfort_name
    from bravo_tours inner join bravo_tour_category on bravo_tours.category_id = bravo_tour_category.id 
    inner join bravo_locations on bravo_tours.location_id = bravo_locations.id
    inner join media_files on media_files.id = bravo_tours.image_id
    inner join users on users.id = bravo_tours.create_user
    inner join bravo_tour_term on bravo_tour_term.tour_id = bravo_tours.id
    inner join bravo_terms on bravo_terms.id = bravo_tour_term.term_id
    where bravo_tours.id = ?', [$id]);
    return response()->json($result, 200);
});

Route::get('/getdatebyID', function(Request $req8){
    $id = $req8->query('id');
    $result = DB::select('select bravo_bookings.start_date, bravo_bookings.end_date from bravo_bookings
    inner join bravo_tours on bravo_bookings.object_id = bravo_tours.id where bravo_tours.id = ?', [$id]);
    return response()->json($result, 200);
});

Route::delete('deleteUser', 'UserController@deleteUser');

Route::put('/updateUser', 'UserController@updateUser');