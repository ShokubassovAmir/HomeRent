<div class="sidebar-widget widget_search">
    <form method="get" class="search" action="<?php echo e(url(config('news.news_route_prefix'))); ?>">
        <input type="text" class="form-control" value="<?php echo e(Request::query("s")); ?>" name="s" placeholder="<?php echo e(__("Поиск ...")); ?>">
        <button type="submit" class="icon_search"></button>
    </form>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/News/Views/frontend/layouts/sidebars/search_form.blade.php ENDPATH**/ ?>