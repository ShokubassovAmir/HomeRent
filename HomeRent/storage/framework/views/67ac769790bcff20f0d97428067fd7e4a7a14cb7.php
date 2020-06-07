<div class="item-tour <?php echo e($wrap_class ?? ''); ?>">
    <?php if($row->is_featured == "1"): ?>
        <div class="featured">
            <?php echo e(__("ТОП")); ?>

        </div>
    <?php endif; ?>
    <div class="thumb-image ">
        <a <?php if(!empty($blank)): ?> target="_blank" <?php endif; ?> href="<?php echo e($row->getDetailUrl()); ?>">
            <?php if($row->image_url): ?>
                <?php if(!empty($disable_lazyload)): ?>
                    <img src="<?php echo e($row->image_url); ?>" class="img-responsive" alt="">
                <?php else: ?>
                    <?php echo get_image_tag($row->image_id,'medium',['class'=>'img-responsive','alt'=>$row->title]); ?>

                <?php endif; ?>
            <?php endif; ?>
        </a>
    </div>
    <div class="location">
        <?php if(!empty($row->location->name)): ?>
            <i class="icofont-paper-plane"></i>
            <?php echo e($row->location->name ?? ''); ?>

        <?php endif; ?>
    </div>
    <div class="item-title">
        <a <?php if(!empty($blank)): ?> target="_blank" <?php endif; ?> href="<?php echo e($row->getDetailUrl()); ?>">
            <?php echo e($row->title); ?>

        </a>
    </div>
    <?php
    $reviewData = $row->getScoreReview();
    $score_total = $reviewData['score_total'];
    ?>
    <div class="service-review tour-review-<?php echo e($score_total); ?>">
        <div class="list-star">
            <ul class="booking-item-rating-stars">
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
            </ul>
            <div class="booking-item-rating-stars-active" style="width: <?php echo e($score_total * 2 * 10 ?? 0); ?>%">
                <ul class="booking-item-rating-stars">
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                    <li><i class="fa fa-star"></i></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="info">
        <div class="g-price">
            <div class="prefix">
                <i class="icofont-flash"></i>
                <span class="fr_text"><?php echo e(__("от")); ?></span>
            </div>
            <div class="price">
                <span class="text-price"><?php echo e($row->display_price); ?></span>
            </div>
        </div>
    </div>
</div>
<?php /**PATH D:\xampp\htdocs\booking8\modules/Tour/Views/frontend/layouts/search/loop-gird.blade.php ENDPATH**/ ?>