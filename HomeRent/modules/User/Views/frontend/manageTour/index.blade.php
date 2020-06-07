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
                                        {{__("Главная")}}
                                    </a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>&nbsp; {{__("Управление апартаментами")}} </li>
                            </ul>
                            <div class="bravo-more-menu-user">
                                <i class="icofont-settings"></i>
                            </div>
                        </div>
                        <h2 class="title-bar">
                            {{__("Управление апартаментами")}}
                            @if(Auth::user()->hasPermissionTo('tour_create'))
                                <a href="{{url("/user/apartment/create")}}" class="btn-change-password">{{__("Добавить апартамент")}}</a>
                            @endif
                        </h2>
                        @include('admin.message')
                        @if($rows->total() > 0)
                            <div class="bravo-list-item">
                                <div class="list-item">
                                    <div class="row">
                                        @foreach($rows as $row)
                                            <div class="col-md-12">
                                                @include('User::frontend.manageTour.loop-list')
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @else
                            {{__("Апартаментов нет")}}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('footer')
    <script type="text/javascript" src="{{ asset("module/user/js/user.js") }}"></script>
@endsection