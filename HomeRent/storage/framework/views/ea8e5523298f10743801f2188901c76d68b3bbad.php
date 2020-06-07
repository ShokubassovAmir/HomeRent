<?php if(!empty($attr)): ?>
    <input type="hidden" name="attr_id" value="<?php echo e($attr->id); ?>">
<?php endif; ?>
<div class="form-group">
    <label><?php echo e(__("Name")); ?></label>
    <input type="text" value="<?php echo e($row->name); ?>" placeholder="<?php echo e(__("Term name")); ?>" name="name" class="form-control">
</div>
<div class="form-group">
    <label class="control-label"><?php echo e(__("Description")); ?></label>
    <div class="">
        <textarea name="content" class="d-none has-ckeditor" cols="30" rows="10"><?php echo e($row->content); ?></textarea>
    </div>
</div><?php /**PATH /opt/lampp/htdocs/booking8/modules/Tour/Views/admin/terms/form.blade.php ENDPATH**/ ?>