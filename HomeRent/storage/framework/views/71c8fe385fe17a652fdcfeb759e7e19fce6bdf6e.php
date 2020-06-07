<div class="booking-review">
    <h4 class="booking-review-title"><?php echo e(__('Ваша информация')); ?></h4>
    <div class="booking-review-content">
        <div class="review-section">
            <div class="info-form">
                <ul>
                    <li class="info-first-name">
                        <div class="label"><?php echo e(__('Имя')); ?></div>
                        <div class="val"><?php echo e($booking->first_name); ?></div>
                    </li>
                    <li class="info-last-name">
                        <div class="label"><?php echo e(__('Фамилия')); ?></div>
                        <div class="val"><?php echo e($booking->last_name); ?></div>
                    </li>
                    <li class="info-email">
                        <div class="label"><?php echo e(__('Электронный адрес')); ?></div>
                        <div class="val"><?php echo e($booking->email); ?></div>
                    </li>
                    <li class="info-city">
                        <div class="label"><?php echo e(__('Город')); ?></div>
                        <div class="val"><?php echo e($booking->city); ?></div>
                    </li>
                    <li class="info-country">
                        <div class="label"><?php echo e(__('Страна')); ?></div>
                        <div class="val"><?php echo e(get_country_name($booking->country)); ?></div>
                    </li>
                    <li class="info-notes">
                        <div class="label"><?php echo e(__('Специальные требования')); ?></div>
                        <div class="val"><?php echo e($booking->customer_notes); ?></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<?php /**PATH D:\xampp\htdocs\booking8\modules/Booking/Views/frontend/booking/booking-customer-info.blade.php ENDPATH**/ ?>