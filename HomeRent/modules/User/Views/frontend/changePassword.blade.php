@extends('layouts.app')
@section('head')
    <style type="text/css">
        .bravo_topbar, .bravo_header, .bravo_footer {
            display: none;
        }
        html, body, .bravo_wrap, .bravo_user_profile, .row-eq-height > .col-md-3 {
            min-height: 100vh !important;
        }
    </style>
    <link href="{{ asset('module/user/css/user.css') }}" rel="stylesheet">
@endsection
@section('content')
    <div class="bravo_user_profile">
        <div class="container-fluid">
            <div class="row row-eq-height">
                <div class="col-md-3">
                    @include('User::frontend.layouts.sidebar')
                </div>
                <div class="col-md-9">
                    <div class="user-form-settings">
                        <div class="breadcrumb-page-bar">
                            <ul class="page-breadcrumb">
                                <li>
                                    <i class="fa fa-home"></i>
                                    <a href="{{url("/user/dashboard")}}">
                                        {{__("Главная страница")}}
                                    </a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>&nbsp; {{__("Сменить пароль")}} </li>
                            </ul>
                            <div class="bravo-more-menu-user">
                                <i class="icofont-settings"></i>
                            </div>
                        </div>
                        <h2 class="title-bar">
                            {{__("Сменить пароль")}}
                        </h2>
                        @include('admin.message')
                        <form action="{{url("/user/profile/change-password")}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>{{__("Текущий пароль")}}</label>
                                        <input type="password" name="current-password" placeholder="{{__("Текущий пароль")}}" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__("Новый пароль")}}</label>
                                        <input type="password" name="new-password" placeholder="{{__("Новый пароль")}}" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                    <div class="form-group">
                                        <label>{{__("Введите пароль еще раз")}}</label>
                                        <input type="password" name="new-password_confirmation" placeholder="{{__("Введите пароль еще раз")}}" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <hr>
                                    <input type="submit" class="btn btn-primary" value="{{__("Сменить пароль")}}">
                                    <a href="{{url("/user/profile")}}" class="btn btn-default">{{__("Отменить")}}</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('footer')
    <script type="text/javascript" src="{{ asset("module/user/js/user.js") }}"></script>
@endsection