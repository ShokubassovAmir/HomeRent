<div class="panel">
    <div class="panel-title"><strong><?php echo e(__("Цена")); ?></strong></div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group"> 
                    <label class="control-label"><?php echo e(__("Стоимость бронирования")); ?></label> 
                    <input type="text" name="sale_price" class="form-control" value="<?php echo e($row->sale_price); ?>" placeholder="<?php echo e(__("Стоимость бронирования апартамента")); ?>">
                </div>   
            </div>
        </div>
        <hr>
        <div class="form-group">
            <label><input type="checkbox" name="enable_person_types" <?php if(!empty($row->meta->enable_person_types)): ?> checked <?php endif; ?> value="1"> <?php echo e(__('Enable Person Types')); ?>

            </label>
        </div>
        <div class="form-group-item" data-condition="enable_person_types:is(1)">
            <label class="control-label"><?php echo e(__('Person Types')); ?></label>
            <div class="g-items-header">
                <div class="row">
                    <div class="col-md-5"><?php echo e(__("Person Type")); ?></div>
                    <div class="col-md-2"><?php echo e(__('Min')); ?></div>
                    <div class="col-md-2"><?php echo e(__('Max')); ?></div>
                    <div class="col-md-2"><?php echo e(__('Price')); ?></div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <div class="g-items">
                <?php if(!empty($row->meta->person_types)): ?>
                    <?php $__currentLoopData = $row->meta->person_types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$person_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <div class="item" data-number="<?php echo e($key); ?>">
                            <div class="row">
                                <div class="col-md-5">
                                    <input type="text" name="person_types[<?php echo e($key); ?>][name]" class="form-control" value="<?php echo e($person_type['name']); ?>" placeholder="<?php echo e(__('Eg: Adults')); ?>">
                                    <input type="text" name="person_types[<?php echo e($key); ?>][desc]" class="form-control" value="<?php echo e($person_type['desc'] ?? ''); ?>" placeholder="<?php echo e(__('Description')); ?>">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[<?php echo e($key); ?>][min]" class="form-control" value="<?php echo e($person_type['min']); ?>" placeholder="<?php echo e(__("Minimum per booking")); ?>">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[<?php echo e($key); ?>][max]" class="form-control" value="<?php echo e($person_type['max']); ?>" placeholder="<?php echo e(__("Maximum per booking")); ?>">
                                </div>
                                <div class="col-md-2">
                                    <input type="number" min="0" name="person_types[<?php echo e($key); ?>][price]" class="form-control" value="<?php echo e($person_type['price']); ?>" placeholder="<?php echo e(__("per 1 item")); ?>">
                                </div>
                                <div class="col-md-1">
                                    <span class="btn btn-danger btn-sm btn-remove-item"><i class="fa fa-trash"></i></span>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </div>
            <div class="text-right">
                <span class="btn btn-info btn-sm btn-add-item"><i class="icon ion-ios-add-circle-outline"></i> <?php echo e(__('Add item')); ?></span>
            </div>
            <div class="g-more hide">
                <div class="item" data-number="__number__">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" __name__="person_types[__number__][name]" class="form-control" value="" placeholder="<?php echo e(__('Eg: Adults')); ?>">
                            <input type="text" __name__="person_types[__number__][desc]" class="form-control" value="" placeholder="<?php echo e(__('Description')); ?>">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][min]" class="form-control" value="" placeholder="<?php echo e(__("Minimum per booking")); ?>">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][max]" class="form-control" value="" placeholder="<?php echo e(__("Maximum per booking")); ?>">
                        </div>
                        <div class="col-md-2">
                            <input type="number" min="0" __name__="person_types[__number__][price]" class="form-control" value="" placeholder="<?php echo e(__("per 1 item")); ?>">
                        </div>
                        <div class="col-md-1">
                            <span class="btn btn-danger btn-sm btn-remove-item"><i class="fa fa-trash"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/Tour/Views/admin/tour/pricing.blade.php ENDPATH**/ ?>