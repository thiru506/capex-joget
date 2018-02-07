(function($) {

    var methods = {
        init: function(options) {
            return this.each(function() {
                var element = $(this);

                // check for settings
                var readOnly = false;
                if (options && options.readOnly) {
                    element.attr("readonly", "true");
                    readOnly = true;
                }
                
                var width = "40%";
                if (options && options.width !== undefined &&  options.width !== "") {
                    width = options.width;
                }
                if ($(window).width() <= 767) {
                    width = "100%";
                }

                $(element).chosen({width: width, placeholder_text : " "});
                
                if (!readOnly) {
                    if (options && options.controlField != undefined && options.controlField != "") {
                        $(element).dynamicOptions({
                            controlField : options.controlField,
                            paramName : options.paramName,
                            type : "selectbox",
                            readonly : options.readOnly,
                            nonce : options.nonce,
                            binderData : options.binderData,
                            appId : options.appId,
                            appVersion : options.appVersion,
                            contextPath : options.contextPath
                        });
                        
                        $(element).on("change", function(){
                            $(element).trigger("chosen:updated");
                        });
                    }
                } else {
                    $(element).prop('disabled', true).trigger("chosen:updated").prop('disabled', false);
                }
                
                var hidden = $(element).closest(".ui-screen-hidden");
                $(hidden).find(".chosen-container").insertAfter(hidden);
            });
        }
    };

    $.fn.multiselect = function(method) {

        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.multiselect');
        }

    };

})(jQuery);
