<div class="panel">
    <div class="panel-title"><strong><?php echo e(__("Расположение апартамента")); ?></strong></div>
    <div class="panel-body">
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Место расположения")); ?></label>
            <div class="">
                <select name="location_id" class="form-control">
                    <option value=""><?php echo e(__("-- Выбрать --")); ?></option>
                    <?php
                    $traverse = function ($locations, $prefix = '') use (&$traverse, $row) {
                        foreach ($locations as $location) {
                            $selected = '';
                            if ($row->location_id == $location->id)
                                $selected = 'selected';
                            printf("<option value='%s' %s>%s</option>", $location->id, $selected, $prefix . ' ' . $location->name);
                            $traverse($location->children, $prefix . '-');
                        }
                    };
                    $traverse($tour_location);
                    ?>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label"><?php echo e(__("Объявление на карте")); ?></label>
            <div class="control-map-group">
                <div id="map_content"></div>
            </div>
        </div>
    </div>
</div><?php /**PATH D:\xampp\htdocs\booking8\modules/Tour/Views/admin/tour/tour-location.blade.php ENDPATH**/ ?>