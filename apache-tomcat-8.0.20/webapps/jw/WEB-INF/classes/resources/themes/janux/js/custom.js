_customFooTableArgs = {
    breakpoints: { // The different screen resolution breakpoints
        phone: 480,
        tablet: 767
    }
};

!function ($) {
    var bsButton = $.fn.button.noConflict(); // reverts $.fn.button to jqueryui btn
    $.fn.bsButton = bsButton;
    
    //override event to use new method name
    $(document).off('click.button.data-api', '[data-toggle^=button]');
    $(document).on('click.button.data-api', '[data-toggle^=button]', function (e) {
        var $btn = $(e.target)
        if (!$btn.hasClass('btn')) $btn = $btn.closest('.btn')
        $btn.bsButton('toggle')
    })
    
    $(document).ready(function(){
        try {
            $('#sidebar').perfectScrollbar();
        } catch(e) {}
        
        $("#mobile_menu.btn.btn-navbar").click(function(){
            $(".nav-collapse.sidebar-nav").addClass("collapse");
            $(".nav-collapse.sidebar-nav").toggleClass("in");
        });
        
        $("input[type=submit], button").addClass("btn");
        
        $(".category.active > ul").show();
        $(".rowCount").each(function(){
            var count = $(this).text().replace("(", "").replace(")", "");
            $(this).text(count);
            $(this).addClass("pull-right badge");
        });
        $('.category .dropdown').append("<span class=\"pull-right\"><i class=\"fa fa-angle-down\"></i></span>");
        $('.category.active .dropdown .fa-angle-down').addClass("fa-angle-up").removeClass("fa-angle-down");
        $('.category .dropdown').click(function(e){
            e.preventDefault();
            $(this).parent().find('ul').slideToggle();
            if ($(this).find(".fa-angle-down").length > 0) {
                $(this).find(".fa-angle-down").addClass("fa-angle-up").removeClass("fa-angle-down");
            } else {
                $(this).find(".fa-angle-up").addClass("fa-angle-down").removeClass("fa-angle-up");
            }
        });
        $(".category.active > ul").parent().removeClass("active");
        loadInbox();
        widthFunctions();
        
        $(".page_loading").remove();
    });
    
    /* ---------- Inbox ------------------------- */
    function loadInbox() {
        if ($(".inbox-notification").length === 1) {
            loadInboxData();
            $(".inbox-notification .refresh").on("click", function(e){
                e.preventDefault();
                loadInboxData();
            });
        }
    }
    
    function loadInboxData() {
        $(".inbox-notification .loading").show();
        var url = $(".inbox-notification").data("url");
        $.getJSON(url, {}, 
            function (data) {
                var count = 0;
                if (data.count !== undefined) {
                    count = data.count;
                }
                $(".inbox-notification > a > .badge").text(count);
                $(".inbox-notification .dropdown-menu-title .count").text(count);
                
                $(".inbox-notification > ul > li.task").remove();
                if (data.data) {
                    var footer = $(".inbox-notification > ul .dropdown-menu-sub-footer").parent();
                    var link = $(".inbox-notification > ul .dropdown-menu-sub-footer").attr("href");
                    $.each(data.data, function(i, d){
                        var html = "<li class=\"task\"><a href=\""+link+"?_mode=assignment&activityId="+d.activityId+"\">";
                        html += "<span class=\"header\">"+d.activityName+"</span>";
                        html += "<span class=\"message\">"+d.processName+"</span><span class=\"time\">"+d.dateCreated+"</span>";
                        html += "</a></li>";
                        footer.before($(html));
                    });
                }
                
                $(".inbox-notification .loading").hide();
            }
        );
    }
    
    /* ---------- Page width functions ---------- */
    $(window).bind("resize", widthFunctions);
    function widthFunctions(e) {
        var winHeight = $(window).height();
        var winWidth = $(window).width();
        var contentHeight = $("#content").height();

        if (winHeight) {
                $("#content").css("min-height",winHeight);
        }

        if (winWidth < 980 && winWidth > 750) {

            if($("#sidebar-left").hasClass("span2")) {
                $("#sidebar-left").removeClass("span2");
                $("#sidebar-left").addClass("span1");
            }

            if($("#content").hasClass("span10")) {
                $("#content").removeClass("span10");
                $("#content").addClass("span11");
            }
            
            $("#sidebar a").css("white-space", "nowrap");
        } else {
            if($("#sidebar-left").hasClass("span1")) {
                $("#sidebar-left").removeClass("span1");
                $("#sidebar-left").addClass("span2");

            }

            if($("#content").hasClass("span11")) {
                $("#content").removeClass("span11");
                $("#content").addClass("span10");

            }
            
            $("#sidebar a").css("white-space", "normal");
        }
    }

}(window.jQuery);