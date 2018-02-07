<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>

<commons:popupHeader />
    <style>
        li.generator {background: #eee; border-radius: 5px; padding:10px 5px; margin: 0 0 5px; border: 1px solid #ddd; list-style: none;}
        li.generator .name {padding:0; margin: 0 0 3px; font-size: 14px; font-weight: bold; color:#000; display: block;}
        li.generator.disabled .name {color:#9E9E9E;}
        li.generator a {text-decoration: none; }
        .alert {padding: 10px; margin-bottom: 10px; border: 1px solid transparent; border-radius: 4px;}
        .alert.success {color: #3c763d; background-color: #dff0d8; border-color: #d6e9c6;}
        .alert.error {color: #a94442; background-color: #f2dede; border-color: #ebccd1;}
        .checkbox {width:5%; float:left}
        .list_content {float:left; width: 95%;}
    </style>    

    <div id="main-body-header">
        <fmt:message key="formBuilder.appGenerator"/>
    </div>
    <div id="main-body-content">
        <div id="generator_container">
            <c:choose>
                <c:when test="${!empty result}">
                    <div class="alert <c:choose><c:when test="${result.error}">error</c:when><c:otherwise>success</c:otherwise></c:choose>">
                        ${result.message}
                    </div>
                    <br/>
                    <br/>
                    <div class="button-panel">
                        <button id="more-btn" class="btn"><fmt:message key="formBuilder.generate.more"/></button>
                        <button id="close-btn" class="btn"><fmt:message key="general.method.label.close"/></button>
                    </div>
                </c:when>
                <c:otherwise>
                    <h3 class="title"><fmt:message key="formBuilder.generators"/></h4>  
                    <ul class="generators">
                        <c:forEach var="plugin" items="${plugins}" varStatus="count">
                            <c:set var="disabled" value="${plugin.disabled || (plugin.className eq generatedPlugin.className && generatedPlugin.disabled)}"/>
                            <li class="generator plugin <c:if test="${disabled}">disabled</c:if>" data-plugin_name="${plugin.className}">
                                <div class="checkbox">
                                    <c:choose>
                                        <c:when test="${disabled}">
                                            <i class="icon-minus-sign icon-2x"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="icon-check-empty icon-2x checklist"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="list_content">
                                    <h5 class="name"><c:out value="${plugin.label}"/></h5>
                                    <a class="more"><i class="icon-info-sign"></i><fmt:message key="formBuilder.moreInfo"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${!disabled}"><a class="advanced" href="${pageContext.request.contextPath}/web/console/app/<c:out value="${appId}"/>/<c:out value="${appVersion}"/>/generator/<c:out value="${formId}"/>/config?plugin=<c:out value="${plugin.className}"/>"><i class="icon-magic"></i><fmt:message key="formBuilder.advanced"/></a></c:if>
                                    <div class="more_info" style="display:none; padding-top: 5px;">
                                        <ui:stripTag html="${plugin.explanation}" relaxed="true" />
                                    </div>   
                                </div>
                            <div class="clear"></div>
                            </li>
                        </c:forEach>
                    </ul>  
                    <div class="button-panel">
                        <button id="generate-btn" class="btn"><fmt:message key="formBuilder.generate"/></button>
                        <button id="more-btn" class="btn" style="display:none;"><fmt:message key="formBuilder.generate.more"/></button>
                        <button id="close-btn" class="btn" style="display:none;"><fmt:message key="general.method.label.close"/></button>
                    </div>
                </c:otherwise>
            </c:choose>        
        </div>
    </div>
                            
    <script>
        (function ($) { 
                jQuery.expr[':'].Contains = function(a,i,m){ 
                    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0; 
                };  

                function listFilter(header, list) { 
                    var form = $("<form>").attr({"class":"filterform","action":"#","onsubmit":"return false"}), 
                    input = $("<input>").attr({"class":"filterinput","type":"text"}); 
                    $(form).append(input).append($("<span class='filterlabel'><i class='icon-search'></i></span>")).appendTo(header);  
                    $(input).change( function () { 
                        var filter = $(this).val(); 
                        if(filter) { 
                            $(list).find("a.name:not(:Contains(" + filter + "))").parent().slideUp(); 
                            $(list).find("a.name:hidden:Contains(" + filter + ")").parent().slideDown(); 
                        } else { 
                            $(list).find("li").slideDown(); 
                        } 
                        return false; 
                    }) .keyup( function () { 
                        $(this).change(); 
                    }); 
                }  

                $(function () { 
                    $(".more").click(function(){
                        $(this).parent().find(".more_info").slideToggle();
                    });
                    
                    $(".checklist").click(function(){
                        if ($(this).hasClass("icon-check-empty")) {
                            $(this).removeClass("icon-check-empty");
                            $(this).addClass("icon-check");
                        } else {
                            $(this).removeClass("icon-check");
                            $(this).addClass("icon-check-empty");
                        }
                    });
                    
                    $("#generate-btn").click(function(){
                        $(this).attr("disabled", "true");
                        $(".checklist").unbind("click");
                        generation();
                    });
                    
                    $("#more-btn").click(function(){
                        document.location.href = "${pageContext.request.contextPath}/web/console/app/<c:out value="${appId}"/>/<c:out value="${appVersion}"/>/generator/<c:out value="${formId}"/>";
                    });
                    
                    $("#close-btn").click(function(){
                        if (parent && parent.PopupDialog.closeDialog) {
                            parent.PopupDialog.closeDialog();
                        }
                    });
            
                    //only show filter when generator more than 10
                    if ($(".generator").length > 10) {
                        listFilter($("#generator_container h3"), $(".generators")); 
                        $("#generator_container h3 input").focus();
                    }
                }); 
                
                function generation(listId, userviewId) {
                    if ($(".icon-check").length > 0) {
                        var item = $(".icon-check")[0];
                        $(item).removeClass("icon-check");
                        $(item).addClass("icon-spinner icon-spin");

                        var container = $(item).parent().parent();
                        var type = $(container).data("plugin_name");

                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/web/json/app/<c:out value="${appId}"/>/<c:out value="${appVersion}"/>/generator/<c:out value="${formId}"/>/generate?plugin=" + type,
                            success: function(response) {
                                var temp = eval("(" + response + ")");
                                
                                $(item).removeClass("icon-spinner icon-spin");
                                
                                var cssClass = "success";
                                if (temp.error) {
                                    cssClass = "error";
                                    $(item).addClass("icon-check-empty");
                                } else if (temp.pluginDisabled) {
                                    $(item).addClass("icon-minus-sign");
                                    $(item).parent().parent().addClass("disabled")
                                    $(item).parent().parent().find("a.advanced").remove();
                                } else {
                                    $(item).addClass("icon-ok");
                                }
                                
                                $('#generator_container').prepend('<div class="alert '+cssClass+'">'+temp.message+'</div>');
                                
                                generation();
                            },
                            dataType: "text"
                          });
                    } else {
                        $('#generator_container').prepend('<div class="alert success"><fmt:message key="formBuilder.generate.completed"/></div>');
                        $('h3.title, ul.generators, #generate-btn').remove();
                        $('.button-panel').before('<br/><br/>');
                        $('.button-panel .btn').show();
                    }
                }
        }(jQuery)); 
    </script>
<commons:popupFooter />

