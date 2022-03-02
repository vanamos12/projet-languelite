<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\MyUser;
use App\subscription;
use App\service;
use App\payment;
use DB;
use Carbon\Carbon;

class SubscriptionApi extends Controller
{
    //
    function authenticate(Request $request){
        $name = $request->input("name");
        $password = $request->input("password");
        $users =  MyUser::where(["name"=>$name, "password"=>$password])
            ->get();
        if (count($users) == 0){
            return ["success" => false];
        }else{
            return ["success" => true, "user" =>$users[0]];
        }
    }

    function subscriptions(Request $request){
        $id_user = $request->input("id");
        $id_user = intval($id_user);

        $subscriptions = subscription::where(["user_id" => $id_user])->get();
        $result = ["success" => true, "subscriptions" => []];

        foreach($subscriptions as $subscription){
                $service = service::find($subscription->service_id);
                $payment = payment::where(["subscription_id" => $subscription->id])->get();
                if (count($payment) >= 1){
                    $result["subscriptions"][] = [
                        "name" => $service->name,
                        "startDate" => $payment[0]->startDate,
                        "endDate" => $payment[0]->expirationDate,
                        "price" => $payment[0]->amount
                    ];
                }
                
        }
        return $result;
    }

    function payment(Request $request){
        $email = $request->input("email");
        $date = $request->input("date");
        $service_name = $request->input("service");
        $date = Carbon::createFromFormat('d/m/Y H:i:s',  $date);
        
        $service = service::where(["name" => $service_name])->get();
        if (count($service) == 0){
            return ["success" => false, "msg"=> "Le service n'existe pas."];
        }
        $user = MyUser::where(["email" => $email])->get();
        if (count($user) == 0){
            return ["success" => false, "msg"=>"Le compte utilisateur est inexistant"];
        }
        $subscription = subscription::where(["service_id"=>$service[0]->id,
                "user_id"=>$user[0]->id])->get();
        if (count($subscription) == 0){
            return ["success" => false, "msg"=>"Vous n'etes pas inscrit a ce service"];
        }
        
        /*$payment = payment::create([
            "subscription_id" => $subscription[0]->id,
            //"startDate" => $date,
            //"expirationDate" => $date,
            "amount" => 20000.0
        ]);*/

        DB::table('payment')->updateOrInsert(
            [
                "subscription_id" => $subscription[0]->id,
                "startDate" => $date,
                "expirationDate" => $date,
                "amount" => 20000.0
            ]
            );
        
        return [
            "success" => true,
            "subscription" => [
                "name" => $service_name,
                "startDate" => $date,
                "endDate" => $date,
                "price" => 20000.0
            ]
        ];
    }
}
