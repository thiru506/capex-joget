(function () {
    var displayAnalyzer = function (el, duration, id, info) {
        var $el = $(el);
        var $analyzerDiv = $(el).find('.analyzer-label');
        if ($analyzerDiv.length === 0) {
            var $analyzerDiv = $('<div class="analyzer-label"></div>');
            if ($el.prop("tagName") === 'INPUT' || $el.prop("tagName") === 'SELECT' || $el.prop("tagName") === 'TEXTAREA') {
                $el.before($analyzerDiv);
            } else {
                $el.addClass("analyzer-disabled");
                $el.prepend($analyzerDiv);
            }
            if (id) {
                $analyzerDiv.append(id);
            }
            if (info) {
                $analyzerDiv.append('<span class="info">' + info + '</span>');
            }
            if (duration > 0) {
                $analyzerDiv.append('<span class="duration">' + duration + 'ms</span>');
            }
        }
    };
    var displayAnalyzerInfo = function (el, duration, info) {
        var $el = $(el).find(".analyzer-label");
        var $analyzerInfoDiv = $(el).find('.analyzer-info');
        if ($analyzerInfoDiv.length === 0) {
            $analyzerInfoDiv = $('<div class="analyzer-info"></div>');
            if ($el.prop("tagName") === 'INPUT' || $el.prop("tagName") === 'SELECT' || $el.prop("tagName") === 'TEXTAREA') {
                $el.after($analyzerInfoDiv);
            } else {
                $el.append($analyzerInfoDiv);
            }
        }
        if (info) {
            $analyzerInfoDiv.append('<span class="analyzer-info-info">' + info + '</span>');
        }
        if (duration > 0) {
            $analyzerInfoDiv.append('<span class="analyzer-info-duration">' + duration + 'ms</span>');
        }
    };
    var displayPageInfo = function (el, info) {
        var $el = $(el);
        var $analyzerInfoDiv = $(el).find('.analyzer-page');
        if ($analyzerInfoDiv.length === 0) {
            $analyzerInfoDiv = $('<div class="analyzer-page"></div>');
            if ($el.prop("tagName") === 'INPUT' || $el.prop("tagName") === 'SELECT' || $el.prop("tagName") === 'TEXTAREA') {
                $el.before($analyzerInfoDiv);
            } else {
                $el.prepend($analyzerInfoDiv);
            }
            $el.addClass("hasAnalyzer");
        }
        if (info) {
            $analyzerInfoDiv.append('<span class="analyzer-info-info">' + info + '</span>');
        }
    };
    var currentAnalyzerElement;
    var traverse = function (analyzer) {
        if (analyzer.type === 'request') {
            var el = "#page";
            var jvm = analyzer.jvm;
            var jvmInfo = "Java VM Heap Used: " + jvm.used + "MB, Total: " + jvm.total + "MB, Max: " + jvm.max + "MB";
            displayPageInfo(el, jvmInfo);
            currentAnalyzerElement = el;
        } else if (analyzer.type === 'userview') {
            var el = "#content:last, #content.main-content";
            displayAnalyzer(el, analyzer.duration);
            currentAnalyzerElement = el;
        } else if (analyzer.type === 'menu') {
            var el = "#" + analyzer.id + ".menu";
            displayAnalyzer(el, analyzer.duration);
            currentAnalyzerElement = el;
        } else if (analyzer.type === 'formElement') {
            if (analyzer.id && analyzer.duration > 0) {
                var el = $(".form-cell [name='" + analyzer.id + "']").parentsUntil(".form-cell").parent();
                if (el.length === 0) {
                    el = $(".subform-cell #" + analyzer.id + ".subform-section");
                }
                if (el.length === 0) {
                    el = $("#" + analyzer.id);
                }
                displayAnalyzer(el, analyzer.duration);
                currentAnalyzerElement = el;
            }
        } else {
            var el = currentAnalyzerElement;
            var info = "";
            for (var i = 0; i < analyzer.depth; i++) {
                info += "--";
            }
            info += analyzer.signature + ":" + analyzer.info
            displayAnalyzerInfo(el, analyzer.duration, info);
        }
        if (analyzer.children) {
            for (var i = 0; i < analyzer.children.length; i++) {
                traverse(analyzer.children[i]);
            }
        }
    };
    var analyzerJson = $("#analyzerJson").val();
    var analyzer = JSON.parse(analyzerJson);
    traverse(analyzer);
    $(".analyzer-label").on("mouseover", function () {
        $(".analyzer-label").not(this).css("zIndex", "500");
    });
    $(".analyzer-label").on("mouseout", function () {
        $(".analyzer-label").not(this).css("zIndex", "1000");
    });
})();
