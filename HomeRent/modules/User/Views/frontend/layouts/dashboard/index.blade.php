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
            <li>&nbsp; {{__("Панель")}} </li>
        </ul>
        <div class="bravo-more-menu-user">
            <i class="icofont-settings"></i>
        </div>
    </div>
    <h2 class="title-bar no-border-bottom">
        {{__("Панель")}}
    </h2>
    @include('admin.message')
    <div class="bravo-user-dashboard">
        <div class="row dashboard-price-info row-eq-height">
            @if(!empty($cards_report))
                @foreach($cards_report as $item)
                    <div class="col-lg-4 col-md-4">
                        <div class="dashboard-item">
                            <div class="wrap-box">
                                <div class="title">
                                    {{$item['title']}}
                                </div>
                                <div class="details">
                                    <div class="number">
                                        {{ $item['amount'] }}
                                    </div>
                                </div>
                                <div class="desc"> {{ $item['desc'] }}</div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</div>