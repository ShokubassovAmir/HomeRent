<?php $__env->startSection('head'); ?>
    <style type="text/css">
        .bravo_topbar, .bravo_header, .bravo_footer {
            display: none;
        }
        html, body, .bravo_wrap, .bravo_user_profile, .row-eq-height > .col-md-3 {
            min-height: 100vh !important;
        }
    </style>
    <link href="<?php echo e(asset('module/user/css/user.css')); ?>" rel="stylesheet">
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="bravo_user_profile">
        <div class="container-fluid">
            <div class="row row-eq-height">
                <div class="col-md-3">
                    <?php echo $__env->make('User::frontend.layouts.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </div>
                <div class="col-md-9">
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
                                <li>&nbsp; <?php echo e(__("Сменить пароль")); ?> </li>
                            </ul>
                            <div class="bravo-more-menu-user">
                                <i class="icofont-settings"></i>
                            </div>
                        </div>
                        <h2 class="title-bar">
                            <?php echo e(__("Сменить пароль")); ?>

                        </h2>
                        <?php echo $__env->make('admin.message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        <form action="<?php echo e(url("/user/profile/change-password")); ?>" method="post">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label><?php echo e(__("Текущий пароль")); ?></label>
                                        <input type="password" name="current-password" placeholder="<?php echo e(__("Текущий пароль")); ?>" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                    <div class="form-group">
                                        <label><?php echo e(__("Новый пароль")); ?></label>
                                        <input type="password" name="new-password" placeholder="<?php echo e(__("Новый пароль")); ?>" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                    <div class="form-group">
                                        <label><?php echo e(__("Введите пароль еще раз")); ?></label>
                                        <input type="password" name="new-password_confirmation" placeholder="<?php echo e(__("Введите пароль еще раз")); ?>" class="form-control">
                                        <i class="fa fa-lock input-icon"></i>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <hr>
                                    <input type="submit" class="btn btn-primary" value="<?php echo e(__("Сменить пароль")); ?>">
                                    <a href="<?php echo e(url("/user/profile")); ?>" class="btn btn-default"><?php echo e(__("Отменить")); ?></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('footer'); ?>
    <script type="text/javascript" src="<?php echo e(asset("module/user/js/user.js")); ?>"></script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\booking8\modules/User/Views/frontend/changePassword.blade.php ENDPATH**/ ?>