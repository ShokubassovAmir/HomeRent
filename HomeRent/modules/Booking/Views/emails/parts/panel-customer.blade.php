<div class="b-panel">
    <div class="b-panel-title">{{__('Информация о клиенте')}}</div>
    <div class="b-table-wrap">
        <table class="b-table" cellspacing="0" cellpadding="0">
            <tr class="info-first-name">
                <td class="label">{{__('Имя')}}</td>
                <td class="val">{{$booking->first_name}}</td>
            </tr>
            <tr class="info-last-name">
                <td class="label">{{__('Фамилия')}}</td>
                <td class="val">{{$booking->last_name}}</td>
            </tr>
            <tr class="info-email">
                <td class="label">{{__('Электронный адрес')}}</td>
                <td class="val">{{$booking->email}}</td>
            </tr>
            <tr class="info-city">
                <td class="label">{{__('Город проживания')}}</td>
                <td class="val">{{$booking->city}}</td>
            </tr>
            <tr class="info-country">
                <td class="label">{{__('Страна проживания')}}</td>
                <td class="val">{{get_country_name($booking->country)}}</td>
            </tr>
            <tr class="info-notes">
                <td class="label">{{__('Специальные требования')}}</td>
                <td class="val">{{$booking->customer_notes}}</td>
            </tr>
        </table>
    </div>
</div>
