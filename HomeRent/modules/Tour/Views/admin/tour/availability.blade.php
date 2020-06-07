<div class="panel">
    <div class="panel-body">
        <div class="form-group">
            <label>
                <input type="checkbox" name="enable_open_hours" @if(!empty($row->meta->enable_open_hours)) checked @endif value="1"> {{__('Режим работы')}}
            </label>
        </div>
        <?php $old = $row->meta->open_hours ?? [];?>
        <div class="table-responsive form-group" data-condition="enable_open_hours:is(1)">
            <table class="table">
                <thead>
                <tr>
                    <th>{{__('Включить?')}}</th>
                    <th>{{__('День недели')}}</th>
                    <th>{{__('Открытие')}}</th>
                    <th>{{__('Закрытие')}}</th>
                </tr>
                </thead>
                @for($i = 1 ; $i <=7 ; $i++)
                    <tr>
                        <td>
                            <input style="display: inline-block" type="checkbox" @if($old[$i]['enable']  ?? false ) checked @endif name="open_hours[{{$i}}][enable]" value="1">
                        </td>
                        <td><strong>
                                @switch($i)
                                    @case(1)
                                    {{__('Понедельник')}}
                                    @break
                                    @case(2)
                                    {{__('Вторник')}}
                                    @break
                                    @case (3)
                                    {{__('Среда')}}
                                    @break
                                    @case (4)
                                    {{__('Четверг')}}
                                    @break
                                    @case (5)
                                    {{__('Пятница')}}
                                    @break
                                    @case (6)
                                    {{__('Суббота')}}
                                    @break
                                    @case (7)
                                    {{__('Воскресенье')}}
                                    @break
                                @endswitch
                            </strong></td>
                        <td>
                            <select class="form-control" name="open_hours[{{$i}}][from]">
                                <?php
                                $time = strtotime('2019-01-01 00:00:00');
                                for($k = 0; $k <= 23; $k++):

                                $val = date('H:i', $time + 60 * 60 * $k);
                                ?>
                                <option @if(isset($old[$i]) and $old[$i]['from'] == $val) selected @endif value="{{$val}}">{{$val}}</option>

                                <?php endfor;?>
                            </select>
                        </td>
                        <td>
                            <select class="form-control" name="open_hours[{{$i}}][to]">
                                <?php
                                $time = strtotime('2019-01-01 00:00:00');
                                for($k = 0; $k <= 23; $k++):

                                $val = date('H:i', $time + 60 * 60 * $k);
                                ?>
                                <option @if(isset($old[$i]) and  $old[$i]['to'] == $val ) selected @endif value="{{$val}}">{{$val}}</option>

                                <?php endfor;?>
                            </select>
                        </td>
                    </tr>
                @endfor
            </table>
        </div>
    </div>
</div>