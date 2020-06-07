<div class="booking-review">
    <h4 class="booking-review-title">{{__('Ваша информация')}}</h4>
    <div class="booking-review-content">
        <div class="review-section">
            <div class="info-form">
                <ul>
                    <li class="info-first-name">
                        <div class="label">{{__('Имя')}}</div>
                        <div class="val">{{$booking->first_name}}</div>
                    </li>
                    <li class="info-last-name">
                        <div class="label">{{__('Фамилия')}}</div>
                        <div class="val">{{$booking->last_name}}</div>
                    </li>
                    <li class="info-email">
                        <div class="label">{{__('Электронный адрес')}}</div>
                        <div class="val">{{$booking->email}}</div>
                    </li>
                    <li class="info-city">
                        <div class="label">{{__('Город')}}</div>
                        <div class="val">{{$booking->city}}</div>
                    </li>
                    <li class="info-country">
                        <div class="label">{{__('Страна')}}</div>
                        <div class="val">{{get_country_name($booking->country)}}</div>
                    </li>
                    <li class="info-notes">
                        <div class="label">{{__('Специальные требования')}}</div>
                        <div class="val">{{$booking->customer_notes}}</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
