<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>
<c:set var="analyzerEnabled" value="<%= org.joget.commons.util.Analyzer.isEnabled() %>"/>
<c:if test="${analyzerEnabled}">
<textarea id="analyzerJson" rows="1" cols="1"><%= org.joget.commons.util.Analyzer.getStatus() %></textarea>
<script src="${pageContext.request.contextPath}/js/perfAnalyzer.js"></script>
</c:if>
