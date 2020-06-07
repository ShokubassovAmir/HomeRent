<div class="form-checkout" id="form-checkout" >
    <input type="hidden" name="code" value="<?php echo e($booking->code); ?>">
    <div class="form-section">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label ><?php echo e(__("Имя")); ?> <span class="required">*</span></label>
                    <input type="text" placeholder="<?php echo e(__("Имя")); ?>" class="form-control" value="<?php echo e($user->first_name ?? ''); ?>" name="first_name">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label ><?php echo e(__("Фамилия")); ?> <span class="required">*</span></label>
                    <input type="text" placeholder="<?php echo e(__("Фамилия")); ?>" class="form-control" value="<?php echo e($user->last_name ?? ''); ?>" name="last_name">
                </div>
            </div>
            <div class="col-md-6 field-email">
                <div class="form-group">
                    <label ><?php echo e(__("Электронный адрес")); ?> <span class="required">*</span></label>
                    <input type="email" placeholder="<?php echo e(__("email@gmail.com")); ?>" class="form-control" value="<?php echo e($user->email ?? ''); ?>" name="email">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label ><?php echo e(__("Номер телефона")); ?> <span class="required">*</span></label>
                    <input type="email" placeholder="<?php echo e(__("Номер телефона")); ?>" class="form-control" value="<?php echo e($user->phone ?? ''); ?>" name="phone">
                </div>
            </div>
            <div class="col-md-6 field-city">
                <div class="form-group">
                    <label ><?php echo e(__("Город")); ?> </label>
                    <input type="text" class="form-control" value="<?php echo e($user->city ?? ''); ?>" name="city" placeholder="<?php echo e(__("Город проживания")); ?>">
                </div>
            </div>
            <div class="col-md-6 field-country">
                <div class="form-group">
                    <label ><?php echo e(__("Страна")); ?> </label>
                    <select name="country" class="form-control">
                        <option value=""><?php echo e(__('-- Выбрать --')); ?></option>
                        <?php $__currentLoopData = get_country_lists(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id=>$name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option <?php if(($user->country ?? '') == $id): ?> selected <?php endif; ?> value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            </div>
            <div class="col-md-12">
                <label ><?php echo e(__("Специальные требования")); ?> </label>
                <textarea name="customer_notes" cols="30" rows="6" class="form-control" placeholder="<?php echo e(__('Специальные требования')); ?>"></textarea>
            </div>
        </div>
    </div>
    <?php echo $__env->make($service->checkout_form_payment_file ?? 'Booking::frontend/booking/checkout-payment', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <?php
    $term_conditions = setting_item('booking_term_conditions');
    ?>

    <div class="form-group">
        <label class="term-conditions-checkbox">
            <input type="checkbox" name="term_conditions"> <?php echo e(__('Я прочитал и принимаю условия пользования')); ?>

        </label>
    </div>
    <?php if(setting_item("booking_enable_recaptcha")): ?>
        <div class="form-group">
            <?php echo e(recaptcha_field('booking')); ?>

        </div>
    <?php endif; ?>
    <div class="html_before_actions"></div>

    <p class="alert-text mt10" v-show=" message.content" v-html="message.content" :class="{'danger':!message.type,'success':message.type}"></p>

    <div class="form-actions">
        <button class="btn btn-danger" @click="doCheckout"><?php echo e(__('Отправить')); ?>

            <i class="fa fa-spin fa-spinner" v-show="onSubmit"></i>
        </button>
    </div>
</div>
<?php /**PATH /opt/lampp/htdocs/booking8/modules/Booking/Views/frontend/booking/checkout-form.blade.php ENDPATH**/ ?>