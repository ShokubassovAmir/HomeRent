<div class="panel">
    <div class="panel-title"><strong>{{__("Цена")}}</strong></div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group"> 
                    <label class="control-label">{{__("Стоимость бронирования")}}</label> 
                    <input type="text" name="sale_price" class="form-control" value="{{$row->sale_price}}" placeholder="{{__("Стоимость бронирования апартамента")}}">
                </div>   
            </div>
        </div>
        <hr>
        <div class="form-group">
            <label><input type="checkbox" name="enable_person_types" @if(!empty($row->meta->enable_person_types)) checked @endif value="1"> {{__('Enable Person Types')}}
            </label>
        </div>
        <div class="form-group-item" data-condition="enable_person_types:is(1)">
            <label class="control-label">{{__('Person Types')}}</label>
            <div class="g-items-header">
                <div class="row">
                    <div class="col-md-5">{{__("Person Type")}}</div>
                    <div class="col-md-2">{{__('Min')}}</div>
                    <div class="col-md-2">{{__('Max')}}</div>
                    <div class="col-md-2">{{__('Price')}}</div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <div class="g-items">
                @if(!empty($row->meta->person_types))
                    @foreach($row->meta->person_types as $key=>$person_type)
                        <div class="item" data-number="{{$key}}">
                            <div class="row">
                                <div class="col-md-5">
                                    <input type="text" name="person_types[{{$key}}][name]" class="form-control" value="{{$person_type['name']}}" placeholder="{{__('Eg: Adults')}}">
                                    <input type="text" name="person_types[{{$key}}][desc]" class="form-control" value="{{$person_type['desc'] ?? ''}}" placeholder="{{__('Description')}}">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[{{$key}}][min]" class="form-control" value="{{$person_type['min']}}" placeholder="{{__("Minimum per booking")}}">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[{{$key}}][max]" class="form-control" value="{{$person_type['max']}}" placeholder="{{__("Maximum per booking")}}">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[{{$key}}][price]" class="form-control" value="{{$person_type['price']}}" placeholder="{{__("per 1 item")}}">
                                </div>
                                <div class="col-md-1">
                                    <span class="btn btn-danger btn-sm btn-remove-item"><i class="fa fa-trash"></i></span>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
            <div class="text-right">
                <span class="btn btn-info btn-sm btn-add-item"><i class="icon ion-ios-add-circle-outline"></i> {{__('Add item')}}</span>
            </div>
            <div class="g-more hide">
                <div class="item" data-number="__number__">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" __name__="person_types[__number__][name]" class="form-control" value="" placeholder="{{__('Eg: Adults')}}">
                            <input type="text" __name__="person_types[__number__][desc]" class="form-control" value="" placeholder="{{__('Description')}}">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][min]" class="form-control" value="" placeholder="{{__("Minimum per booking")}}">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][max]" class="form-control" value="" placeholder="{{__("Maximum per booking")}}">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][price]" class="form-control" value="" placeholder="{{__("per 1 item")}}">
                        </div>
                        <div class="col-md-1">
                            <span class="btn btn-danger btn-sm btn-remove-item"><i class="fa fa-trash"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>