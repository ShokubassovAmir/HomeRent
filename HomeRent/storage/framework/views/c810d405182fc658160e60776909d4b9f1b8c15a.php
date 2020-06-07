<div class="panel">
    <div class="panel-title"><strong><?php echo e(__("Содержание апартамента")); ?></strong></div>
    <div class="panel-body">
        <div class="form-group">
            <label><?php echo e(__("Название")); ?></label>
            <input type="text" value="<?php echo e($row->title); ?>" placeholder="<?php echo e(__("Название апартамента")); ?>" name="title" class="form-control">
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Содержание")); ?></label>
            <div class="">
                <textarea name="content" class="d-none has-ckeditor" cols="30" rows="10"><?php echo e($row->content); ?></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Описание")); ?></label>
            <div class="">
                <textarea name="short_desc" class="form-control" cols="30" rows="4"><?php echo e($row->short_desc); ?></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Категория")); ?></label>
            <div class="">
                <select name="category_id" class="form-control">
                    <option value=""><?php echo e(__("-- Выбрать --")); ?></option>
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
            <label class="control-label"><?php echo e(__("Количество комнат")); ?></label>
            <input type="text" name="duration" class="form-control" value="<?php echo e($row->duration); ?>" placeholder="<?php echo e(__("Количество комнат")); ?>">
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Изображение баннера")); ?></label>
            <div class="form-group-image">
                <?php echo \Modules\Media\Helpers\FileHelper::fieldUpload('banner_image_id',$row->banner_image_id); ?>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Галерея")); ?></label>
            <?php echo \Modules\Media\Helpers\FileHelper::fieldGalleryUpload('gallery',$row->gallery); ?>

        </div>

    </div>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/Tour/Views/admin/tour/tour-content.blade.php ENDPATH**/ ?>