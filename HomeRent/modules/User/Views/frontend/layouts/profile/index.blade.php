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
            <li>&nbsp; {{__("Настройки")}} </li>
        </ul>
        <div class="bravo-more-menu-user">
            <i class="icofont-settings"></i>
        </div>
    </div>
    <h2 class="title-bar">
        {{__("Настройки")}}
        <a href="{{url("/user/profile/change-password")}}" class="btn-change-password">{{__("Сменить пароль")}}</a>
    </h2>
    @include('admin.message')
    <form action="{{url("/user/profile")}}" method="post">
        @csrf
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>{{__("Электронный адрес")}}</label>
                    <input type="text" value="{{$dataUser->email}}" placeholder="{{__("Электронный адрес")}}" readonly class="form-control">
                    <i class="fa fa-envelope input-icon"></i>
                </div>
                <div class="form-group">
                    <label>{{__("Имя")}}</label>
                    <input type="text" value="{{$dataUser->first_name}}" name="first_name" placeholder="{{__("Имя")}}" class="form-control">
                    <i class="fa fa-user input-icon"></i>
                </div>
                <div class="form-group">
                    <label>{{__("Фамилия")}}</label>
                    <input type="text" value="{{$dataUser->last_name}}" name="last_name" placeholder="{{__("Фамилия")}}" class="form-control">
                    <i class="fa fa-user input-icon"></i>
                </div>
                <div class="form-group">
                    <label>{{__("О себе")}}</label>
                    <textarea name="bio" rows="5" class="form-control">{{$dataUser->bio}}</textarea>
                </div>
                <div class="form-group">
                    <label>{{__("Фото")}}</label>
                    <div class="upload-btn-wrapper">
                        <div class="input-group">
                            <span class="input-group-btn">
                                <span class="btn btn-default btn-file">
                                    {{__("Выбрать")}}… <input type="file">
                                </span>
                            </span>
                            <input type="text" data-error="{{__("Ошибка...")}}" data-loading="{{__("Загрузка...")}}" class="form-control text-view" readonly value="{{ $dataUser->getAvatarUrl()?? __("Нет фото")}}">
                        </div>
                        <input type="hidden" class="form-control" name="avatar_id" value="{{ $dataUser->avatar_id?? ""}}">
                        <img class="image-demo" src="{{ $dataUser->getAvatarUrl()?? ""}}"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>{{__("Город")}}</label>
                    <input type="text" value="{{$dataUser->city}}" name="city" placeholder="{{__("Город проживания")}}" class="form-control">
                    <i class="fa fa-street-view input-icon"></i>
                </div>
                <div class="form-group">
                    <label>{{__("Страна")}}</label>
                    <select name="country" class="form-control">
                        <option value="">{{__('-- Выбрать --')}}</option>
                        @foreach(get_country_lists() as $id=>$name)
                            <option @if(($dataUser->country ?? '') == $id) selected @endif value="{{$id}}">{{$name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>{{__("Номер телефона")}}</label>
                    <input type="text" value="{{$dataUser->phone}}" name="phone" placeholder="{{__("Номер телефона")}}" class="form-control">
                    <i class="fa fa-phone input-icon"></i>
                </div>
            </div>
            <div class="col-md-12">
                <hr>
                <input type="submit" class="btn btn-primary" value="Сохранить изменения">
            </div>
        </div>
    </form>
</div>