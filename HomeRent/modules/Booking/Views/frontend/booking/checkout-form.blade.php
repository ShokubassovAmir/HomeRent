<div class="form-checkout" id="form-checkout" >
    <input type="hidden" name="code" value="{{$booking->code}}">
    <div class="form-section">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label >{{__("Имя")}} <span class="required">*</span></label>
                    <input type="text" placeholder="{{__("Имя")}}" class="form-control" value="{{$user->first_name ?? ''}}" name="first_name">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >{{__("Фамилия")}} <span class="required">*</span></label>
                    <input type="text" placeholder="{{__("Фамилия")}}" class="form-control" value="{{$user->last_name ?? ''}}" name="last_name">
                </div>
            </div>
            <div class="col-md-6 field-email">
                <div class="form-group">
                    <label >{{__("Электронный адрес")}} <span class="required">*</span></label>
                    <input type="email" placeholder="{{__("email@gmail.com")}}" class="form-control" value="{{$user->email ?? ''}}" name="email">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >{{__("Номер телефона")}} <span class="required">*</span></label>
                    <input type="email" placeholder="{{__("Номер телефона")}}" class="form-control" value="{{$user->phone ?? ''}}" name="phone">
                </div>
            </div>
            <div class="col-md-6 field-city">
                <div class="form-group">
                    <label >{{__("Город")}} </label>
                    <input type="text" class="form-control" value="{{$user->city ?? ''}}" name="city" placeholder="{{__("Город проживания")}}">
                </div>
            </div>
            <div class="col-md-6 field-country">
                <div class="form-group">
                    <label >{{__("Страна")}} </label>
                    <select name="country" class="form-control">
                        <option value="">{{__('-- Выбрать --')}}</option>
                        @foreach(get_country_lists() as $id=>$name)
                            <option @if(($user->country ?? '') == $id) selected @endif value="{{$id}}">{{$name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-md-12">
                <label >{{__("Специальные требования")}} </label>
                <textarea name="customer_notes" cols="30" rows="6" class="form-control" placeholder="{{__('Специальные требования')}}"></textarea>
            </div>
        </div>
    </div>
    @include ($service->checkout_form_payment_file ?? 'Booking::frontend/booking/checkout-payment')

    @php
    $term_conditions = setting_item('booking_term_conditions');
    @endphp

    <div class="form-group">
        <label class="term-conditions-checkbox">
            <input type="checkbox" name="term_conditions"> {{__('Я прочитал и принимаю условия пользования')}}
        </label>
    </div>
    @if(setting_item("booking_enable_recaptcha"))
        <div class="form-group">
            {{recaptcha_field('booking')}}
        </div>
    @endif
    <div class="html_before_actions"></div>

    <p class="alert-text mt10" v-show=" message.content" v-html="message.content" :class="{'danger':!message.type,'success':message.type}"></p>

    <div class="form-actions">
        <button class="btn btn-danger" @click="doCheckout">{{__('Отправить')}}
            <i class="fa fa-spin fa-spinner" v-show="onSubmit"></i>
        </button>
    </div>
</div>
