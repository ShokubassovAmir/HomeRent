<div class="form-group">
    <label><?php echo e(__('Name')); ?></label>
    <input type="text" value="<?php echo e($row->name); ?>" placeholder=" <?php echo e(__('Tag name')); ?>" name="name" class="form-control">
</div>
<div class="form-group">
    <label><?php echo e(__('Slug')); ?></label>
    <input type="text" value="<?php echo e($row->slug); ?>" placeholder=" <?php echo e(__('Tag Slug')); ?>" name="slug" class="form-control">
</div>
<div class="form-group">
    <label class="control-label"><?php echo e(__('Description')); ?></label>
    <textarea name="content" class="d-none has-ckeditor" cols="30" rows="10"><?php echo e($row->content); ?></textarea>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/News/Views/admin/tag/form.blade.php ENDPATH**/ ?>