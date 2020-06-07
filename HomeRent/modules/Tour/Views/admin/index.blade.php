@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">{{__("Все апартаменты")}}</h1>
            <div class="title-actions">
                <a href="{{url('admin/module/tour/create')}}" class="btn btn-primary">{{__("Добавить апартамент")}}</a>
            </div>
        </div>
        @include('admin.message')
        <div class="filter-div d-flex justify-content-between ">
            <div class="col-left">
                @if(!empty($rows))
                    <form method="post" action="{{url('admin/module/tour/bulkEdit')}}" class="filter-form filter-form-left d-flex justify-content-start">
                        {{csrf_field()}}
                        <select name="action" class="form-control">
                            <option value="">{{__(" Действия ")}}</option>
                            <option value="publish">{{__(" Опубликовать ")}}</option>
                            <option value="draft">{{__(" Переместить в черновик ")}}</option>
                            <option value="delete">{{__(" Удалить ")}}</option>
                        </select>
                        <button data-confirm="{{__("Do you want to delete?")}}" class="btn-info btn btn-icon dungdt-apply-form-btn" type="submit">{{__('Применить')}}</button>
                    </form>
                @endif
            </div>
            <div class="col-left">
                <form method="get" action="{{url('/admin/module/tour/')}} " class="filter-form filter-form-right d-flex justify-content-end flex-column flex-sm-row" role="search">
                    @if(!empty($rows) and $tour_manage_others)
                        <?php
                        $user = !empty(Request()->vendor_id) ? App\User::find(Request()->vendor_id) : false;
                        \App\Helpers\AdminForm::select2('vendor_id', [
                            'configs' => [
                                'ajax'        => [
                                    'url'      => url('/admin/module/user/getForSelect2'),
                                    'dataType' => 'json'
                                ],
                                'allowClear'  => true,
                                'placeholder' => __('-- Владелец --')
                            ]
                        ], !empty($user->id) ? [
                            $user->id,
                            $user->name_or_email . ' (#' . $user->id . ')'
                        ] : false)
                        ?>
                    @endif
                    <input type="text" name="s" value="{{ Request()->s }}" placeholder="{{__('Поиск по имени')}}" class="form-control">
                    <select name="cate_id" class="form-control">
                        <option value="">{{ __('--Все категории --')}} </option>
                        <?php
                        foreach ($tour_categories as $category) {
                            printf("<option value='%s' >%s</option>", $category->id, $category->name);
                        }
                        ?>
                    </select>
                    <button class="btn-info btn btn-icon btn_search" type="submit">{{__('Поиск')}}</button>
                </form>
            </div>
        </div>
        <div class="panel">
            <div class="panel-body">
                <form action="" class="bravo-form-item">
                    <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th width="60px"><input type="checkbox" class="check-all"></th>
                            <th> {{ __('Название')}}</th>
                            <th class="category"> {{ __('Категория')}}</th>
                            <th class="author"> {{ __('Владелец')}}</th>
                            <th width="100px"> {{ __('Статус')}}</th>
                            <th width="100px"> {{ __('Отзывы')}}</th>
                            <th class="date"> {{ __('Время')}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($rows->total() > 0)
                            @foreach($rows as $row)
                                <tr class="{{$row->status}}">
                                    <td><input type="checkbox" name="ids[]" class="check-item" value="{{$row->id}}">
                                    </td>
                                    <td class="title">
                                        <a href="{{url('admin/module/tour/edit/'.$row->id)}}">{{$row->title}}</a>
                                    </td>
                                    <td>{{$row->category_tour->name ?? '' }}</td>
                                    <td>{{ $row->getAuthor->name ?? 'Author' }}</td>
                                    <td><span class="badge badge-{{ $row->status }}">{{ $row->status }}</span></td>
                                    <td>
                                        <a target="_blank" href="{{ url("/admin/module/review?service_id=".$row->id) }}" class="review-count-approved">
                                            {{ $row->getNumberReviewsInService() }}
                                        </a>
                                    </td>
                                    <td>{{ display_date($row->updated_at)}}</td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="7">{{__("No data")}}</td>
                            </tr>
                        @endif
                        </tbody>
                    </table>
                    </div>
                </form>
                {{$rows->appends(request()->query())->links()}}
            </div>
        </div>
    </div>
@endsection
