<div class="panel">
    <div class="panel-title"><strong>{{__("Содержание апартамента")}}</strong></div>
    <div class="panel-body">
        <div class="form-group">
            <label>{{__("Название")}}</label>
            <input type="text" value="{{$row->title}}" placeholder="{{__("Название апартамента")}}" name="title" class="form-control">
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Содержание")}}</label>
            <div class="">
                <textarea name="content" class="form_control" cols="70" rows="10">{{$row->content}}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Описание")}}</label>
            <div class="">
                <textarea name="short_desc" class="form-control" cols="30" rows="4">{{$row->short_desc}}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Категория")}}</label>
            <div class="">
                <select name="category_id" class="form-control">
                    <option value="">{{__("-- Выбрать --")}}</option>
                    <?php
                    $traverse = function ($categories, $prefix = '') use (&$traverse, $row) {
                        foreach ($categories as $category) {
                            $selected = '';
                            if ($row->category_id == $category->id)
                                $selected = 'selected';
                            printf("<option value='%s' %s>%s</option>", $category->id, $selected, $prefix . ' ' . $category->name);
                            $traverse($category->children, $prefix . '-');
                        }
                    };
                    $traverse($tour_category);
                    ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Количество комнат")}}</label>
            <input type="text" name="duration" class="form-control" value="{{$row->duration}}" placeholder="{{__("Количество комнат")}}">
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Спальные места")}}</label>
            <input type="text" name="bedPlaces" class="form-control" value="{{$row->bedPlaces}}" placeholder="{{__("Спальные места")}}">
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Этаж/Количество этажей")}}</label>
            <input type="text" name="floor" class="form-control" value="{{$row->floor}}" placeholder="{{__("Этаж")}}">
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Изображение баннера")}}</label>
            <div class="form-group-image">
                {!! \Modules\Media\Helpers\FileHelper::fieldUpload('banner_image_id',$row->banner_image_id) !!}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">{{__("Галерея")}}</label>
            {!! \Modules\Media\Helpers\FileHelper::fieldGalleryUpload('gallery',$row->gallery) !!}
        </div>

    </div>
</div>