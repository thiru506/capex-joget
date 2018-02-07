(function($) {
    var messages;

    var methods = {
        init: function(args) {
            messages = args.messages;
            return this.each(function() {
                var thisObj = $(this);
                var $grid = null;
                
                var pqMethod = {
                    txt: "",
                    rowIndices: [],
                    curIndx: null,
                    colIndx: 0,
                    sortIndx: null,
                    sortDir: null,
                    search: function() {
                        var txt = $("input.pq-search-txt").val(),
                                colIndx = $("select#pq-crud-select-column").val(),
                                DM = $grid.pqGrid("option", "dataModel"),
                                sortIndx = DM.sortIndx,
                                sortDir = DM.sortDir;
                        if (txt == this.txt && colIndx == this.colIndx && sortIndx == this.sortIndx && sortDir == this.sortDir) {
                            return;
                        }
                        this.rowIndices = [], this.curIndx = null;
                        this.sortIndx = sortIndx;
                        this.sortDir = sortDir;
                        if (colIndx != this.colIndx) {
                            $grid.pqGrid("option", "customData", null);
                            $grid.pqGrid("refreshColumn", {colIndx: this.colIndx});
                            this.colIndx = colIndx;
                        }

                        if (txt != null && txt.length > 0) {
                            txt = txt.toUpperCase();
                            //this.colIndx = $("select#pq-crud-select-column").val();

                            var data = DM.data;
                            //debugger;
                            for (var i = 0; i < data.length; i++) {
                                var row = data[i];
                                var cell = row[this.colIndx].toUpperCase();
                                if (cell.indexOf(txt) != -1) {
                                    this.rowIndices.push(i);
                                }
                            }
                        }
                        $grid.pqGrid("option", "customData", {foundRowIndices: this.rowIndices, txt: txt, searchColIndx: colIndx});
                        if (colIndx !== undefined) {
                            $grid.pqGrid("refreshColumn", {colIndx: colIndx});
                        }
                        this.txt = txt;
                    },
                    render: function(ui) {
                        var rowIndxPage = ui.rowIndxPage,
                                rowIndx = ui.rowIndx,
                                rowData = ui.rowData,
                                dataIndx = ui.dataIndx,
                                colIndx = ui.colIndx,
                                bodyText = rowData[dataIndx];

                        if (ui.customData) {
                            var rowIndices = ui.customData.foundRowIndices,
                                    searchColIndx = ui.customData.searchColIndx,
                                    searchTerm = ui.customData.txt,
                                    lcSearchTerm = searchTerm.toLowerCase(),
                                    lcBodyText = bodyText.toLowerCase();

                            if ($.inArray(rowIndx, rowIndices) !== -1 && colIndx === searchColIndx) {
                                var highlightStartTag = "<font style='color:black;background-color:yellow;'>";
                                var highlightEndTag = "</font>";

                                var newText = "";
                                var i = -1;

                                while (bodyText.length > 0) {
                                    i = lcBodyText.indexOf(lcSearchTerm, i + 1);
                                    if (i < 0) {
                                        newText += bodyText;
                                        bodyText = "";
                                    } else {
                                        // skip anything inside an HTML tag
                                        if (bodyText.lastIndexOf(">", i) >= bodyText.lastIndexOf("<", i)) {
                                            // skip anything inside a <script> block
                                            if (lcBodyText.lastIndexOf("/script>", i) >= lcBodyText.lastIndexOf("<script", i)) {
                                                newText += bodyText.substring(0, i) + highlightStartTag + bodyText.substr(i, searchTerm.length) + highlightEndTag;
                                                bodyText = bodyText.substr(i + searchTerm.length);
                                                lcBodyText = bodyText.toLowerCase();
                                                i = -1;
                                            }
                                        }
                                    }
                                }
                                return newText;
                            }
                        }
                        return bodyText;
                    },
                    editor: function(ui) {
                        var $cell = ui.$cell, rowIndx = ui.rowIndx, rowIndxPage=ui.rowIndxPage, colIndx = ui.colIndx;
                        var DM = $grid.pqGrid("option", "dataModel");
                        var data = DM.data;
                        var tbl = $(thisObj).find("table");
                        var json = data[rowIndx][data[rowIndx].length - 1];
                        var obj = eval("[" + json + "]");
                        var key = DM.columnKey[colIndx - 1];
                        var value = obj[0][key];
                        var elementJson = tbl.find(".grid-row-editor td textarea[key=" + key + "]").val();
                        var id = "";
                        if (obj[0]["id"] !== undefined) {
                            id = obj[0]["id"];
                        }
                        $(thisObj).find(".focused_cell").removeClass("focused_cell");
                        $(thisObj).find("[pq-row-indx='"+rowIndxPage+"'] [pq-col-indx='"+colIndx+"']").addClass("focused_cell");
                        $cell.addClass("has_editor_cell");

                        //handle file upload
                        if (obj[0]["_tempFilePathMap"] !== undefined && obj[0]["_tempFilePathMap"][key] !== undefined) {
                            value = obj[0]["_tempFilePathMap"][key];
                        }
                        
                        var data = {
                            _nonce: args.nonce,
                            _paramName: args.paramName,
                            _appId: args.appId,
                            _appVersion: args.appVersion,
                            _fieldId: key,
                            _formdefid : args.formdefid,
                            _json: elementJson,
                            _a: 'getEditor',
                            _id: id,
                            _dataJson: json
                        };
                        
                        if (value !== undefined) {
                            data['_value'] = value;
                        }
                        
                        $.ajax({
                            data: data,
                            dataType: "text",
                            url: args.url,
                            success: function(response) {
                                var editorCell = $(response);
                                pqMethod.populateCell($cell, editorCell, rowIndx, colIndx);
                            }
                        });
                    },
                    populateCell: function(cell, html, rowIndx, colIndx) {
                        html.find(".label").remove();
                        html.find(".form-cell-value").addClass("editor-cell-value").removeClass("form-cell-value");
                        html.filter(".form-cell").attr("rowIndx", rowIndx);
                        html.filter(".form-cell").attr("colIndx", colIndx);
                        html.filter(".form-cell").addClass("editor-cell").removeClass("form-cell");

                        cell.html("");
                        html.appendTo(cell);

                        var editorCell = html.filter(".editor-cell");

                        //add save & cancel button
                        var buttons = $("<div class=\"actions-buttons\"><button class=\"save clickable\">"+messages['form.advancedgrid.button.save']+"</button><button class=\"cancel clickable\">"+messages['form.advancedgrid.button.cancel']+"</button></div>");
                        buttons.appendTo(editorCell);

                        $(editorCell).find(".save").click(function(event) {
                            var e;
                            if (window.opera) {
                                e = $.Event('keypress.pq-grid');
                            } else {
                                e = $.Event('keydown.pq-grid');
                            }
                            if (args.keyToSave) {
                                e.keyCode = args.keyToSave;
                            } else {
                                e.keyCode = 9;
                            }
                            pqMethod.saveEvent(e);
                            return false;
                        });
                        $(editorCell).find(".cancel").click(function() {
                            $grid.pqGrid("quitEditMode");
                            return false;
                        });
                        if (args.keyToSave != 9) {
                            var tabbables = $(editorCell).find(':tabbable');
                            var first = tabbables.filter(':first');
                            var last  = tabbables.filter(':last');
                            $(editorCell).on("keydown", ":tabbable", function(e) {
                                var keyCode = e.keyCode || e.which;
                                if (keyCode === 9) {
                                    var focusedElement = $(e.target);

                                    var isFirstInFocus = (first.get(0) === focusedElement.get(0));
                                    var isLastInFocus = (last.get(0) === focusedElement.get(0));

                                    var tabbingForward = !e.shiftKey;

                                    if (tabbingForward) {
                                        if (isLastInFocus) {
                                            first.focus();
                                            e.preventDefault();
                                        }
                                    } else {
                                        if (isFirstInFocus) {
                                            last.focus();
                                            e.preventDefault();
                                        }
                                    }
                                } else {
                                    pqMethod.keyPress(e);
                                }
                            });
                        } else {
                            $(editorCell).on("keydown", ":tabbable", function(e) {
                                pqMethod.keyPress(e);
                            });
                        }
                        //move it out
                        $(editorCell).appendTo(thisObj);

                        //override keypress event
                        $(editorCell).bind("keypress.editor_cell", function(evt) {
                            pqMethod.keyPress(evt);
                        });

                        //check for editor size
                        var editor_width = $(editorCell).width();
                        var grid_width = $($grid).width();
                        var cell_top = cell.offset().top - $grid.offset().top;
                        var cell_left = cell.offset().left - $grid.offset().left;
                        var top = cell_top;
                        var left = cell_left;

                        //fix width issue for tinymce
                        if ($(editorCell).find("textarea.tinymce").length > 0) {
                            editor_width = 680;
                        }

                        if (left + editor_width > grid_width) {
                            left = left - ((left + editor_width) - grid_width) - 10;
                        }

                        editorCell.css("left", left);
                        editorCell.css("top", top);
                        editorCell.css("z-index", "1");

                        var input = editorCell.find("input[name], textarea[name], select[name], .chosen-container");

                        window.setTimeout(function() {
                            if (input.is(".chosen-container")) {
                                input.trigger('chosen:activate');
                            } else {
                                input.focus();
                            }
                        }, 2);
                    },
                    saveEvent: function(evt) {
                        var editorCell = $(thisObj).find(".editor-cell");
                        var $cell = $(thisObj).find(".pq-cell-selected-border-edit");
                        var rowIndx = editorCell.attr("rowIndx");
                        var colIndx = editorCell.attr("colIndx");
                        var DM = $grid.pqGrid("option", "dataModel");
                        var tbl = $(thisObj).find("table");
                        var json = DM.data[rowIndx][DM.data[rowIndx].length - 1];
                        var obj = eval("[" + json + "]");
                        var key = DM.columnKey[colIndx - 1];
                        var value = (obj[0][key] !== undefined)?obj[0][key]:"";
                        var elementJson = tbl.find(".grid-row-editor td textarea[key=" + key + "]").val();
                        var id = "";
                        if (obj[0]["id"] !== undefined) {
                            id = obj[0]["id"];
                        }

                        //fix for tinymce cannot save
                        if ($(editorCell).find(".mceEditor").length > 0) {
                            var tinymceValue = $(editorCell).find("textarea.tinymce").val();
                            var tinymceFieldName = $(editorCell).find("textarea.tinymce").attr("name");

                            $(editorCell).find(".mceEditor").remove();
                            $(editorCell).find("textarea.tinymce").remove();

                            $(editorCell).prepend("<textarea name=\"" + tinymceFieldName + "\"></textarea>");
                            $(editorCell).find("[name=" + tinymceFieldName + "]").val(tinymceValue);
                        }

                        //append a form and an iframe to handle submit
                        var form = $('<form method="post" enctype="multipart/form-data" style="display:none;" target="advancedGridFrame" action="' + args.url + '"><input id="_id" name="_id"/><input id="_nonce" name="_nonce"/><input id="_paramName" name="_paramName"/><input id="_appId" name="_appId"/><input id="_appVersion" name="_appVersion"/><input id="_fieldId" name="_fieldId"/><input id="_formdefid" name="_formdefid"/><input id="_json" name="_json"/><input id="_a" name="_a"/><input id="_value" name="_value"/></form>');
                        var iframe = $('<iframe id="advancedGridFrame" name="advancedGridFrame" style="display:none;"></iframe>');
                        $(document.body).append(form);
                        $(document.body).append(iframe);
                        $(form).find('#_id').val(id);
                        $(form).find('#_nonce').val(args.nonce);
                        $(form).find('#_paramName').val(args.paramName);
                        $(form).find('#_appId').val(args.appId);
                        $(form).find('#_appVersion').val(args.appVersion);
                        $(form).find('#_fieldId').val(key);
                        $(form).find('#_formdefid').val(args.formdefid);
                        $(form).find('#_json').val(elementJson);
                        $(form).find('#_dataJson').val(json);
                        $(form).find('#_value').val(value);
                        $(form).find('#_a').val("editorSubmit");
                        $(editorCell).appendTo(form);
                        $(form).submit();
                        $(form).remove();

                        pqMethod.updateData(evt, iframe, $cell, editorCell, tbl, obj, key, json, DM, rowIndx, colIndx);
                    },
                    updateData: function(evt, iframe, $cell, editorCell, tbl, obj, key, json, DM, rowIndx, colIndx) {
                        try {
                            var iframeContent = $(iframe).contents();
                            if (iframeContent.find("div").length > 0) {
                                if (iframeContent.find(".readonly_value").length > 0) {
                                    var value = iframeContent.find(".value").text();
                                    if (iframeContent.find(".value").find("*").length > 0) {
                                        value = iframeContent.find(".value").html();
                                    }
                                    obj[0][key] = value;

                                    //handle file
                                    var paths = iframeContent.find(".tempFilePathMap .path");
                                    if ($(paths).length > 0) {
                                        if (obj[0]["_tempFilePathMap"] === undefined) {
                                            obj[0]["_tempFilePathMap"] = new Object();
                                        }

                                        $(paths).each(function() {
                                            var fid = $(this).attr("id");
                                            var p = $(this).text();
                                            obj[0]["_tempFilePathMap"][fid] = p.split(";");
                                        });
                                    } else if (obj[0]["_tempFilePathMap"] !== undefined && obj[0]["_tempFilePathMap"][key] !== undefined) {
                                        delete obj[0]["_tempFilePathMap"][key];
                                    }

                                    //update json
                                    json = JSON.encode(obj);
                                    json = json.substring(1, json.length - 1);
                                    DM.data[rowIndx][DM.data[rowIndx].length - 1] = json;

                                    var indexKey = DM.data[rowIndx][0];
                                    tbl.find("tr.key_" + indexKey).find("[column_key=" + key + "]").text(value);
                                    tbl.find("tr.key_" + indexKey).find("textarea").val(json);
                                    var valueHtml = iframeContent.find(".readonly_value").html();
                                    var html = $(valueHtml);
                                    $(html).find(".label, input, textarea, select").remove();
                                    $cell.html($(html).html());
                                    $cell.removeClass("has_editor_cell");

                                    //update grid 
                                    $grid.pqGrid("keyPressDown", evt);
                                } else if (iframeContent.find(".error").length > 0) {
                                    var errorHtml = iframeContent.find(".error").html();
                                    editorCell = $(errorHtml);
                                    $(editorCell).addClass("error");
                                    pqMethod.populateCell($cell, editorCell, rowIndx, colIndx);
                                    var message = iframeContent.find(".message").text();
                                    if (message !== "") {
                                        alert(message);
                                    }
                                }
                                $(iframe).remove();
                            } else {
                                setTimeout(function() {
                                    pqMethod.updateData(evt, iframe, $cell, editorCell, tbl, obj, key, json, DM, rowIndx, colIndx);
                                }, 100);
                            }
                        } catch (err) {}
                    },
                    save: function(ui) {
                        var $cell = ui.$cell;
                        var value = $cell.html();

                        tbl.closest(".form-element").trigger("change");

                        return value;
                    },
                    quitEditMode: function(event, ui) {
                        $(thisObj).find(".has_editor_cell").removeClass("has_editor_cell");
                        var editorCell = $(thisObj).find(".editor-cell");
                        editorCell.remove();
                    },
                    getRowIndx: function() {
                        var arr = $grid.pqGrid("selection", {type: 'row', method: 'getSelection'});
                        if (arr && arr.length > 0) {
                            var rowIndx = arr[0].rowIndx;

                            //if (rowIndx != null && colIndx == null) {
                            return rowIndx;
                        }
                        else {
                            alert(messages['form.advancedgrid.button.delete.selectARow']);
                            return null;
                        }
                    },
                    getRowIndxArray: function() {
                        var arr = $grid.pqGrid("selection", {type: 'row', method: 'getSelection'});
                        if (arr && arr.length > 0) {
                            return arr;
                        }
                        else {
                            alert(messages['form.advancedgrid.button.delete.selectARow']);
                            return null;
                        }
                    },
                    deleteRow: function() {
                        var rowIndxArray = this.getRowIndxArray();
                        if (rowIndxArray != null) {
                            var nextFocusIndx = null;
                            if (confirm(args.deleteMessage)) {
                                var DM = $grid.pqGrid("option", "dataModel");
                                for (var i = rowIndxArray.length - 1; i >= 0 ; i-- ) {
                                    var rowIndx = rowIndxArray[i].rowIndx;
                                    var key = DM.data[rowIndx][0];
                                    
                                    DM.data.splice(rowIndx, 1);
                                    $grid.pqGrid("refreshDataAndView");
                                    $grid.pqGrid("setSelection", null);

                                    tbl.find("tr.key_" + key).remove();
                                    
                                    if (nextFocusIndx == null || nextFocusIndx > rowIndx) {
                                        nextFocusIndx = rowIndx;
                                    }
                                }
                                
                                this.reindex();
                                
                                if (nextFocusIndx !== null) {
                                    var rowIndx = nextFocusIndx - 1;
                                    if (rowIndx < 0) {
                                        rowIndx = 0;
                                    }
                                    $grid.pqGrid("setSelection", null );
                                    $grid.pqGrid("setSelection", {rowIndx:rowIndx});
                                    $(thisObj).find(".pq-row-select.ui-state-highlight [pq-col-indx='1']").addClass("focused_cell");
                                }
                                
                                var id = tbl.closest(".form-element").attr("name");
                                tbl.closest(".form-element").trigger("change");
                            }
                        }
                    },
                    addRow: function() {
                        var key = this.uuid();

                        var DM = $grid.pqGrid("option", "dataModel");
                        var data = DM.data;
                        
                        var id = tbl.closest(".form-element").attr("name");
                        var template = tbl.find(".grid-row-template");
                        var newRow = $(template).clone();

                        newRow.removeClass("grid-row-template");
                        newRow.css('display', '');
                        newRow.addClass("grid-row");
                        newRow.addClass("key_" + key);
                        newRow.find("textarea").val("{}");
                        
                        var after = template;
                        var length = data.length;
                        var pos = 0;
                        
                        var temp = args.rows.slice();
                        temp[0] = key;
                        
                        var rowIndx = null;
                        var arr = $grid.pqGrid("selection", {type: 'row', method: 'getSelection'});
                        if (arr && arr.length > 0) {
                            rowIndx = arr[0].rowIndx;
                        }
                        if (rowIndx != null) {
                            var key = data[rowIndx][0];
                            data.splice(rowIndx + 1, 0, temp);
                            after = tbl.find("tr.key_" + key);
                            pos = rowIndx + 1;
                        } else {
                            data.splice(length, 0, temp);
                            
                            if (length > 0) {
                                var key = data[length - 1][0];
                                after = tbl.find("tr.key_" + key);
                                pos = length;
                            }
                        }
                        
                        newRow.insertAfter(after);
                        
                        $grid.pqGrid("refreshDataAndView");
                        this.reindex();
                        tbl.closest(".form-element").trigger("change");
                        
                        $grid.pqGrid("setSelection", null);
                        $grid.pqGrid("setSelection", { rowIndx: pos, focus: true });
                    },
                    reindex: function() {
                        tbl.find(".grid-row").each(function(rowIndex, row) {
                            var id = tbl.closest(".form-element").attr("name");
                            $(row).attr("id", id + "_row_" + rowIndex);
                            $(row).find("textarea").each(function() {
                                $(this).attr("name", $(this).attr("id") + "_" + rowIndex);
                            });

                            $(row).find("span.grid-cell.rowNumber").text(rowIndex + 1);
                        });
                        pqMethod.showHidePager();
                    },
                    uuid: function() {
                        return 'xxxxxxxxxx'.replace(/[x]/g, function(c) {
                            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                            return v.toString(16);
                        }).toUpperCase();
                    },
                    keyPress: function(evt) {
                        if ($(thisObj).find(".has_editor_cell").length > 0) {
                            if (evt.keyCode == 13 && ($(evt.target).is("textarea, a, button, input[buttom], input[submit]") || 
                                $(evt.target).closest(".editor-cell").find(".chosen-with-drop").length > 0)) {
                                //ignore
                            } else if (evt.keyCode == 9 || evt.keyCode == args.keyToSave) {
                                pqMethod.saveEvent(evt);
                            } else if (evt.keyCode == 27) {
                                $grid.pqGrid("quitEditMode");
                                evt.preventDefault();
                            }
                        } else if (evt.keyCode == 13 && $(thisObj).find(".focused_cell").length > 0) {
                            $(thisObj).find(".focused_cell").trigger("click");
                            evt.preventDefault();
                        } else if (evt.keyCode == 9
                                || evt.keyCode == 38 //up
                                || evt.keyCode == 40 //down
                                || evt.keyCode == 39 //right
                                || evt.keyCode == 37) { //left
                            var DM = $grid.pqGrid("option", "dataModel");
                            var data = DM.data;
                            
                            var nextColIndx = null;
                            var currentColIndx = null;
                            var focusedCell = null;
                            if ($(thisObj).find(".focused_cell").length > 0) {
                                focusedCell = $(thisObj).find(".focused_cell");
                                $(focusedCell).removeClass("focused_cell");
                            }
                            
                            if (focusedCell) {
                                currentColIndx = parseInt($(focusedCell).attr("pq-col-indx"));
                            }
                            
                            if (currentColIndx == null) {
                                nextColIndx = 1;
                            } else {
                                if (evt.keyCode == 39 || (evt.keyCode == 9 && !evt.shiftKey)) {
                                    nextColIndx = currentColIndx + 1;
                                } else if (evt.keyCode == 37 || (evt.keyCode == 9 && evt.shiftKey)) {
                                    nextColIndx = currentColIndx - 1;
                                } else {
                                    nextColIndx = currentColIndx;
                                }
                            }
                            if (nextColIndx < 1) {
                                nextColIndx = 1;
                            } else if (nextColIndx > DM.columnKey.length) {
                                nextColIndx = DM.columnKey.length;
                            }
                            
                            var nextRowIndx = null;
                            var currentRowIndx = null;
                            var arr = $grid.pqGrid("selection", {type: 'row', method: 'getSelection'});
                            if (arr && arr.length > 0) {
                                currentRowIndx = arr[0].rowIndx;
                            }
                            
                            //handle up and down
                            if (currentRowIndx == null) {
                                nextRowIndx = 0;
                            } else {
                                if (evt.keyCode == 38) {
                                    nextRowIndx = currentRowIndx - 1;
                                } else if (evt.keyCode == 40) {
                                    nextRowIndx = currentRowIndx + 1;
                                } else {
                                    nextRowIndx = currentRowIndx;
                                }
                            }
                            
                            //handle infinity tab 
                            var reset = false;
                            if (evt.keyCode == 9 && evt.shiftKey && nextColIndx === currentColIndx) {
                                nextColIndx = DM.columnKey.length;
                                nextRowIndx--;
                                reset = true;
                            } else if (evt.keyCode == 9 && nextColIndx === currentColIndx) {
                                nextColIndx = 1;
                                nextRowIndx++;
                                reset = true;
                            }
                            
                            if (nextRowIndx < 0) {
                                nextRowIndx = 0;
                            } else if (nextRowIndx >= data.length) {
                                nextRowIndx = data.length - 1;
                            }
                            
                            //handle infinity tab continue
                            if (evt.keyCode == 9 && evt.shiftKey && nextRowIndx === currentRowIndx && reset) {
                                nextRowIndx = data.length - 1;
                            } else if (evt.keyCode == 9 && nextRowIndx === currentRowIndx && reset) {
                                nextRowIndx = 0;
                            }
                            
                            $grid.pqGrid("setSelection", null );
                            $grid.pqGrid("setSelection", {rowIndx:nextRowIndx});
                            $(thisObj).find(".pq-row-select.ui-state-highlight [pq-col-indx='"+nextColIndx+"']").addClass("focused_cell");
                            
                            if (evt.keyCode == 9) {
                                evt.preventDefault();
                            }
                        } else if (evt.keyCode == 189 && evt.shiftKey) {
                            pqMethod.deleteRow();
                            evt.preventDefault();
                        } else if (evt.keyCode == 187 && evt.shiftKey) {
                            pqMethod.addRow();
                            evt.preventDefault();
                        } else {
                            $grid.pqGrid("keyPressDown", evt);
                        }
                    },
                    showHidePager: function() {
                        var DM = $grid.pqGrid("option", "dataModel");
                        var data = DM.data;
                        if (data.length > DM.rPP) {
                            $(thisObj).find(".pq-pager").show();
                        } else {
                            $(thisObj).find(".pq-pager").hide();
                        }
                    },
                    showhideScrollbar: function() {
                        var width = $grid.find(".pq-grid-header-table").width();
                        var grid_width = $grid.width();
                        if (width > grid_width - 5) {
                            $grid.find(".pq-hscroll.pq-scrollbar-horiz").show();
                            $grid.find(".pq-grid-table").css("margin-bottom", "17px");
                        } else {
                            $grid.find(".pq-hscroll.pq-scrollbar-horiz").hide();
                            $grid.find(".pq-grid-table").css("margin-bottom", "0");
                        }
                    },
                    autoResize: function() {
                        if ($grid.hasClass("pq-grid") && $(thisObj).find(".has_editor_cell").length === 0) {
                            $grid.hide();
                            var width = $(thisObj).width();
                            $grid.pqGrid("option", "width", width);
                            $grid.show();
                            $grid.pqGrid("refresh");
                        }
                    }
                }

                var tbl = $(thisObj).find("table");

                //remove label;
                tbl.find("tr td .grid-cell").each(function() {
                    var html = $(this).text();
                    var temp = $(html);
                    $(temp).find(".label, input, textarea, select").remove();
                    $(this).text($(temp).html());
                });

                var obj = $.paramquery.tableToArray(tbl);

                for (var r = 0; r < obj.data.length; r++) {
                    for (var c = 1; c < obj.data[r].length; c++) {
                        var el = $(obj.data[r][c]);
                        obj.data[r][c] = $.trim(el.text());
                        el.remove();
                    }
                }

                var columnKey = new Array();
                tbl.find(".grid-row-editor td textarea").each(function() {
                    columnKey.push($(this).attr("key"));
                });

                if (args.readonly == "true") {
                    obj.data.splice(0, 1);
                } else {
                    obj.data.splice(0, 2);
                }

                var newObj = {width: $(tbl).parent().parent().width() - 5, flexHeight: true, resizable: false, wrap: true, title: "", oddRowsHighlight: true};

                newObj.quitEditMode = function(event, ui) {
                    return pqMethod.quitEditMode(event, ui);
                }

                newObj.dataModel = {data: obj.data, rPP: args.rPP, rPPOptions: args.rPPOptions, paging: "local", sorting: "local", columnKey: columnKey};
                newObj.colModel = obj.colModel;
                newObj.colModel[0].hidden = true;
                newObj.colModel[newObj.colModel.length - 1].hidden = true;
                
                if (args.sortIndx !== "" && !isNaN(args.sortIndx)) {
                    newObj.dataModel['sortIndx'] = args.sortIndx;
                    if (args.sortDir === "up") {
                        newObj.dataModel['sortDir'] = "up";
                    } else {
                        newObj.dataModel['sortDir'] = "down";
                    }
                }

                if (args.showRowNumber != "true") {
                    newObj.numberCell = false;
                }

                if (args.search == "true") {
                    for (var i = 1; i < newObj.colModel.length - 1; i++) {
                        newObj.colModel[i].render = function(ui) {
                            return pqMethod.render(ui);
                        }
                    }
                }

                if (args.readonly != "true") {
                    for (var i = 0; i < newObj.colModel.length - 1; i++) {
                        newObj.colModel[i].editor = function(ui) {
                            return pqMethod.editor(ui);
                        }
                        newObj.colModel[i].getEditCellData = function(ui) {
                            return pqMethod.save(ui);
                        }
                    }

                    newObj.editModel = {clicksToEdit: 1, saveKey: args.keyToSave};
                } else {
                    newObj.editable = false;
                }
                
                for (var i = 1; i < newObj.colModel.length - 1; i++) {
                    newObj.colModel[i].width = $(tbl).find("th:eq("+i+")").attr("data-width");
                    var type = $(tbl).find("th:eq("+i+")").attr("data-dataType");
                    if (type === "float") {
                        newObj.colModel[i].dataType = function (val1, val2 ) {
                            val1 = $(val1).text();
                            val2 = $(val2).text();
                            val1 = (val1+"").replace(/,/g, ""); 
                            val2 = (val2+"").replace(/,/g, "");
                            val1 = val1 ? parseFloat(val1) : 0;
                            val2 = val2 ? parseFloat(val2) : 0;
                            return (val1 - val2);
                        };
                    } else if (type === "date") {
                        newObj.colModel[i].dataType = function (val1, val2 ) {
                            val1 = $(val1).text();
                            val2 = $(val2).text();
                            return new Date(val1) - new Date(val2);
                        };
                    }
                }

                if (args.search == "true" || (args.readonly != "true" && (args.disabledAdd != "true" || args.disabledDelete != "true"))) {
                    newObj.render = function(evt, obj) {
                        var $toolbar = $("<div class='pq-grid-toolbar'></div>").prependTo($(".pq-grid-bottom", this));
                        var $searchbar = $("<div class='pq-grid-searchbar'></div>").appendTo($(".pq-grid-top", this));

                        if (args.disabledAdd != "true" && args.readonly != "true") {
                            $("<span>"+messages['form.advancedgrid.button.add']+"</span>").appendTo($toolbar).button({icons: {primary: "ui-icon-circle-plus"}}).click(function(evt) {
                                pqMethod.addRow();
                                $(thisObj).focus();
                            });
                        }

                        if (args.disabledDelete != "true" && args.readonly != "true") {
                            $("<span>"+messages['form.advancedgrid.button.delete']+"</span>").appendTo($toolbar).button({icons: {primary: "ui-icon-circle-minus"}}).click(function() {
                                pqMethod.deleteRow();
                                $(thisObj).focus();
                            });
                        }

                        if (args.search == "true") {
                            $("<span>Search</span>").appendTo($searchbar);

                            $("<input type='text' class='pq-search-txt'/>").appendTo($searchbar).keyup(function(evt) {
                                pqMethod.search();
                            });

                            $("<select id='pq-crud-select-column' style='height:22px; width:auto;'></select>").appendTo($searchbar).change(function() {
                                pqMethod.search();
                            });
                            for (var i = 1; i < newObj.colModel.length - 1; i++) {
                                $searchbar.find("#pq-crud-select-column").append("<option value='" + i + "'>" + newObj.colModel[i].title + "</option>");
                            }
                        }
                    };
                    //refresh the search after grid sort.
                    $(thisObj).find(".pq_grid").on("pqgridsort", function(evt, obj) {
                        pqMethod.search();
                    });
                }

                $grid = $(thisObj).find(".pq_grid").pqGrid(newObj);
                pqMethod.showHidePager();
                pqMethod.showhideScrollbar();
                
                $grid.pqGrid({
                    refresh: function( event, ui ) {
                        pqMethod.showhideScrollbar();
                    },
                    rowClick: function( event, ui ) {
                        var rowIndx = ui.rowIndx, colIndx = ui.colIndx, rowIndxPage=ui.rowIndxPage;
                        $(thisObj).find(".focused_cell").removeClass("focused_cell");
                        $(thisObj).find("[pq-row-indx='"+rowIndxPage+"'] [pq-col-indx='"+colIndx+"']").addClass("focused_cell"); 
                    }
                });

                //override keypress event
                var $grid_inner = $("div.pq-grid-inner", $grid);
                if (window.opera) {
                    $grid_inner.unbind("keypress.pq-grid");
                    $grid_inner.bind("keypress.pq-grid", function(evt) {
                        pqMethod.keyPress(evt);
                    });
                } else {
                    $grid_inner.unbind("keydown.pq-grid");
                    $grid_inner.bind("keydown.pq-grid", function(evt) {
                        pqMethod.keyPress(evt);
                    });
                }
                
                $(window).resize(function(){
                    pqMethod.autoResize();
                });
                
                //for jquery mobile
                if ($("html").hasClass("ui-mobile")) {
                    var beforeShow = function() {
                        $(thisObj).find('.pq-grid-footer .pq-separator, .pq-grid-footer .pq-pager-msg, .pq-grid-footer .ui-select, .pq-grid-footer select').remove();
                        $(thisObj).find('.pq-grid-footer > span:eq(1), .pq-grid-footer > .ui-btn:eq(4), .pq-grid-footer button[title="Refresh"]').remove();
                        $(thisObj).find('.pq-grid-footer > .ui-btn:eq(0) button').text("|<");
                        $(thisObj).find('.pq-grid-footer > .ui-btn:eq(1) button').text("<<");
                        $(thisObj).find('.pq-grid-footer > .ui-btn:eq(2) button').text(">>");
                        $(thisObj).find('.pq-grid-footer > .ui-btn:eq(3) button').text(">|");
                        $(thisObj).find('.pq-grid-footer > .ui-btn button').removeClass("ui-shadow ui-corner-all");
                        $(thisObj).find(".pq-grid-toolbar *:not(select)").each(function(){
                            $(this).attr("data-role", "none");
                        });
                    };
                    $('div:jqmData(role="page")').live('pagebeforeshow',function(){
                        beforeShow();
                    });
                    $('div:jqmData(role="page")').live('pageshow',function(){
                        pqMethod.autoResize();
                    });
                    beforeShow();
                }
            });
        }
    };

    $.fn.advancedgrid = function(method) {

        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on $.advancedgrid');
        }

    };

})($);