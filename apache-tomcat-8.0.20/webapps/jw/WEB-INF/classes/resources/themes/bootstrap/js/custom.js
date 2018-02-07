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
        $("input[type=submit], button").addClass("btn");
    });
}(window.jQuery);