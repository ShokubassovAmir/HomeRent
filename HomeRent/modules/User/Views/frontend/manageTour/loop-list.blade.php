<div class="item-tour-list">
    <div class="row">
        <div class="col-md-3">
            @if($row->is_featured == "1")
                <div class="featured">
                    {{__("ТОП")}}
                </div>
            @endif
            <a href="{{$row->getDetailUrl()}}" target="_blank">
                <div class="thumb-image">
                    @if($row->image_url)
                        <img src="{{$row->image_url}}" class="img-responsive" alt="">
                    @endif
                </div>
            </a>
        </div>
        <div class="col-md-5">
            <div class="item-title">
                <a href="{{$row->getDetailUrl()}}" target="_blank">
                    {{$row->title}}
                </a>
            </div>
            <div class="location">
                @if(!empty($row->location->name))
                    <i class="icofont-paper-plane"></i>
                    {{$row->location->name ?? ''}}
                @endif
            </div>
            <div class="location">
                <i class="icofont-ui-settings"></i>
                {{__("Статус")}}:  <span class="badge badge-{{ $row->status }}">{{ $row->status }}</span>
            </div>
            <div class="desc">
            </div>
        </div>
        <div class="col-md-4">
            <div class="g-price">
                <div class="prefix">
                    <i class="icofont-flash"></i>
                </div>
                <div class="price">
                    <span class="text-price">{{ $row->display_price }}</span>
                </div>
            </div>
            <div class="control-action">
                <a href="{{$row->getDetailUrl()}}" target="_blank" class="btn btn-info">{{__("View")}}</a>
                @if(Auth::user()->hasPermissionTo('tour_update'))
                    <a href="{{url("user/apartment/edit/".$row->id)}}" class="btn btn-warning">{{__("Edit")}}</a>
                @endif
                @if(Auth::user()->hasPermissionTo('tour_delete'))
                    <a href="{{url("user/apartment/del/".$row->id)}}" class="btn btn-danger">{{__("Del")}}</a>
                @endif
            </div>
        </div>
    </div>
</div>