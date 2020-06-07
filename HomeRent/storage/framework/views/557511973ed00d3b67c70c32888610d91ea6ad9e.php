<div class="user-form-settings">
    <div class="breadcrumb-page-bar">
        <ul class="page-breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="<?php echo e(url("/user/dashboard")); ?>">
                    <?php echo e(__("Главная страница")); ?>

                </a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>&nbsp; <?php echo e(__("История бронирования")); ?> </li>
        </ul>
        <div class="bravo-more-menu-user">
            <i class="icofont-settings"></i>
        </div>
    </div>
    <h2 class="title-bar no-border-bottom" style="font-family: arial;">
        <?php echo e(__("История бронирования")); ?>

    </h2>
    <?php echo $__env->make('admin.message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <div class="booking-history-manager">
        <div class="tabbable">
            <ul class="nav nav-tabs ht-nav-tabs">
                <?php $status_type = Request::query('status'); ?>
                <li class="<?php if(empty($status_type)): ?> active <?php endif; ?>">
                    <a href="<?php echo e(url("/user/booking-history")); ?>"><?php echo e(__("Бронирование")); ?></a>
                </li>
                <?php if(!empty($statues)): ?>
                    <?php $__currentLoopData = $statues; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="<?php if(!empty($status_type) && $status_type == $status): ?> active <?php endif; ?>">
                            <a href="<?php echo e(url("/user/booking-history?status=".$status)); ?>"><?php echo e(ucfirst($status)); ?></a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </ul>
            <?php if(!empty($bookings) and $bookings->total() > 0): ?>
                <div class="tab-content">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-booking-history">
                            <thead>
                            <tr>
                                <th width="2%"><?php echo e(__("")); ?></th>
                                <th><?php echo e(__("Апартамент")); ?></th>
                                <th class="a-hidden"><?php echo e(__("Дата заказа")); ?></th>
                                <th class="a-hidden"><?php echo e(__("Время исполнения")); ?></th>
                                <th><?php echo e(__("Стоимость")); ?></th>
                                <th class="a-hidden"><?php echo e(__("Статус")); ?></th>
                                <th><?php echo e(__("Действие")); ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__currentLoopData = $bookings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $booking): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php echo $__env->make('User::frontend.layouts.bookingHistory.loop.'.$booking->object_model, \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="bravo-pagination">
                        <?php echo e($bookings->appends(request()->query())->links()); ?>

                    </div>
                </div>
            <?php else: ?>
                <?php echo e(__("Нет истории бронирования")); ?>

            <?php endif; ?>
        </div>
    </div>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/User/Views/frontend/layouts/bookingHistory/index.blade.php ENDPATH**/ ?>