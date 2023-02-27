<?php

namespace App\Http\Controllers;

use App\Models\Ad;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;
use App\Http\Requests\CreateAdRequest;
use App\Http\Requests\UpdateAdRequest;
use Illuminate\Http\RedirectResponse;

class MyAdsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $userId = Auth::user()->id;
        $ads = DB::table('ads')
                ->select('ads.id', 'ads.title', 'ads.description', 'ads.price', 'ads.picture', 'ads.city')
                ->where('user_id', $userId)
                ->orderBy('ads.updated_at', 'desc')
                ->get();
        return Inertia::render('Ads/MyAds', [
            'myAds' => $ads
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        return Inertia::render("Ads/CreateAd");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateAdRequest $request): RedirectResponse {
        $userId = Auth::user()->id;
        $statusID = 3;

        $img = $request->file('picture')->store('images'); //Размещаем загруженную картинку в storage
        $imgName = substr($img, 7); //Формируем название файла для записи в БД
        
        $ad = new Ad();
        $ad->title       = $request->input('title');
        $ad->description = $request->input('description');
        $ad->price       = $request->input('price');
        $ad->picture     = $imgName;
        $ad->city        = $request->input('city');
        $ad->user_id     = $userId;
        $ad->status_id   = $statusID;
        $ad->save();

        return to_route('my_ads.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Ad $ad){
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $ad = Ad::where('id', $id)
                ->first();

        return Inertia::render('Ads/UpdateAd', [
            'ad' => $ad
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateAdRequest $request, $id): RedirectResponse {
        // Удаляем старую картинку, сохраняем новую картирнку, если она загружена
        if ($request->hasFile('picture')) {
            $imgNew = $request->file('picture')->store('images'); //Получаем имя новой картинки
            $imgNewName = substr($imgNew, 7); //Формируем название файла для записи в БД

            $imgOld = Ad::select('picture') //Достаем имя старой картинки
            ->where('id', $id)
            ->first();
            Storage::delete('images/' . $imgOld->picture); //Удаляем старую картинку

            Ad::updateOrInsert(
                ['id' => $id],
                ['picture' => $imgNewName]
            );
        }
        
        // Обновляем объявление в БД
        $statusID = 3; //Пригодится когда внедрю статусы
        $current_date_time = \Carbon\Carbon :: now ()-> toDateTimeString ();

        Ad::updateOrInsert(
            ['id' => $id],
            [
                'title'       => $request->input('title'),
                'description' => $request->input('description'),
                'price'       => $request->input('price'),
                'city'        => $request->input('city'),
                'status_id'   => $statusID,
                'updated_at'  => $current_date_time
            ]
        );
        
        return to_route('my_ads.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){

        $img = Ad::select('picture')
            ->where('id', $id)
            ->first();
        if(Storage::exists('images/' . $img->picture)){
            Storage::delete('images/' . $img->picture);
        }
        
        Ad::where('id', $id)->delete();

        return to_route('my_ads.index');
    }
}

