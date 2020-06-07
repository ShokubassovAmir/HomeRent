<tr>
    <td class="booking-history-type">
        
        
    </td>
    <td>
        <?php if($service = $booking->service): ?>
            <a target="_blank" href="<?php echo e($service->getDetailUrl()); ?>">
                <?php echo e($service->title); ?>

            </a>
        <?php else: ?>
            <?php echo e(__("[Deleted]")); ?>

        <?php endif; ?>
    </td>
    <td class="a-hidden"><?php echo e(display_date($booking->created_at)); ?></td>
    <td class="a-hidden">
        <?php echo e(display_date($booking->start_date)); ?>

    </td>
    <td><?php echo e(format_money($booking->total)); ?></td>
    <td class="<?php echo e($booking->status); ?> a-hidden"><?php echo e($booking->statusName); ?></td>
    <td width="2%">
        <?php if($service = $booking->service): ?>
            <a class="btn btn-xs btn-primary btn-info-booking" data-toggle="modal" data-target="#modal-booking-<?php echo e($booking->id); ?>">
                <i class="fa fa-info-circle"></i><?php echo e(__("Детали")); ?>

            </a>
            <?php echo $__env->make($service->checkout_booking_detail_modal_file ?? '', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>
    </td>
</tr>
<?php /**PATH D:\xampp\htdocs\booking8\modules/User/Views/frontend/layouts/bookingHistory/loop/tour.blade.php ENDPATH**/ ?>