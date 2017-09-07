$(function () {
    // 先取得 #abgne-block-20120527 及其相关区块及元素
    // 并依计算出每等份的宽度
        var slices = 9, // 切成几等份
			index = 0, 	// 预设显示第几个
			ZIndex = 999,
			$block = $('#Imgplay').css('position', 'relative'),
			$slides = $block.find('a').css('z-index', ZIndex).hide(),
			width = $block.width(),
			height = $block.height(),
			sliceWidth = width / slices, // 每等份的宽度
			lastSliceWidth = sliceWidth + (width - sliceWidth * slices), //剩余的宽度
			img = $slides.eq(index).show().find('img').attr('src'),
			timer,
			speed = 3000, // 轮播速度
			animateSpeed = 1000, // 动画速度
			isHover = false, // 滑块鼠标是否移到 $block 上
			isComplete = true; // 动画是否已全部执行完毕

     // 依 slices 数量来产生相对应的 div 区块
    var  sliceDiv = '', control = '';
    for (var i = 0; i < slices; i++) {
        var w = i == slices - 1 ? lastSliceWidth : sliceWidth, l = i * sliceWidth;
        sliceDiv += '<div class="abgne-slice slide-' + i + '" style="left:' + l + 'px;top:0;width:' + w + 'px;height:100%;background-image:url(' + img + ');background-position:-' + l + 'px 0;position:absolute;background-repeat:no-repeat;"></div>';
    }

    // 依 $slides 数量来产生按钮
    for (var i = 0; i < $slides.length; i++) {
        control += '<li class="abgne-control control-' + (i + 1) + '">' + (i + 1) + '</li>';
    }

    // 分别把 div 区块及按钮加入到 $block 中
    var $abgneSlides = $block.append(sliceDiv, '<ul class="abgne-controls">' + control + '</ul>').find('.abgne-slice'),
			$abgneControls = $block.find('.abgne-controls').css('z-index',ZIndex + 2).find('li').eq(index).addClass('current').end();

    // 当点击到 .abgne-controls li 时
    $abgneControls.click(function () {
        // 若动画未完成前不接受其它新的事件
        if (!isComplete) return;

        var $this = $(this),
				$slide = $slides.eq($this.index()),
				completeTotal = 0;

        // 若现在显示的跟点击到的是同一个时, 就不处理
        if ($this.hasClass('current')) return;

        // 帮点击到的 li 加上 .current, 并移除上一个 .current 
        $this.addClass('current').siblings('.current').removeClass('current');
        isComplete = false;
        index = $this.index();

        // 取得相对应的图片的路径
        img = $slide.find('img').attr('src');
        // 先让每一个区块的背景图片为刚刚取得的图片
        // 并进行动画
        $abgneSlides.each(function (i) {
            var $ele = $(this);
            $ele.css({
                top: i % 2 == 0 ? height : -height,
                opacity: 0,
                zIndex: ZIndex + 1,
                backgroundImage: 'url(' + img + ')'
            }).stop().animate({
                top: 0,
                opacity: 1
            }, animateSpeed, function () {
                $ele.css('zIndex', ZIndex - 1);
                if (i == slices - 1) {
                    $block.css('background-image', 'url(' + img + ')');
                    $slide.show().siblings('a:visible').hide();
                    isComplete = true;
                    // 当动画完成且滑鼠没有移到 $block 上时, 再启动计时器
                    if (!isHover) timer = setTimeout(auto, speed);
                }
            });
        });
    });

    $block.hover(function () {
        // 当滑鼠移入 $block 时停止计时器
        isHover = true;
        clearTimeout(timer);
    }, function () {
        // 当滑鼠移出 $block 时启动计时器
        isHover = false;
        timer = setTimeout(auto, speed);
    });

    // 自动轮播使用
    function auto() {
        index = (index + 1) % $slides.length;
        $abgneControls.eq(index).click();
    }

    // 启动计时器
    timer = setTimeout(auto, speed);
});