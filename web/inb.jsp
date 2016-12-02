<%@ page language="java"  %>
<%--
  Created by IntelliJ IDEA.
  User: mullian
  Date: 11/21/2016
  Time: 3:19 PM
--%>
<%response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setHeader("Content-Disposition", "filename=\"bb.jnlp\";");
response.setContentType("application/x-java-jnlp-file");

    String codebase =   "https://" + request.getServerName() +  "/forms/java/";
%>

<% if (request.getQueryString().contains("iamticket"))
{
    String iamticket = request.getQueryString().substring(request.getQueryString().length()- 32, request.getQueryString().length());
    String jnlpurl =   "https://" + request.getServerName() +  request.getContextPath();
%>
        <?xml version="1.0" encoding="UTF-8"?>
        <jnlp spec="1.0+" codebase="<%= codebase %>" href="">
            <information>
                <title>Banner Launcher</title>
                <vendor>Ellucian</vendor>
            </information>
            <security>
                <all-permissions />
            </security>
            <resources>
                <!-- Application Resources -->
                <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se"/>
                <jar href="sbannersso_weblogic.jar" />
                <jar href="sbanicons.jar" />
                <jar href="sbannerui.jar" />
                <jar href="sbanspecial.jar" />
                <jar href="sbanorep_10_1_2_3.jar"/>
                <extension href="<%= jnlpurl %>/inb.jsp?formsjar=yes"/>
            </resources>
            <applet-desc
                    name="Forms"
                    main-class="com.sct.banner.web.applet.BannerApplet"
                    width="1040"
                    height="738">
                <param name="code" value="oracle.forms.engine.Main" />
                <param name="serverURL" value="/forms/lservlet?ifcfs=/forms/frmservlet?config=<%= request.getParameter("config") %>&#38;otherParams=iamticket=<%= iamticket%>&#38;ifsessid=WLS_FORMS.formsapp.1625&#38;acceptLanguage=en-US,en;q=0.8,en-CA;q=0.6"/>
                <param name="networkRetries" value="0"/>
                <param name="iamticket" value="<%= iamticket %>"/>
                <param name="serverArgs" value="escapeParams=true module=guainit.fmx debug=no host= port= obr=no record= tracegroup= log= term= iamticket=<%= iamticket%>"/>
                <param name="separateFrame" value="true"/>
                <param name="lookAndFeel" value="Oracle"/>
                <param name="colorScheme" value="blaf"/>
                <param name="logo" value="false"/>
                <param name="serverApp" value="default"/>
            </applet-desc>
        </jnlp>

<% } else
    {
%>
<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="<%= codebase %>" href="">
<information>
    <title>Oracle Forms</title>
    <vendor>Oracle</vendor>
</information>
<security>
    <all-permissions />
</security>
<resources>
    <!-- Application Resources -->
    <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se"/>
    <jar href="frmall.jar"  main="true" />
</resources>
<component-desc/>
</jnlp>
<%
        }
        %>