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
            <li>&nbsp; <?php echo e(__("Настройки")); ?> </li>
        </ul>
        <div class="bravo-more-menu-user">
            <i class="icofont-settings"></i>
        </div>
    </div>
    <h2 class="title-bar">
        <?php echo e(__("Настройки")); ?>

        <a href="<?php echo e(url("/user/profile/change-password")); ?>" class="btn-change-password"><?php echo e(__("Сменить пароль")); ?></a>
    </h2>
    <?php echo $__env->make('admin.message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <form action="<?php echo e(url("/user/profile")); ?>" method="post">
        <?php echo csrf_field(); ?>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label><?php echo e(__("Электронный адрес")); ?></label>
                    <input type="text" value="<?php echo e($dataUser->email); ?>" placeholder="<?php echo e(__("Электронный адрес")); ?>" readonly class="form-control">
                    <i class="fa fa-envelope input-icon"></i>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("Имя")); ?></label>
                    <input type="text" value="<?php echo e($dataUser->first_name); ?>" name="first_name" placeholder="<?php echo e(__("Имя")); ?>" class="form-control">
                    <i class="fa fa-user input-icon"></i>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("Фамилия")); ?></label>
                    <input type="text" value="<?php echo e($dataUser->last_name); ?>" name="last_name" placeholder="<?php echo e(__("Фамилия")); ?>" class="form-control">
                    <i class="fa fa-user input-icon"></i>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("О себе")); ?></label>
                    <textarea name="bio" rows="5" class="form-control"><?php echo e($dataUser->bio); ?></textarea>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("Фото")); ?></label>
                    <div class="upload-btn-wrapper">
                        <div class="input-group">
                            <span class="input-group-btn">
                                <span class="btn btn-default btn-file">
                                    <?php echo e(__("Выбрать")); ?>… <input type="file">
                                </span>
                            </span>
                            <input type="text" data-error="<?php echo e(__("Ошибка...")); ?>" data-loading="<?php echo e(__("Загрузка...")); ?>" class="form-control text-view" readonly value="<?php echo e($dataUser->getAvatarUrl()?? __("Нет фото")); ?>">
                        </div>
                        <input type="hidden" class="form-control" name="avatar_id" value="<?php echo e($dataUser->avatar_id?? ""); ?>">
                        <img class="image-demo" src="<?php echo e($dataUser->getAvatarUrl()?? ""); ?>"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label><?php echo e(__("Город")); ?></label>
                    <input type="text" value="<?php echo e($dataUser->city); ?>" name="city" placeholder="<?php echo e(__("Город проживания")); ?>" class="form-control">
                    <i class="fa fa-street-view input-icon"></i>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("Страна")); ?></label>
                    <select name="country" class="form-control">
                        <option value=""><?php echo e(__('-- Выбрать --')); ?></option>
                        <?php $__currentLoopData = get_country_lists(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id=>$name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option <?php if(($dataUser->country ?? '') == $id): ?> selected <?php endif; ?> value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <div class="form-group">
                    <label><?php echo e(__("Номер телефона")); ?></label>
                    <input type="text" value="<?php echo e($dataUser->phone); ?>" name="phone" placeholder="<?php echo e(__("Номер телефона")); ?>" class="form-control">
                    <i class="fa fa-phone input-icon"></i>
                </div>
            </div>
            <div class="col-md-12">
                <hr>
                <input type="submit" class="btn btn-primary" value="Сохранить изменения">
            </div>
        </div>
    </form>
</div><?php /**PATH /opt/lampp/htdocs/booking8/modules/User/Views/frontend/layouts/profile/index.blade.php ENDPATH**/ ?>