<div class="bravo_filter">
    <form action="" class="bravo_form_filter">
        @if( !empty(Request::query('location_id')) )
            <input type="hidden" name="location_id" value="{{Request::query('location_id')}}">
        @endif
        @if( !empty(Request::query('start')) and !empty(Request::query('end')) )
            <input type="hidden" value="{{Request::query('start',date("d/m/Y",strtotime("today")))}}" name="start">
            <input type="hidden" value="{{Request::query('end',date("d/m/Y",strtotime("+1 day")))}}" name="end">
            <input type="hidden" name="date" value="{{Request::query('date')}}">
        @endif
        <div class="filter-title">
            {{__("Сортировать по")}}
        </div>
        <div class="g-filter-item">
            <div class="item-title">
                <h4>{{__("Посуточно")}}</h4>
                <i class="fa fa-angle-up" aria-hidden="true"></i>
            </div>
            <div class="item-content">
                <div class="bravo-filter-price">
                    <?php
                    $price_min = $pri_from = $tour_min_max_price[0];
                    $price_max = $pri_to = $tour_min_max_price[1];
                    if (!empty($price_range = Request::query('price_range'))) {
                        $pri_from = explode(";", $price_range)[0];
                        $pri_to = explode(";", $price_range)[1];
                    }
                    $currency = App\Currency::getCurrency(setting_item('currency_main'))
                    ?>
                    <input type="hidden" class="filter-price irs-hidden-input" name="price_range"
                           data-symbol=" {{$currency['symbol'] ?? ''}}"
                           data-min="12"
                           data-max="180"
                           data-from="12"
                           data-to="{{$pri_to}}"
                           readonly="" value="{{$price_range}}">
                    <button type="submit" class="btn btn-link btn-apply-price-range">{{__("Поиск")}}</button>
                </div>
            </div>
        </div>
        <div class="g-filter-item">
            <div class="item-title">
                <h4>{{__("Тип размещения")}}</h4>
                <i class="fa fa-angle-up" aria-hidden="true"></i>
            </div>
            <div class="item-content">
                <ul>
                    <?php
                    $current_category_ids = Request::query('cat_id');
                    $traverse = function ($categories, $prefix = '') use (&$traverse, $current_category_ids) {
                    $i = 0;
                    foreach ($categories as $category) {
                    $checked = '';
                    if (!empty($current_category_ids)) {
                        foreach ($current_category_ids as $key => $current) {
                            if ($current == $category->id)
                                $checked = 'checked';
                        }
                    }
                    ?>
                    <li @if($i > 2) class="hide" @endif>
                        <div class="bravo-checkbox">
                            <label>
                                <input name="cat_id[]" {{$checked}} type="checkbox" value="{{$category->id}}"> {{$prefix}} {{$category->name}}
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </li>
                    <?php
                    $i++;
                    $traverse($category->children, $prefix . '-');
                    }
                    };
                    $traverse($tour_category);
                    ?>
                </ul>
            </div>
        </div>
        <div class="g-filter-item">
            <div class="item-title">
                <h4>{{__("Количество комнат")}}</h4>
                <i class="fa fa-angle-up" aria-hidden="true"></i>
            </div>
            <div class="item-content">
                <ul>
                    <li>
                        <div class="bravo-checkbox">
                            <label>
                                <input name="duration[]" <?php if (is_array(Request::query('Количество комнат')) and in_array("0;1", Request::query('Количество комнат')))
                                    echo "checked"; ?> type="checkbox" value="0;1"> {{__("1 комн.")}}
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="bravo-checkbox">
                            <label>
                                <input name="duration[]" <?php if (is_array(Request::query('Количество комнат')) and in_array("2;2", Request::query('Количество комнат')))
                                    echo "checked"; ?>  type="checkbox" value="2;2"> {{__("2 комн.")}}
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="bravo-checkbox">
                            <label>
                                <input name="duration[]" <?php if (is_array(Request::query('Количество комнат')) and in_array("3;3", Request::query('Количество комнат')))
                                    echo "checked"; ?>  type="checkbox" value="3;3"> {{__("3 комн.")}}
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </li>
                    <li>
                        <div class="bravo-checkbox">
                            <label>
                                <input name="duration[]" <?php if (is_array(Request::query('Количество комнат')) and in_array("4;4", Request::query('Количество комнат')))
                                    echo "checked"; ?>  type="checkbox" value="4;4"> {{__("4 комн.")}}
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>