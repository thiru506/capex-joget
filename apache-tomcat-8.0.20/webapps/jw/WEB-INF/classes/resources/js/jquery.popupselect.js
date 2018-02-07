(function( $ ){
    var dialogbox;
    var contextPath;
    
    var methods = {

        init: function(options) {
            return this.each(function() {
                var element = $(this);
                contextPath = options.contextPath;
                $(this).data('fieldName', options.fieldName);
                $(this).data('appId', options.appId);
                $(this).data('appVersion', options.appVersion);
                $(this).data('listId', options.listId);
                $(this).data('label', options.buttonLabel);
                $(this).data('title', options.title);
                $(this).data('primaryKey', options.primaryKey);
                $(this).data('idField', options.idField);
                $(this).data('displayField', options.displayField);
                $(this).data('type', (options.multiple == "true")? "" : "single");
                $(this).data('requestParams', options.requestParams);
                $(this).data('width', options.width);
                $(this).data('height', options.height);
                $(this).data('nonce', options.nonce);

                // check for settings
                var readOnly = false;
                if (options && options.readOnly) {
                    element.attr("readonly", "true");
                    readOnly = true;
                }

                // remove name atttribute to prevent duplicate submission as form parameter
                element.attr("name", "");

                // hide select box
                element.css("display", "none");

                // create new item
                var span = '<span class="selector_element">';
                if (!readOnly) {
                    span += '<button class="selector_button">'+options.buttonLabel+'</button>';
                }
                span += '<span class="selector_items"></span></span>';

                // append item
                element.parents(".ui-screen-hidden").after(span);

                if (!readOnly) {
                    var button = element.parents(".ui-screen-hidden").next(".selector_element").children(".selector_button");
                    $(button).click(function() {
                        methods.add.apply(element);
                        return false;
                    });
                }

                // refresh
                methods.refresh.apply(element);
            });
        },
        
        getFrameId: function(id) {
            return "popupSelectFrame_" + id;
        },
        
        initPopupDialog: function(args){
            
            var frameId = methods.getFrameId($(this).attr("id"));

            var width = $(this).data('width');
            var height = $(this).data('height');
            JPopup.create(frameId, args.title, width, height);
        },
        
        popupForm: function(id) {
            var frameId = methods.getFrameId(id);
            
            var params = "";
            
            if ($(this).data('requestParams') != undefined) {
                params = FormUtil.getFieldsAsUrlQueryString($(this).data('requestParams'));
                
                if (params !== "") {
                    params = "&" + params; 
                }
            }

            var width = $(this).data('width');
            var height = $(this).data('height');
            var url = contextPath+'/web/app/'+$(this).data('appId')+'/'+$(this).data('appVersion')+'/datalist/embed?id='+id+params+UI.userviewThemeParams();
            
            var vars = {
                _frameId : frameId,
                _listId : $(this).data('listId'),
                _type : $(this).data('type'),
                _submitButtonLabel : $(this).data('label'),
                _callback : id+'_add',
                _setting : "{}",
                _nonce : $(this).data('nonce')
            };

            JPopup.show(frameId, url, vars, "", width, height, "get");
        },
        
        add: function() {
            return this.each(function() {
                methods.popupForm.call(this, $(this).attr('id'));
            });
        },
        
        addOption: function(args) {
            return this.each(function() {
                var frameId = methods.getFrameId($(this).attr("id"));
                
                var element = $(this);
                var primaryKey = $(element).data("primaryKey");
                var idField = $(element).data("idField");
                var displayField = $(element).data("displayField");
                var obj = eval("[" + args.result + "]");
                    
                var value = args.id;
                if (idField != "") {
                    value = obj[0][idField];                    
                }
                //check option exist, if not, add it
                if ($(element).find("option[value=\""+value+"\"]").length == 0) {
                    var label = obj[0][displayField];
                    var option = $("<option></option>");
                    option.attr("value", value);
                    option.html(label);
                    $(element).append(option);
                }
                
                // select option
                var val = $(element).val();
                if (typeof val == "string") {
                    var previous = val;
                    val = new Array();
                    
                    if (element.attr("multiple")) {
                        val.push(previous);
                    }
                } else if (!val) {
                    val = new Array();
                }
                val.push(value);
                $(element).val(val);
                
                
                methods.refresh.apply(element);
                $("[name=" + $(element).data("fieldName") + "]").trigger("change");
                
                JPopup.hide(frameId);
            });
        },
        
        refresh: function() {
            return this.each(function() {
                var element = $(this);
                var elementId = element.attr("id");
                var readOnly = element.attr("readonly");

                // clear items
                var selectorItems = element.parents(".ui-screen-hidden").next(".selector_element").find(".selector_items");
                selectorItems.empty();

                // show selected items
                element.children("option:selected").each(function(index, el) {
                    // create new item
                    var value = $(el).val();
                    var label = $(el).attr("html");
                    if (!label || label == '') {
                        label = $(el).text();
                    }

                    // create new item
                    var span = '<span class="selector_item">';
                    if (!readOnly) {
                        span += '<a class="selector_remove" href="#">x</a>';
                    }
                    span += '<input type="hidden" class="selector_id" id="' + elementId + '" name="' + $(element).data("fieldName") + '" value="' + value + '"/><span class="selector_label">' + label + '</span></span>';

                    // append item
                    selectorItems.append(span);
                });

                if (!readOnly) {
                    // initialize item remove link
                    element.parents(".ui-screen-hidden").next(".selector_element").find(".selector_remove").click(function(event, ui) {
                        event.preventDefault();
                        var item = $(this).siblings(".selector_id").val();
                        
                        //remove value and trigger change
                        $(this).siblings(".selector_id").val("");
                        $("[name=" + $(element).data("fieldName") + "]").trigger("change");
                        
                        element.children("option:selected").each(function(index, el) {
                            var value = $(el).val();
                            if (value == item) {
                                // remove selection
                                $(el).removeAttr("selected");

                                // refresh
                                methods.refresh.apply(element);

                                return false;
                            }
                        });
                        return false;
                    });
                }
            });
        }

    };

    $.fn.popupselect = function( method ) {

        if ( methods[method] ) {
            return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.popupselect' );
        }

    };

})( jQuery );

