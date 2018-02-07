(function($){
    $.fn.extend({
        multiPagedForm : function(){
            var target = this;
            if($(target)){
                $(target).find(".page-nav-panel li.nav_item button").click(function(){
                    var pageNum = $(this).attr("rel");
                    $(target).find(".changePage").val(pageNum);
                    return true;
                });
            }
            return target;
        }
    });
})(jQuery);