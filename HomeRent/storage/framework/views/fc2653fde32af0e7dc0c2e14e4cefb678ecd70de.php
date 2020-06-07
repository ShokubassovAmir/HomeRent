<div class="item-tour-list">
    <div class="row">
        <div class="col-md-3">
            <?php if($row->is_featured == "1"): ?>
                <div class="featured">
                    <?php echo e(__("ТОП")); ?>

                </div>
            <?php endif; ?>
            <a href="<?php echo e($row->getDetailUrl()); ?>" target="_blank">
                <div class="thumb-image">
                    <?php if($row->image_url): ?>
                        <img src="<?php echo e($row->image_url); ?>" class="img-responsive" alt="">
                    <?php endif; ?>
                </div>
            </a>
        </div>
        <div class="col-md-5">
            <div class="item-title">
                <a href="<?php echo e($row->getDetailUrl()); ?>" target="_blank">
                    <?php echo e($row->title); ?>

                </a>
            </div>
            <div class="location">
                <?php if(!empty($row->location->name)): ?>
                    <i class="icofont-paper-plane"></i>
                    <?php echo e($row->location->name ?? ''); ?>

                <?php endif; ?>
            </div>
            <div class="location">
                <i class="icofont-ui-settings"></i>
                <?php echo e(__("Статус")); ?>:  <span class="badge badge-<?php echo e($row->status); ?>"><?php echo e($row->status); ?></span>
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
                    <span class="text-price"><?php echo e($row->display_price); ?></span>
                </div>
            </div>
            <div class="control-action">
                <a href="<?php echo e($row->getDetailUrl()); ?>" target="_blank" class="btn btn-info"><?php echo e(__("View")); ?></a>
                <?php if(Auth::user()->hasPermissionTo('tour_update')): ?>
                    <a href="<?php echo e(url("user/apartment/edit/".$row->id)); ?>" class="btn btn-warning"><?php echo e(__("Edit")); ?></a>
                <?php endif; ?>
                <?php if(Auth::user()->hasPermissionTo('tour_delete')): ?>
                    <a href="<?php echo e(url("user/apartment/del/".$row->id)); ?>" class="btn btn-danger"><?php echo e(__("Del")); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/User/Views/frontend/manageTour/loop-list.blade.php ENDPATH**/ ?>