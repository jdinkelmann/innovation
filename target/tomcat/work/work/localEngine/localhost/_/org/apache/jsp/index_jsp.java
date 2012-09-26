package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


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

      out.write("<!DOCTYPE html> \r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("   <meta charset=\"utf-8\">\r\n");
      out.write("   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> \r\n");
      out.write("   <title>U.S. History in Context</title> \r\n");
      out.write("   <link rel=\"stylesheet\" type=\"text/css\" href=\"style/bootstrap.css\">\r\n");
      out.write("   <link rel=\"stylesheet\" type=\"text/css\" href=\"style/main.css\">\r\n");
      out.write("   <script src=\"http://code.jquery.com/jquery-1.7.1.min.js\"></script>\r\n");
      out.write("   <script src=\"scripts/jquery.url.js\"></script>\r\n");
      out.write("   <script type=\"text/javascript\" src=\"http://appdev.ng.cengage.com/static/steal/steal.js\"></script> \r\n");
      out.write("   <script>\r\n");
      out.write("   var cluiRef;\r\n");
      out.write("   var roomName = 'Common';\r\n");
      out.write("   var userName = '';\r\n");
      out.write("\r\n");
      out.write("   steal.map({\r\n");
      out.write("      \"clui\": \"/static/nb/ui/clui\"\r\n");
      out.write("   });\r\n");
      out.write("      steal('jquery','clui/app')\r\n");
      out.write("      .then('thirdparty/query')\r\n");
      out.write("      .then( function() {\r\n");
      out.write("         Clui.app(function(){\r\n");
      out.write("                                 cluiRef = Clui;\r\n");
      out.write("                                 Clui.hub.pub('app.user.list', {}, showUsers);\r\n");
      out.write("                              \r\n");
      out.write("                      });\r\n");
      out.write("      });\r\n");
      out.write("   </script>\r\n");
      out.write("   <!-- MY Javascript -->\r\n");
      out.write("   <script type=\"text/javascript\"  src=\"scripts/searchAndGetResults.js\"></script> \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head> \r\n");
      out.write("\r\n");
      out.write("<body> \r\n");
      out.write("   <div id=\"galeContentWrapper\" class=\"history\">\r\n");
      out.write("      <header>\r\n");
      out.write("         <img src=\"images/logo.png\">\r\n");
      out.write("         <form name=\"search\" action=\"\" class=\"form-horizontal\">\r\n");
      out.write("            <input type=\"hidden\" value=\"ZXAA-MOD1|ZXACC-MOD1|ZXAL-VRL|ZXAE-VRL|History-US-Misc\" name=\"contentSets\" id=\"contentSets\">\r\n");
      out.write("            <input type=\"hidden\" value=\"K12-News\" name=\"displayGroups\" id=\"displayGroups\">\r\n");
      out.write("            <label for=\"search\">Locate U.S. History Aritcles</label>\r\n");
      out.write("            <div class=\"input-append\">\r\n");
      out.write("                   <input id=\"query\" name=\"query\" type=\"search\" class=\"span4\" type=\"text\"><button id=\"submitSearch\" class=\"btn\" type=\"button\">Go!</button>\r\n");
      out.write("               </div>\r\n");
      out.write("         </form>\r\n");
      out.write("      </header>\r\n");
      out.write("      <section id=\"results\">\r\n");
      out.write("         <ul class=\"listView\"></ul>\r\n");
      out.write("      </section>\r\n");
      out.write("   </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
