<div class="row">
    <div class="col-lg-3 col-md-12">
        @include('Tour::frontend.layouts.search.filter-search')
    </div>
    <div class="col-lg-9 col-md-12">
        <div class="bravo-list-item">
            <div class="list-item">
                <div class="row">
                    @if($rows->total() > 0)
                        @foreach($rows as $row)
                            <div class="col-lg-4 col-md-6">
                                @include('Tour::frontend.layouts.search.loop-gird')
                            </div>
                        @endforeach
                    @else
                        <div class="col-lg-12">
                            {{__("Tour not found")}}
                        </div>
                    @endif
                </div>
            </div>
            <div class="bravo-pagination">
                {{$rows->appends(request()->query())->links()}}
            </div>
        </div>
    </div>
</div>