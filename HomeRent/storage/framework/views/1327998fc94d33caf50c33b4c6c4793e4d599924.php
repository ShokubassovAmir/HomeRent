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
                                        <?php echo e(__("Главная")); ?>

                                    </a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>&nbsp; <?php echo e(__("Управление апартаментами")); ?> </li>
                            </ul>
                            <div class="bravo-more-menu-user">
                                <i class="icofont-settings"></i>
                            </div>
                        </div>
                        <h2 class="title-bar no-border-bottom">
                            <?php echo e($row->id ? 'Edit: '.$row->title : 'Добавить новый апартамент'); ?>

                        </h2>
                        <?php echo $__env->make('admin.message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        <form action="" method="post">
                            <?php echo csrf_field(); ?>
                            <div class="form-add-service">
                                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                    <a data-toggle="tab" href="#nav-tour-content" aria-selected="true" class="active"><?php echo e(__("1. Содержание")); ?></a>
                                    <a data-toggle="tab" href="#nav-tour-location" aria-selected="false"><?php echo e(__("2. Расположение")); ?></a>
                                    <a data-toggle="tab" href="#nav-tour-pricing" aria-selected="false"><?php echo e(__("3. Цена")); ?></a>
                                    <a data-toggle="tab" href="#nav-availability" aria-selected="false"><?php echo e(__("4. Доступность")); ?></a>
                                    
                                </div>
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-tour-content">
                                        <?php echo $__env->make('Tour::admin/tour/tour-content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                        <div class="form-group">
                                            <label><?php echo e(__("Избранное изображение")); ?></label>
                                            <?php echo \Modules\Media\Helpers\FileHelper::fieldUpload('image_id',$row->image_id); ?>

                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="nav-tour-location">
                                        <?php echo $__env->make('Tour::admin/tour/tour-location', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </div>
                                    <div class="tab-pane fade" id="nav-tour-pricing">
                                        <?php echo $__env->make('Tour::admin/tour/pricing', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </div>
                                    <div class="tab-pane fade" id="nav-availability">
                                        <?php echo $__env->make('Tour::admin/tour/availability', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </div>
                                    <div class="tab-pane fade" id="nav-seo">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <button class="btn btn-primary" type="submit"><?php echo e(__('Сохранить изменения')); ?></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('footer'); ?>
    <script src="<?php echo e(asset('js/condition.js')); ?>"></script>
    <script src="<?php echo e(url('module/core/js/map-engine.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset("module/user/js/user.js")); ?>"></script>
    <script>
        jQuery(function ($) {
            new BravoMapEngine('map_content', {
                fitBounds: true,
                center: [<?php echo e($row->map_lat ?? "51.505"); ?>, <?php echo e($row->map_lng ?? "-0.09"); ?>],
                zoom:<?php echo e($row->map_zoom ?? "8"); ?>,
                ready: function (engineMap) {
                    <?php if($row->map_lat && $row->map_lng): ?>
                    engineMap.addMarker([<?php echo e($row->map_lat); ?>, <?php echo e($row->map_lng); ?>], {
                        icon_options: {}
                    });
                    <?php endif; ?>
                    engineMap.on('click', function (dataLatLng) {
                        engineMap.clearMarkers();
                        engineMap.addMarker(dataLatLng, {
                            icon_options: {}
                        });
                        $("input[name=map_lat]").attr("value", dataLatLng[0]);
                        $("input[name=map_lng]").attr("value", dataLatLng[1]);
                    });
                    engineMap.on('zoom_changed', function (zoom) {
                        $("input[name=map_zoom]").attr("value", zoom);
                    })
                }
            });
        })
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\xampp\htdocs\booking8\modules/User/Views/frontend/manageTour/detail.blade.php ENDPATH**/ ?>