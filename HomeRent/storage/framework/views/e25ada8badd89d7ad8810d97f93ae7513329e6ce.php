<div class="b-panel">
    <div class="b-panel-title"><?php echo e(__('Информация о клиенте')); ?></div>
    <div class="b-table-wrap">
        <table class="b-table" cellspacing="0" cellpadding="0">
            <tr class="info-first-name">
                <td class="label"><?php echo e(__('Имя')); ?></td>
                <td class="val"><?php echo e($booking->first_name); ?></td>
            </tr>
            <tr class="info-last-name">
                <td class="label"><?php echo e(__('Фамилия')); ?></td>
                <td class="val"><?php echo e($booking->last_name); ?></td>
            </tr>
            <tr class="info-email">
                <td class="label"><?php echo e(__('Электронный адрес')); ?></td>
                <td class="val"><?php echo e($booking->email); ?></td>
            </tr>
            <tr class="info-city">
                <td class="label"><?php echo e(__('Город проживания')); ?></td>
                <td class="val"><?php echo e($booking->city); ?></td>
            </tr>
            <tr class="info-country">
                <td class="label"><?php echo e(__('Страна проживания')); ?></td>
                <td class="val"><?php echo e(get_country_name($booking->country)); ?></td>
            </tr>
            <tr class="info-notes">
                <td class="label"><?php echo e(__('Специальные требования')); ?></td>
                <td class="val"><?php echo e($booking->customer_notes); ?></td>
            </tr>
        </table>
    </div>
</div>
<?php /**PATH D:\xampp\htdocs\booking8\modules/Booking/Views/emails/parts/panel-customer.blade.php ENDPATH**/ ?>