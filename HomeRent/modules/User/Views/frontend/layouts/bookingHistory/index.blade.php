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
            <li>&nbsp; {{__("История бронирования")}} </li>
        </ul>
        <div class="bravo-more-menu-user">
            <i class="icofont-settings"></i>
        </div>
    </div>
    <h2 class="title-bar no-border-bottom" style="font-family: arial;">
        {{__("История бронирования")}}
    </h2>
    @include('admin.message')
    <div class="booking-history-manager">
        <div class="tabbable">
            <ul class="nav nav-tabs ht-nav-tabs">
                <?php $status_type = Request::query('status'); ?>
                <li class="@if(empty($status_type)) active @endif">
                    <a href="{{url("/user/booking-history")}}">{{__("Бронирование")}}</a>
                </li>
                @if(!empty($statues))
                    @foreach($statues as $status)
                        <li class="@if(!empty($status_type) && $status_type == $status) active @endif">
                            <a href="{{url("/user/booking-history?status=".$status)}}">{{ucfirst($status)}}</a>
                        </li>
                    @endforeach
                @endif
            </ul>
            @if(!empty($bookings) and $bookings->total() > 0)
                <div class="tab-content">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-booking-history">
                            <thead>
                            <tr>
                                <th width="2%">{{__("")}}</th>
                                <th>{{__("Апартамент")}}</th>
                                <th class="a-hidden">{{__("Дата заказа")}}</th>
                                <th class="a-hidden">{{__("Время исполнения")}}</th>
                                <th>{{__("Стоимость")}}</th>
                                <th class="a-hidden">{{__("Статус")}}</th>
                                <th>{{__("Действие")}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($bookings as $booking)
                                @include('User::frontend.layouts.bookingHistory.loop.'.$booking->object_model)
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="bravo-pagination">
                        {{$bookings->appends(request()->query())->links()}}
                    </div>
                </div>
            @else
                {{__("Нет истории бронирования")}}
            @endif
        </div>
    </div>
</div>