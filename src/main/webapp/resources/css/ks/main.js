(function ($) {

    var lnb, lnbScroll, visual, visualLayout, visualScroll, onAir, onAirLayout, works, skrollrLayout;

    $(document).ready(function (e) {
        //lnb
        lnb = new Lnb();
        //
        works = new Works();
        //lnb
        lnbScroll = new Scroll({ //common_ui.js
            onUpdate: function (prop) {
                //레이아웃 업데이트
                var top, direction, scrollEnd;
                top = prop["top"];
                direction = prop["direction"];
                scrollEnd = prop["scrollEnd"];

                if (lnb.updatePos() > top) {
                    lnb.updateLnb("top");
                } else {
                    lnb.updateLnb("sub");
                }

                if (top >= $(document).height() - $(window).height() - $("#footer").height()) {
                    lnb.updateLnb("end");
                }

                lnb.updateLnbMenu();
            }
        });
    });

    $(window).load(function (e) {
        //visual
        visual = new Visual({
            introComplete:function(){
                mainSkroller();
            }
        });

        visualLayout = new Layout({ //common_ui.js
            range: {
                pc: 1281,
                tablet: 768,
                mobile: 0
            },
            onUpdate: function (prop) {
                var isHeightChange, name;
                isHeightChange = prop["changeHeight"];
                name = prop["name"];

                if( chkMobile() == "pc"){
                    visual.updateLayout(name);
                }

                visual.fixVideo();
            },
            onChange:function(prop){
                var name = prop["name"];
                visual.checkVideo(name);
            }
        });

        visualScroll = new Scroll({ //common_ui.js
            onUpdate: function (prop) {

                if( visual.getIsIntro() == false && prop["top"] != 0){
                    visual.stopIntro();
                    visual.setIsIntro(true);
                }
            }
        });

        onAir = new OnAir();

        onAirLayout = new Layout({ //common_ui.js
            range: {
                pc: 1024,
                tablet: 768,
                mobile: 0
            },
            onUpdate:function(prop){
                var name = prop["name"];
                onAir.setSlideLayout(name);
            },
            onChange: function (prop) {
                //var name = prop["name"];
                //onAir.setSlideLayout(name);
            }
        });

        if( chkMobile() == "mobile"){
            visual.updateLayout(visualLayout.getState());
        }
    });

    function Lnb() {
        if (!(this instanceof Lnb)) {
            return new Lnb();
        }

        var container, sections, naviCon, menus, lnbType, menuIndex;

        this.updateLnb = function (type) {
            updateLnb(type);
        }

        this.updateLnbMenu = function () {
            checCurrentMenu();
        }

        this.updatePos = function () {
            return getLnbUpdatePos();
        }

        init();

        function init() {
            menuIndex = 0;
            lnbType = "top";
            naviCon = $(".mainSideNavi");
            menus = $(".mainSideNavi>ul>li");
            sections = $(".content.main>.section");

            addEvent();
        }

        function addEvent() {
            menus.find("a").click(function (e) {
                e.preventDefault();
                var idx = menus.find("a").index(this);
                menuMove(idx);
            });
        }

        function menuOpen(idx) {
            menus.each(function (i) {
                if (i == idx) {
                    $(this).addClass("on");
                } else {
                    $(this).removeClass("on");
                }
            });
        }

        function menuMove(idx) {
            var target, targetPos, offset;
            target = sections.eq(idx);
            targetPos = target.offset().top;
            offset = $("#header").height();
            target
                .velocity('stop')
                .velocity("scroll", {
                    duration: 1000,
                    offset: -offset
                })
        }

        function updateLnb(type) {

            if (lnbType != type) {
                if (type == "top") {
                    naviCon.addClass("home");
                    naviCon.removeClass("btm");
                } else if (type == "sub") {
                    naviCon.removeClass("home");
                    naviCon.removeClass("btm");
                    //naviCon.addClass("transition");
                } else if (type == "end") {
                    naviCon.addClass("btm");
                    //naviCon.removeClass("transition");
                }
                lnbType = type;
            }
        }

        function getLnbUpdatePos() {
            return $("#homeArea").height() - 60;
        }

        function checCurrentMenu() {
            sections.each(function (i) {
                var scrollTop = $(window).scrollTop() + (window.innerHeight / 2);
                //console.log($(this).offset().top, scrollTop);
                if ($(this).offset().top <= scrollTop) {
                    menuIndex = i;
                }
            });
            menuOpen(menuIndex)
        }
    }

    function Visual(options) {
        if (!(this instanceof Visual)) {
            return new Visual();
        }

        var visualArea, visualText, frame, title, text, scroll, video, isIntro, videdoSize;

        init();

        this.updateLayout = function (type) {
            updateLayout(type);
        };

        this.getFixRotate = function(){
            return getFixedSize(videdoSize);
        }

        this.fixVideo = function(){
            fixVideo();
        }

        this.checkVideo = function(type){
            checkVideo(type);
        }

        this.setIsIntro = function(type){
            isIntro = type;
        }

        this.getIsIntro = function(){
            return isIntro;
        }

        this.stopIntro = function(){
            stopIntro();
        }

        function init() {
            isIntro = false;
            visualArea = $("#homeArea");
            frame = $("#homeArea .frame");
            title = $("#homeArea dl>dt");
            text = $("#homeArea dl>dd");
            scroll = $("#homeArea .icoScroll");
            video = $("#homeVideo");
            visualText = $(".homeAreaIn");

            frame.css({opacity: 0});
            title.css({opacity: 0});
            text.css({opacity: 0});
            scroll.css({opacity: 0});

            videdoSize = { width: 1660, height: 934 };

            introMotion();

            addEvent();
        }

        function introMotion() {
            frame.velocity({
                scaleX: [1, 0.8],
                scaleY: [1, 0.8],
                opacity: [1, 0]
            }, {
                duration: 1000,
                delay: 500,
                easing: [0.215, 0.61, 0.355, 1]
            });
            title.velocity({
                translateY: [0, 40],
                opacity: [1, 0]
            }, {
                duration: 1300,
                delay: 1000,
                easing: [0.215, 0.61, 0.355, 1]
            });
            text.velocity({
                translateY: [0, 40],
                opacity: [1, 0]
            }, {
                duration: 1300,
                delay: 1600,
                easing: [0.215, 0.61, 0.355, 1]
            });
            scroll.velocity({
                translateY: [0, -40],
                opacity: [1, 0]
            }, {
                duration: 1000,
                delay: 2200,
                easing: [0.215, 0.61, 0.355, 1],
                complete:function(){
                    if( typeof options.introComplete == "function" ){
                        isIntro = true;
                        options.introComplete.call(this);
                    }
                }
            });
        }

        function stopIntro(){
            frame.velocity('finish');
            title.velocity('finish');
            text.velocity('finish');
            scroll.velocity('finish');
        }

        function addEvent(){
            //play
            video.one("canplay", function(e){
                videdoSize = { width: this.videoWidth, height: this.videoHeight };
                fixVideo();
            });
        }

        function updateLayout(type) {
            var targetHeight;

            if( type == "pc"){
                if (window.innerHeight <= 700) {
                    targetHeight = 700 - 70;
                } else {
                    targetHeight = window.innerHeight - 70;
                }
            }else{
                targetHeight = window.innerHeight
            }

            visualArea.css({
                height: targetHeight
            });

            visualText.css({"margin-top":-visualText.height()/2});
        }

        function fixVideo(){

            var marginLeft, marginTop;

            if(getFixedSize(videdoSize) == "fixedWidth"){
                video.css({width:"101%", height:"auto"});
            }else{
                video.css({width:"auto", height:"101%"});
            }

            if( video.width() > window.innerWidth){
                video.css({"margin-left":(window.innerWidth - video.width())/2});
            }else{
                video.css({"margin-left":0});
            }
        }

        //윈도우와 콘텐츠의 비율계산
        function getFixedSize(obj) {
            if (obj != undefined) {
                var orientation, winAspect, targetAspect, wHeight;
                wHeight = window.innerHeight - 70;

                //window, target의 가로세로 비율
                winAspect = wHeight / window.innerWidth;
                targetAspect = obj.height / obj.width;


                if (targetAspect <= winAspect) {
                    orientation = "fixedHeight";
                } else {
                    orientation = "fixedWidth";
                }
                return orientation;
            }
        }

        //화면에따른 비디오 삭제 삽입
        function checkVideo(type){
            var currentVideo = $("#homeVideo");
            if( type == "pc"){
                if( currentVideo.length == 0 && video.length != 0){
                    visualArea.prepend(video);
                    video[0].play();
                }
            }else{
                video.remove();
            }
        }
    }

    function OnAir() {
        if (!(this instanceof OnAir)) {
            return new OnAir();
        }

        var slider, slideWrap, sliderLength, sliderCon, nextBtn, prevBtn, isSlideMotion, currentMode, currentType;

        this.setSlideLayout = function (type) {
            setSlideLayout(type);
        }

        init();

        function init() {
            setSlider();
            addEvent();
        }

        function setSlider() {
            isSlideMotion = false;

            sliderCon = $(".slideWrap ul li");

            sliderLength = $(".slideWrap ul li").length;

            slider = $(".slideWrap ul").bxSlider();

            slideWrap = $(".slideWrap");

            //sliderCon.find('img').css({width:"100%"});
        }

        function setSlideLayout(type) {
            var conWidth, mode;

            var sliderOption = {
                slideWidth: 410,
                maxSlides: 5,
                minSlides: 1,
                moveSlides: 1,
                touchEnabled: false,
                /*preventDefaultSwipeY:true,
                preventDefaultSwipeX:false,
                swipeThreshold:50,
                infiniteLoop:false,*/
                pager: false,
                controls: false,
                onSlideBefore: function () {
                    isSlideMotion = true;
                },
                onSlideAfter: function () {
                    isSlideMotion = false;
                },
                onSliderLoad : function(){
                    //sliderCon.find('img').css({width:"100%"});
                }
            }

            if (type == "pc") {
                sliderOption.slideWidth = 410;
                sliderOption.slideMargin = 34;
            }

            if (type == "tablet") {
                sliderOption.slideWidth = 340;
                sliderOption.slideMargin = 34;
            }

            if (type == "mobile") {
                sliderOption.slideWidth = 177;
                sliderOption.slideMargin = 18;
            }

            conWidth = ((sliderLength * sliderOption.slideWidth ) + ((sliderLength-1) * sliderOption.slideMargin));
            mode = ( conWidth < window.innerWidth)? "big" : "small";

            if( currentMode != mode || currentType != type){

                if( mode == 'big'){
                    sliderOption.infiniteLoop = false;
                }else{
                    sliderOption.infiniteLoop = true;
                }

                slider.reloadSlider(sliderOption);

                if( mode == 'big'){
                    $('#onairArea .slideWrap ul').css({'left':"0%", 'margin-left':"0px"});
                    prevBtn.css('visibility','hidden');
                    nextBtn.css('visibility','hidden');
                }else{
                    $('#onairArea .slideWrap ul').css({'left':"", 'margin-left':""});
                    prevBtn.css('visibility','visible');
                    nextBtn.css('visibility','visible');
                }

                currentMode = mode;
                currentType = type;
            }
        }

        function addEvent() {
            prevBtn = $(".ctrlBtns .prev");
            nextBtn = $(".ctrlBtns .next");

            prevBtn.click(function (e) {
                e.preventDefault();
                if (isSlideMotion == false) slider.goToPrevSlide();
            });

            nextBtn.click(function (e) {
                e.preventDefault();
                if (isSlideMotion == false) slider.goToNextSlide();
            });

            slideWrap.on('swipeleft', function(e){
                e.preventDefault();
                if (isSlideMotion == false) slider.goToNextSlide();
            });

            slideWrap.on('swiperight', function(e){
                e.preventDefault();
                if (isSlideMotion == false) slider.goToPrevSlide();
            });
        }
    }

    function Works() {
        if (!(this instanceof Works)) {
            return new Works();
        }

        var menus;

        init();

        function init() {
            menus = $(".worksListWrap .worksOver");
            //console.log(menus);
            addEvent();
        }

        function addEvent() {
            menus.mouseover(function (e) {
                e.preventDefault();
                $(this)
                    .velocity("stop")
                    .velocity({
                        opacity: 1
                    }, {
                        duration: 300
                    });
            });
            menus.mouseout(function (e) {
                e.preventDefault();
                $(this)
                    .velocity("stop")
                    .velocity({
                        opacity: 0
                    }, {
                        duration: 100
                    });
            });
        }


    }

    function mainSkroller(){

        if( scroller == undefined ){

            skrollrLayout = new Layout({
                range: {
                    pc: 1281,
                    tablet: 768,
                    mobile: 0
                },
                onChange: function (prop) {
                    var name = prop["name"];
                    //처음부터 실행
                    if( typeof skrollr == "object"){
                        if( chkMobile() != 'mobile'){
                            scroller = skrollr.init({skrollrBody:"wrap"});
                        }else{
                            var targetHeight = ($('#issueArea').height() - $('#issueArea>img').height())/2;
                            $('#issueArea>img').css({top:targetHeight});
                        }
                    }
                }
            });
        }else{
            scroller.refresh();
        }
    }

    function chkMobile(){
        var filter = "win16|win32|win64|mac|macintel";
        var mode = "pc"

        if(navigator.platform){
            if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                mode = "mobile";
            }else{
                mode = "pc";
            }
        }
        return mode;
    }
})(jQuery)
