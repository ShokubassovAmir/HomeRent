<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title><?php echo e($page_title ?? 'Dashboard'); ?> - <?php echo e(setting_item('site_title') ?? 'Booking'); ?></title>
    <link rel="icon" type="image/png" href="<?php echo e(url('images/favicon.png')); ?>" />

    <meta name="robots" content="noindex, nofollow" />
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">

    <!-- Styles -->
    <link href="<?php echo e(asset('libs/select2/css/select2.min.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('libs/flags/css/flag-icon.min.css')); ?>" rel="stylesheet">

    <link href="<?php echo e(asset('dist/admin/css/vendors.css')); ?>" rel="stylesheet">
    <link href="<?php echo e(asset('dist/admin/css/app.css')); ?>" rel="stylesheet">

    <script>
        var bookingCore  = {
            url:'<?php echo e(url('/')); ?>',
            map_provider:'<?php echo e(setting_item('map_provider')); ?>',
            map_gmap_key:'<?php echo e(setting_item('map_gmap_key')); ?>',
            csrf:'<?php echo e(csrf_token()); ?>'
        };
    </script>
    <?php echo $__env->yieldContent('script.head'); ?>

</head>
<body>
<div id="app">
    <div class="main-header d-flex">
        <?php echo $__env->make('admin.layouts.parts.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
    <div class="main-sidebar">
        <?php echo $__env->make('admin.layouts.parts.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
    <div class="main-content">
        <?php echo $__env->make('admin.layouts.parts.bc', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->yieldContent('content'); ?>
        <footer class="main-footer">
            <div class="container-fluid">
            </div>
        </footer>
    </div>

    <div class="backdrop-sidebar-mobile"></div>
</div>

<?php echo $__env->make('Media::browser', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<!-- Scripts -->


<script src="<?php echo e(asset('dist/admin/js/manifest.js')); ?>" ></script>
<script src="<?php echo e(asset('dist/admin/js/vendor.js')); ?>" ></script>
<script src="<?php echo e(asset('libs/tinymce/js/tinymce/tinymce.min.js')); ?>" ></script>

<script src="<?php echo e(asset('dist/admin/js/app.js')); ?>" ></script>

<script src="<?php echo e(asset('libs/select2/js/select2.min.js')); ?>" ></script>

<?php echo $__env->yieldContent('script.body'); ?>

</body>
</html>
<?php /**PATH /opt/lampp/htdocs/booking8/resources/views/admin/layouts/app.blade.php ENDPATH**/ ?>