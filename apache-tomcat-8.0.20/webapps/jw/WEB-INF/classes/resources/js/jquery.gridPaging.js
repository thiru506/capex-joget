(function( $ ){
    var options;
    
    var defaults = {
        size : 20
    };
    
    var methods = {
        init: function(args) {
            return this.each(function(){
                options = $.extend(true, {}, defaults, args);
                
                var thisObj = $(this);
                
                methods.refresh.call(thisObj);
                
                $(thisObj).change(function(){
                    methods.refresh.call(thisObj);
                });
                
                if (args.dataSorting) {
                    methods.enableSorting.call(thisObj); 
                }
            }); 
        },
        
        enableSorting: function() {
            var thisObj = $(this);
            var $table = $(thisObj).find("table");
            
            $table.find("th").css("cursor", "pointer");
            
            $table.find("th").click(function(){
                var $this = $(this);
                var th_index = $this.index();
                var sort_dir = "asc";
                
                if ($this.data("sort-dir")) {
                    sort_dir = $this.data("sort-dir") === "asc" ? "desc" : "asc";
                }
                
                var column = [];
                var header = [];
                var sortMethod = function(a, b) {
                    // to handle number sorting
                    if (isNaN(a) || isNaN(b)) {
                        a = a.toLowerCase();
                        b = b.toLowerCase();
                        if (a < b) return -1;
                        if (a > b) return +1;
                    } else {
                        return parseFloat(a) - parseFloat(b);
                    }
                    return 0;
                };
                var trs = $table.children("tbody").children("tr");
                
                // Extract the data for the column that needs to be sorted and pair it up
                // with the TR itself into a tuple
                trs.each(function(index,tr) {
                    if (index > 0) {
                        var $e = $(tr).children().eq(th_index);
                        var order_by = $e.text();
                        column.push([order_by, tr]);
                    } else {
                        header.push(tr);
                    }
                });

                // Sort by the data-order-by value
                column.sort(function(a, b) { return sortMethod(a[0], b[0]); });
                if (sort_dir != "asc") {
                    column.reverse();
                }

                // Replace the content of tbody with the sorted rows. Strangely (and
                // conveniently!) enough, .append accomplishes this for us.
                trs = $.map(header, function(kv) { return kv; });
                trs = $.map(column, function(kv) { return kv[1]; });
                $table.children("tbody").append(trs);

                // Reset siblings
                $table.find("th").data("sort-dir", null).removeClass("sorting-desc sorting-asc");
                $this.data("sort-dir", sort_dir).addClass("sorting-"+sort_dir);
                
                methods.refresh.call(thisObj);
                
                $(thisObj).enterpriseformgrid("refreshIndex");
            });
        },
        
        refresh: function() {
            var thisObj = $(this);
            
            var currentPage = 1;
           
            if ($(thisObj).find(".pg-navigator .pg-current").length > 0) {
                currentPage = $(thisObj).find(".pg-navigator .pg-current").attr("rel");
            }
            
            methods.navigator.call(thisObj);
            methods.showPage.call(thisObj, currentPage);
        },
        
        navigator: function() {
            var thisObj = $(this);
            
            var table = $(thisObj).find("table");
            var size = $(table).find("tr").length - 2;
            
            if ($(thisObj).find(".pg-navigator").length > 0) {
                $(thisObj).find(".pg-navigator").remove();
            }
            
            $(table).after("<p class=\"pg-navigator\"></p>");
            
            var pages = 1;
            if (size > options.size) {
                pages = Math.ceil(size / options.size);
            } else {
                return;
            }
            
            var pagerHtml = '<span class="pg-prev" style="cursor:pointer"> &#171 </span> | ';
            for (var page = 1; page <= pages; page++) {
                pagerHtml += '<span class="pg-normal" rel="'+page+'" style="cursor:pointer">' + page + '</span> | ';
            }
            pagerHtml += '<span class="pg-next" style="cursor:pointer"> &#187; </span>';
            
            $(thisObj).find(".pg-navigator").html(pagerHtml);
            
            $(thisObj).find(".pg-navigator .pg-prev").click(function(){
                var prev = $(thisObj).find(".pg-navigator .pg-current").prev();
                if ($(prev).hasClass("pg-normal")) {
                    methods.showPage.call(thisObj, $(prev).attr("rel"));
                }
            });
            
            $(thisObj).find(".pg-navigator .pg-next").click(function(){
                var next = $(thisObj).find(".pg-navigator .pg-current").next();
                if ($(next).hasClass("pg-normal")) {
                    methods.showPage.call(thisObj, $(next).attr("rel"));
                }
            });
            
            $(thisObj).find(".pg-navigator .pg-normal").click(function(){
                if (!$(this).hasClass("pg-current")) {
                    methods.showPage.call(thisObj, $(this).attr("rel"));
                }
            });
        },
        
        showPage: function(page) {
            var thisObj = $(this);
            
            //if page not exist, show page 1
            if ($(thisObj).find(".pg-navigator .pg-normal[rel="+page+"]").length === 0) {
                page = 1;
            }
            
            $(thisObj).find(".pg-navigator .pg-current").removeClass("pg-current");
            
            var table = $(thisObj).find("table");
            
            var start = options.size * (page - 1) + 2;
            var end = options.size * page + 2;
            
            $(table).find("tr").each(function (i){
                if (i >= 2) {
                    if (i >= start && i < end) {
                        $(this).addClass("pg-tr-show");
                        $(this).removeClass("pg-tr-hide");
                    } else {
                        $(this).removeClass("pg-tr-show");
                        $(this).addClass("pg-tr-hide");
                    }
                }
            });
            
            $(thisObj).find(".pg-navigator .pg-normal[rel="+page+"]").addClass("pg-current");
        }
    };
    
    $.fn.gridPaging = function( method ) {

        if ( methods[method] ) {
            return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.listgrid' );
        }

    };
})( jQuery );

