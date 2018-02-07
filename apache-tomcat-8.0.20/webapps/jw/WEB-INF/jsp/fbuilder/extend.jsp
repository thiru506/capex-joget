<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>

<style>
    #builder-bar a#generator { background: #aaaaff; opacity: 0.9; height: 37px; }
    #builder-bar li#generator-button {float: right;}
</style>

<li id="generator-button" class="last-inactive"><a id="generator"><span class="steps-bg"><span class="title"><fmt:message key="formBuilder.generateApp"/></span><span class="subtitle"><fmt:message key="formBuilder.appGenerator"/></span></span></a></li>

<script type="text/javascript">
    <ui:popupdialog var="appGeneratorDialog" src="${pageContext.request.contextPath}/web/console/app/${appId}/${appDefinition.version}/generator/${formId}"/>
        
    $(document).ready(function(){
        $("a#generator").click(function(){
            if (FormBuilder.isEmpty()) {
                alert("<fmt:message key="formBuilder.generateApp.emptyForm"/>");
            } else {
                if(!FormBuilder.isSaved()){
                    alert("<fmt:message key="formBuilder.generateApp.save"/>");
                } else {
                    appGeneratorDialog.init();
                }
            }
        });
    });
        
</script>