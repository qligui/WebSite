$(function () {
    // ��ȡ�� #abgne-block-20120527 ����������鼰Ԫ��
    // ���������ÿ�ȷݵĿ��
        var slices = 9, // �гɼ��ȷ�
			index = 0, 	// Ԥ����ʾ�ڼ���
			ZIndex = 999,
			$block = $('#Imgplay').css('position', 'relative'),
			$slides = $block.find('a').css('z-index', ZIndex).hide(),
			width = $block.width(),
			height = $block.height(),
			sliceWidth = width / slices, // ÿ�ȷݵĿ��
			lastSliceWidth = sliceWidth + (width - sliceWidth * slices), //ʣ��Ŀ��
			img = $slides.eq(index).show().find('img').attr('src'),
			timer,
			speed = 3000, // �ֲ��ٶ�
			animateSpeed = 1000, // �����ٶ�
			isHover = false, // ��������Ƿ��Ƶ� $block ��
			isComplete = true; // �����Ƿ���ȫ��ִ�����

     // �� slices �������������Ӧ�� div ����
    var  sliceDiv = '', control = '';
    for (var i = 0; i < slices; i++) {
        var w = i == slices - 1 ? lastSliceWidth : sliceWidth, l = i * sliceWidth;
        sliceDiv += '<div class="abgne-slice slide-' + i + '" style="left:' + l + 'px;top:0;width:' + w + 'px;height:100%;background-image:url(' + img + ');background-position:-' + l + 'px 0;position:absolute;background-repeat:no-repeat;"></div>';
    }

    // �� $slides ������������ť
    for (var i = 0; i < $slides.length; i++) {
        control += '<li class="abgne-control control-' + (i + 1) + '">' + (i + 1) + '</li>';
    }

    // �ֱ�� div ���鼰��ť���뵽 $block ��
    var $abgneSlides = $block.append(sliceDiv, '<ul class="abgne-controls">' + control + '</ul>').find('.abgne-slice'),
			$abgneControls = $block.find('.abgne-controls').css('z-index',ZIndex + 2).find('li').eq(index).addClass('current').end();

    // ������� .abgne-controls li ʱ
    $abgneControls.click(function () {
        // ������δ���ǰ�����������µ��¼�
        if (!isComplete) return;

        var $this = $(this),
				$slide = $slides.eq($this.index()),
				completeTotal = 0;

        // ��������ʾ�ĸ����������ͬһ��ʱ, �Ͳ�����
        if ($this.hasClass('current')) return;

        // �������� li ���� .current, ���Ƴ���һ�� .current 
        $this.addClass('current').siblings('.current').removeClass('current');
        isComplete = false;
        index = $this.index();

        // ȡ�����Ӧ��ͼƬ��·��
        img = $slide.find('img').attr('src');
        // ����ÿһ������ı���ͼƬΪ�ո�ȡ�õ�ͼƬ
        // �����ж���
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
                    // ����������һ���û���Ƶ� $block ��ʱ, ��������ʱ��
                    if (!isHover) timer = setTimeout(auto, speed);
                }
            });
        });
    });

    $block.hover(function () {
        // ���������� $block ʱֹͣ��ʱ��
        isHover = true;
        clearTimeout(timer);
    }, function () {
        // �������Ƴ� $block ʱ������ʱ��
        isHover = false;
        timer = setTimeout(auto, speed);
    });

    // �Զ��ֲ�ʹ��
    function auto() {
        index = (index + 1) % $slides.length;
        $abgneControls.eq(index).click();
    }

    // ������ʱ��
    timer = setTimeout(auto, speed);
});