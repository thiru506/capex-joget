/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.20
 * Generated at: 2018-02-07 11:03:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.console.directory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class orgList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(15);
    _jspx_dependants.put("/WEB-INF/tags/commons/implicit.tld", Long.valueOf(1471250836000L));
    _jspx_dependants.put("/WEB-INF/tags/commons/header.tag", Long.valueOf(1491542786000L));
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1428043046000L));
    _jspx_dependants.put("/WEB-INF/tags/commons/footer.tag", Long.valueOf(1471250836000L));
    _jspx_dependants.put("jar:file:/opt/joget/apache-tomcat-8.0.20/webapps/jw/WEB-INF/lib/spring-webmvc-4.1.6.RELEASE.jar!/META-INF/spring.tld", Long.valueOf(1427270224000L));
    _jspx_dependants.put("/WEB-INF/tags/ui/jsontable.tag", Long.valueOf(1471250836000L));
    _jspx_dependants.put("jar:file:/opt/joget/apache-tomcat-8.0.20/webapps/jw/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/fn.tld", Long.valueOf(1425975070000L));
    _jspx_dependants.put("jar:file:/opt/joget/apache-tomcat-8.0.20/webapps/jw/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/fmt.tld", Long.valueOf(1425975070000L));
    _jspx_dependants.put("/WEB-INF/lib/spring-webmvc-4.1.6.RELEASE.jar", Long.valueOf(1430374934000L));
    _jspx_dependants.put("/WEB-INF/tags/ui/popupdialog.tag", Long.valueOf(1471250820000L));
    _jspx_dependants.put("/WEB-INF/tags/ui/implicit.tld", Long.valueOf(1471250836000L));
    _jspx_dependants.put("/WEB-INF/tags/ui/escape.tag", Long.valueOf(1471250836000L));
    _jspx_dependants.put("/WEB-INF/jsp/includes/taglibs.jsp", Long.valueOf(1471250820000L));
    _jspx_dependants.put("jar:file:/opt/joget/apache-tomcat-8.0.20/webapps/jw/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425975070000L));
    _jspx_dependants.put("jar:file:/opt/joget/apache-tomcat-8.0.20/webapps/jw/WEB-INF/lib/spring-webmvc-4.1.6.RELEASE.jar!/META-INF/spring-form.tld", Long.valueOf(1427270224000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

 response.setHeader("Cache-Control","private"); 
      out.write('\r');
      out.write('\n');
 response.setContentType("text/html;charset=UTF-8"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_commons_005fheader_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("<div id=\"nav\">\n");
      out.write("    <div id=\"nav-title\">\n");
      out.write("        <p><i class=\"icon-group\"></i> ");
      if (_jspx_meth_fmt_005fmessage_005f0(_jspx_page_context))
        return;
      out.write("</p>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"nav-body\">\n");
      out.write("        <ul id=\"nav-list\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "directorySubMenu.jsp", out, true);
      out.write("\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div id=\"main\">\n");
      out.write("    <div id=\"main-title\"></div>\n");
      out.write("    <div id=\"main-action\">\n");
      out.write("        <ul id=\"main-action-buttons\">\n");
      out.write("            <li><button onclick=\"onCreate()\">");
      if (_jspx_meth_fmt_005fmessage_005f1(_jspx_page_context))
        return;
      out.write("</button></li>\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("    <div id=\"main-body\">\n");
      out.write("\n");
      out.write("        ");
      if (_jspx_meth_ui_005fjsontable_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    $(document).ready(function(){\n");
      out.write("        $('#JsonDataTable_searchTerm').hide();\n");
      out.write("\n");
      out.write("        ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    ");
      if (_jspx_meth_ui_005fpopupdialog_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("\n");
      out.write("    function onCreate(){\n");
      out.write("        popupDialog.init();\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function closeDialog() {\n");
      out.write("        popupDialog.close();\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function deleteOrganization(selectedList){\n");
      out.write("         if (confirm('");
      if (_jspx_meth_fmt_005fmessage_005f2(_jspx_page_context))
        return;
      out.write("')) {\n");
      out.write("            var callback = {\n");
      out.write("                success : function() {\n");
      out.write("                    document.location = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/web/console/directory/orgs';\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            var request = ConnectionManager.post('");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/web/console/directory/org/delete', callback, 'ids='+selectedList);\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    Template.init(\"#menu-users\", \"#nav-users-orgchart\");\n");
      out.write("</script>\n");
      out.write("\n");
      if (_jspx_meth_commons_005ffooter_005f0(_jspx_page_context))
        return;
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_commons_005fheader_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  commons:header
    org.apache.jsp.tag.webcommons.header_tag _jspx_th_commons_005fheader_005f0 = (new org.apache.jsp.tag.webcommons.header_tag());
    _jsp_instancemanager.newInstance(_jspx_th_commons_005fheader_005f0);
    _jspx_th_commons_005fheader_005f0.setJspContext(_jspx_page_context);
    _jspx_th_commons_005fheader_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_commons_005fheader_005f0);
    return false;
  }

  private boolean _jspx_meth_fmt_005fmessage_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_005fmessage_005f0 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_005fmessage_005f0.setPageContext(_jspx_page_context);
    _jspx_th_fmt_005fmessage_005f0.setParent(null);
    // /WEB-INF/jsp/console/directory/orgList.jsp(7,38) name = key type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_fmt_005fmessage_005f0.setKey("console.header.menu.label.users");
    int _jspx_eval_fmt_005fmessage_005f0 = _jspx_th_fmt_005fmessage_005f0.doStartTag();
    if (_jspx_th_fmt_005fmessage_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f0);
    return false;
  }

  private boolean _jspx_meth_fmt_005fmessage_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_005fmessage_005f1 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_005fmessage_005f1.setPageContext(_jspx_page_context);
    _jspx_th_fmt_005fmessage_005f1.setParent(null);
    // /WEB-INF/jsp/console/directory/orgList.jsp(20,45) name = key type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_fmt_005fmessage_005f1.setKey("console.directory.org.create.label");
    int _jspx_eval_fmt_005fmessage_005f1 = _jspx_th_fmt_005fmessage_005f1.doStartTag();
    if (_jspx_th_fmt_005fmessage_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f1);
    return false;
  }

  private boolean _jspx_meth_ui_005fjsontable_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ui:jsontable
    org.apache.jsp.tag.webui.jsontable_tag _jspx_th_ui_005fjsontable_005f0 = (new org.apache.jsp.tag.webui.jsontable_tag());
    _jsp_instancemanager.newInstance(_jspx_th_ui_005fjsontable_005f0);
    _jspx_th_ui_005fjsontable_005f0.setJspContext(_jspx_page_context);
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = url type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setUrl((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}/web/json/directory/admin/organization/list?${pageContext.request.queryString}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = var type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setVar("JsonDataTable");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = divToUpdate type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setDivToUpdate("organizationList");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = jsonData type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setJsonData("data");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = rowsPerPage type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setRowsPerPage("10");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = width type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setWidth("100%");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = sort type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setSort("name");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = desc type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setDesc("false");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = href type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHref((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}/web/console/directory/org/view", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefParam type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefParam("id");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefSuffix type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefSuffix(".");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefQuery type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefQuery("false");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefDialog type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefDialog("false");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefDialogWidth type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefDialogWidth("600px");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefDialogHeight type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefDialogHeight("400px");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = hrefDialogTitle type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setHrefDialogTitle("Process Dialog");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = checkbox type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setCheckbox((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${!isCustomDirectoryManager}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) null
    _jspx_th_ui_005fjsontable_005f0.setDynamicAttribute(null, "checkboxButton2", "general.method.label.delete");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) null
    _jspx_th_ui_005fjsontable_005f0.setDynamicAttribute(null, "checkboxCallback2", "deleteOrganization");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = searchItems type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setSearchItems("name|Organization Name");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) name = fields type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fjsontable_005f0.setFields("['id','name','description']");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) null
    _jspx_th_ui_005fjsontable_005f0.setDynamicAttribute(null, "column1", "{key: 'id', label: 'console.directory.org.common.label.id', sortable: true}");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) null
    _jspx_th_ui_005fjsontable_005f0.setDynamicAttribute(null, "column2", "{key: 'name', label: 'console.directory.org.common.label.name', sortable: true}");
    // /WEB-INF/jsp/console/directory/orgList.jsp(25,8) null
    _jspx_th_ui_005fjsontable_005f0.setDynamicAttribute(null, "column3", "{key: 'description', label: 'console.directory.org.common.label.description', sortable: false}");
    _jspx_th_ui_005fjsontable_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_ui_005fjsontable_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/jsp/console/directory/orgList.jsp(58,8) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isCustomDirectoryManager}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("            $('#main-action-buttons').remove();\n");
        out.write("            $('#JsonDataTable_organizationList-buttons').remove();\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_ui_005fpopupdialog_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ui:popupdialog
    org.apache.jsp.tag.webui.popupdialog_tag _jspx_th_ui_005fpopupdialog_005f0 = (new org.apache.jsp.tag.webui.popupdialog_tag());
    _jsp_instancemanager.newInstance(_jspx_th_ui_005fpopupdialog_005f0);
    _jspx_th_ui_005fpopupdialog_005f0.setJspContext(_jspx_page_context);
    // /WEB-INF/jsp/console/directory/orgList.jsp(64,4) name = var type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fpopupdialog_005f0.setVar("popupDialog");
    // /WEB-INF/jsp/console/directory/orgList.jsp(64,4) name = src type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_ui_005fpopupdialog_005f0.setSrc((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}/web/console/directory/org/create", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
    _jspx_th_ui_005fpopupdialog_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_ui_005fpopupdialog_005f0);
    return false;
  }

  private boolean _jspx_meth_fmt_005fmessage_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  fmt:message
    org.apache.taglibs.standard.tag.rt.fmt.MessageTag _jspx_th_fmt_005fmessage_005f2 = (org.apache.taglibs.standard.tag.rt.fmt.MessageTag) _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.MessageTag.class);
    _jspx_th_fmt_005fmessage_005f2.setPageContext(_jspx_page_context);
    _jspx_th_fmt_005fmessage_005f2.setParent(null);
    // /WEB-INF/jsp/console/directory/orgList.jsp(75,22) name = key type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_fmt_005fmessage_005f2.setKey("console.directory.org.delete.label.confirmation");
    int _jspx_eval_fmt_005fmessage_005f2 = _jspx_th_fmt_005fmessage_005f2.doStartTag();
    if (_jspx_th_fmt_005fmessage_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005ffmt_005fmessage_0026_005fkey_005fnobody.reuse(_jspx_th_fmt_005fmessage_005f2);
    return false;
  }

  private boolean _jspx_meth_commons_005ffooter_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  commons:footer
    org.apache.jsp.tag.webcommons.footer_tag _jspx_th_commons_005ffooter_005f0 = (new org.apache.jsp.tag.webcommons.footer_tag());
    _jsp_instancemanager.newInstance(_jspx_th_commons_005ffooter_005f0);
    _jspx_th_commons_005ffooter_005f0.setJspContext(_jspx_page_context);
    _jspx_th_commons_005ffooter_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_commons_005ffooter_005f0);
    return false;
  }
}