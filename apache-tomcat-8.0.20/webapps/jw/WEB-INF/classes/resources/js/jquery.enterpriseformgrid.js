(function( $ ){
    var contextPath;
    var options;
    
    var methods = {

        init: function(args) {
            options = args.options;
            return this.each(function(){
                var thisObj = $(this);
                
                if (jQuery.browser.msie && jQuery.browser.version === '9.0'){
                    var table = $(this).find("table");
                    var expr = new RegExp('>[ \t\r\n\v\f]*<', 'g');
                    var response_html_fixed = table.html().replace(expr, '><'); //A disgusting hack for ie9. Removes space between open and close <td> tags
                    $(table).html(response_html_fixed.trim());
                }
                
                $(this).find(".grid-row").each(function(rowIndex, row) {
                    var json = $(row).find("textarea").val();
                    methods.decorateRow(row);
                    //methods.fillValue(row, json);
                    methods.updateRowIndex(row, rowIndex);
                });
                methods.disabledMoveAction($(this).find('table'));
                
                // add new row button
                if ($(this).find(".grid-action-add").length == 0) {
                    var link = $('<a class="grid-action-add" href="#"><span>Add Row</span></a>');
                    link.click(function() {
                        var table = $(this).parent();
                        methods.add.apply(thisObj, arguments);
                        return false;
                    });
                    $(this).append(link);
                }
            });
        },
        
        getFrameId: function(id) {
            return "formGridFrame_" + id;
        },
        
        initPopupDialog: function(args){
            contextPath = args.contextPath;
            
            var frameId = methods.getFrameId($(this).attr("id"));
            
            var width = $(this).find('#width').val();
            var height = $(this).find('#height').val();

            JPopup.create(frameId, args.title, width, height);
        },

        add: function() {
            return this.each(function(){
                methods.popupForm($(this).attr('id'), $(this).find('#formUrl').val(), $(this).find('#json').val(), $(this).find('#nonce').val(), $(this).attr('id')+"_add", "{}", "", $(this).find('#height').val(), $(this).find('#width').val());
            });
        },
        
        edit: function(){
            var row = $(this).closest("tr");
            var container = $(row).closest("table").parent();
            
            methods.popupForm($(container).attr('id'), $(container).find('#formUrl').val(), $(container).find('#json').val(), $(container).find('#nonce').val(), $(container).attr('id')+"_edit", "{rowId:'"+$(row).attr('id')+"'}", $(row).find('textarea').val(), $(container).find('#height').val(), $(container).find('#width').val());
        },
        
        popupForm: function(id, url, json, nonce, callback, setting, value, height, width){

            if (value != undefined && value != '') {
                var datas = eval("(" + value + ")");
                if (datas.id) {
                    if (url.indexOf("?") != -1) {
                        url += "&";
                    } else {
                        url += "?";
                    }
                    url += "id=" + datas.id;
                }
            }
            
            if (url.indexOf("?") === -1) {
                url += "?";
            }
            url += UI.userviewThemeParams();

            var params = {
                _json : json,
                _callback : callback,
                _setting : setting,
                _jsonFormData : value,
                _nonce : nonce
            };
            
            var frameId = methods.getFrameId(id);
            JPopup.show(frameId, url, params, "", width, height);
        },
        
        addRow: function(args){
            return $(this).each(function(){
                var frameId = methods.getFrameId($(this).attr('id'));
                
                if (methods.checkDuplicate(this, args) && !$(this).hasClass("readonly")) {
                    // get table
                    var table = $(this).find("table");

                    // clone template
                    var template = $(table).find(".grid-row-template");
                    var newRow = $(template).clone();
                    newRow.removeClass("grid-row-template");
                    newRow.css('display','');
                    newRow.addClass("grid-row");

                    methods.decorateRow(newRow);
                    methods.fillValue(this, newRow, args.result);

                    // append row
                    table.append(newRow);

                    // set input names and values
                    var rowIndex = $(table).find("tr.grid-row").length-1;
                    methods.updateRowIndex(newRow, rowIndex);
                    methods.disabledMoveAction($(newRow).closest("table"));

                    JPopup.hide(frameId);

                    // trigger change
                    $(this).trigger("change");
                    methods.showHidePlusIcon(this);
                } else {
                    JPopup.hide(frameId);
                }
            });
        },
        
        editRow: function(args){
            return $(this).each(function(){
                var frameId = methods.getFrameId($(this).attr('id'));
                
                if (methods.checkDuplicate(this, args) && !$(this).hasClass("readonly")) {
                    // get table
                    var table = $(this).find("table");
                    var row = $(table).find("#"+args.rowId);

                    methods.fillValue(this, row, args.result);

                    JPopup.hide(frameId);

                    // trigger change
                    $(this).trigger("change");
                } else {
                    JPopup.hide(frameId);
                }
            });
        },
        
        checkDuplicate : function (container, args) {
            var okToInsert = true;
            var uniqueKey = $(container).find('#uniqueKey').val();
            if (uniqueKey && uniqueKey != null) {
                // find existing row
                var obj = eval("[" + args.result + "]");
                var uniqueVal = obj[0][uniqueKey];
                if (uniqueVal) {
                    $(container).find(".grid-cell[column_key=" + uniqueKey + "]").each(function() {
                        if (args.rowId && args.rowId != null) {
                            var row = $(this).closest("tr"); 
                            if ($(row).attr("id") == args.rowId) {
                                return true;
                            }
                        }
                        if ($.trim($(this).text()) == uniqueVal) {
                            okToInsert = false;
                            return false;
                        }
                    })
                }
            }
            return okToInsert;
        },
        
        showHidePlusIcon : function (container) {
            var row = $(container).find('#validateMaxRow').val();
            if (row && row != null) {
                var rowcount = $(container).find("tr").length - 2; 
                if (rowcount >= parseInt(row)) {
                    $(container).find(".grid-action-add").hide();
                } else {
                    $(container).find(".grid-action-add").show();
                }
            }
        },
        
        deleteRow: function() {
            var row = $(this).closest("tr");
            var table = $(row).closest("table");
            var container = $(table).parent();
            var deleteMessage = $(container).find('#deleteMessage').val();
            
            if (deleteMessage == "") {
                deleteMessage = "Delete row?";
            }
            if (confirm(deleteMessage)) {
                row.remove();
                
                // reset input names
                methods.updateAllRowIndex(table);
                methods.disabledMoveAction(table);
                
                // trigger change
                var el = table.parent();
                $(el).trigger("change");
                methods.showHidePlusIcon(el);
            }
        },
        
        moveRowUp: function() {
            var currentRow = $(this).closest("tr");
            var prevRow = $(currentRow).prev();
            if(prevRow.attr("id") != "grid-row-template"){
                $(currentRow).after(prevRow);
                methods.updateAllRowIndex($(currentRow).closest("table"));
                methods.disabledMoveAction($(currentRow).closest("table"));
            }
        },
        
        moveRowDown: function() {
            var currentRow = $(this).closest("tr");
            var nextRow = $(currentRow).next();
            if(nextRow.length > 0){
                $(nextRow).after(currentRow);
                methods.updateAllRowIndex($(currentRow).closest("table"));
                methods.disabledMoveAction($(currentRow).closest("table"));
            }
        },
        
        disabledMoveAction: function(table) {
            $(table).find('a.grid-action-moveup').removeClass("disabled");
            $(table).find('a.grid-action-moveup:eq(0)').addClass("disabled");

            $(table).find('a.grid-action-movedown').removeClass("disabled");
            $(table).find('a.grid-action-movedown:last').addClass("disabled");
        },
        
        decorateRow: function(row) {
            var td = $('<td class="grid-action-cell"></td>');
            $(td).append('<a class="grid-action-edit" href="#"><span>Edit Row</span></a>');
            $(td).append('<a class="grid-action-delete" href="#"><span>Delete Row</span></a>');
            $(td).append('<a class="grid-action-moveup" href="#"><span>Move Up</span></a>');
            $(td).append('<a class="grid-action-movedown" href="#"><span>Move Down</span></a>');
            $(td).find('.grid-action-edit').click(function() {
                methods.edit.apply(this, arguments);
                return false;
            });
            $(td).find('.grid-action-delete').click(function() {
                methods.deleteRow.apply(this, arguments);
                return false;
            });
            $(td).find('.grid-action-moveup').click(function() {
                methods.moveRowUp.apply(this, arguments);
                return false;
            });
            $(td).find('.grid-action-movedown').click(function() {
                methods.moveRowDown.apply(this, arguments);
                return false;
            });
            
            $(row).append(td);
        },
        
        fillValue: function(element, row, json) {
            var obj = eval("["+json+"]");
            $(row).find('span.grid-cell').each(function(){
                var column = $(this).attr("column_key");
                var type = $(this).attr("column_type");
                var format = $(this).attr("column_format");
                if (type != undefined && type == "html") {
                    $(this).html(obj[0][column]);
                } else if (type != undefined && (type == "file" || type == "image") && format != undefined && format != "" && value != "") {
                    try{
                        var formDefId = format;
                        var recordId = obj[0]["id"];
                        var value = obj[0][column];
                        var temp = obj[0]["_tempFilePathMap"];
                        var tempFile = false;
                        if (temp != undefined && temp[column] != undefined) {
                            tempFile = true;
                        }
                        if (recordId != undefined && recordId != "" && !tempFile) {
                            var appId = $(element).find('#appId').val();
                            var appVersion = $(element).find('#appVersion').val();
                            var contextPath = $(element).find('#contextPath').val();
                            var filePath = contextPath + "/web/client/app/" + appId + "/" + appVersion + "/form/download/" + formDefId + "/" + recordId + "/" + value;
                            if (type == "image") {
                                var imgfilePath = filePath + ".thumb.jpg.";
                                filePath += ".";
                                value = "<a href=\""+filePath+"\" target=\"_blank\" ><img src=\""+imgfilePath+"\"/></a>";
                            } else {
                                filePath += ".?attachment=true";
                                value = "<a href=\""+filePath+"\" target=\"_blank\" >"+value+"</a>";
                            }
                            $(this).html(value);
                        } else {
                            $(this).text(value);
                        }
                    }catch(e){
                        $(this).text(value);
                    }
                } else {
                    var value = obj[0][column];
                    if (type != undefined && type == "decimal" && format != undefined && format != ""  && (!isNaN(value) || value == "")) {
                        try{
                            if (value == "") {
                                value = "0";
                            }
                            value = parseFloat(value);
                            value = value.toFixed(parseInt(format));
                        }catch(e){}
                    } else if (type != undefined && type == "date" && format != undefined && format != "" && value != "") {
                        try{
                            var dateFormat = format.split('|');
                            if (dateFormat.length == 2) {
                                var d = new Date(getDateFromFormat(value, methods.getDateFormat(dateFormat[0])));
                                value = formatDate(d ,methods.getDateFormat(dateFormat[1]));
                            }
                        }catch(e){}
                    } else if (type != undefined && type == "options" && format != undefined && format != "" && value != "") {
                        try {
                            if (options[column] !== undefined && options[column][value] !== undefined) {
                                value = options[column][value];
                            } 
                        } catch (e) {
                        }
                    }
                    
                    $(this).text(value);
                }
            });
            $(row).find('textarea').each(function(){
                $(this).val(json);
            });
        },
        
        getDateFormat: function(format) {
            if (format.indexOf("MMMMM") !== -1) {
                format = format.replace("MMMMM", "MMM");
            } else if (format.indexOf("MMM") !== -1) {
                format = format.replace("MMM", "NNN");
            }
            return format;
        },
        
        updateRowIndex: function(row, rowIndex){
            var id = $(row).closest("table").parent().attr('id');
            
            $(row).attr("id", id+"_row_"+rowIndex);
            $(row).find("textarea").each(function(){
                $(this).attr("name", $(this).attr("id")+"_"+rowIndex);
            });
            
            $(row).find("span.grid-cell.rowNumber").text(rowIndex + 1);
            
            //update row even/odd css class
            $(row).removeClass("odd");
            $(row).removeClass("even");
            if(rowIndex % 2 == 0){
                $(row).addClass("even");
            }else{
                $(row).addClass("odd");
            }
        },
        
        updateAllRowIndex: function(table) {
            $(table).find(".grid-row").each(function(rowIndex, row) {
                methods.updateRowIndex(row, rowIndex);
            });
        },
        
        refreshIndex: function() {
            return this.each(function(){
                var thisObj = $(this);
                var table = thisObj.find("table");
                
                methods.updateAllRowIndex(table);
                methods.disabledMoveAction(table);
            });
        }
    };

    $.fn.enterpriseformgrid = function( method ) {

        if ( methods[method] ) {
            return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.formgrid' );
        }

    };

})( jQuery );

