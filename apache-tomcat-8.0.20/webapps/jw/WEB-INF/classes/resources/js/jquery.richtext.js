(function($){
    $.fn.extend({
        richtext : function(o){
            var target = this;
            var id = $(target).attr("id");
            
            var delayRichTextInit = function() {
                if ($("#" + id).length > 0) {
                    if(typeof tinymce === "undefined"){
                        $('#' + id).tinymce({
                            // Location of TinyMCE script
                            script_url : o.contextPath + '/js/tiny_mce/tiny_mce.js',
                            
                            // General options
                            convert_urls : false,
                            theme : "advanced",
                            plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras",
                            
                            // Theme options
                            theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect,|,cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor,|,tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen,|,insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,pagebreak",
                            theme_advanced_toolbar_location : "top",
                            theme_advanced_toolbar_align : "left",
                            theme_advanced_statusbar_location : "bottom",
                            
                            height : "300px",
                            width : "100%"
                        });
                    }else{
                        tinymce.execCommand('mceAddControl', false, id);
                    }
                }
            }
                
            //make delay to prevent exception in chrome
            setTimeout(delayRichTextInit, 100);
        }
    });
})(jQuery);