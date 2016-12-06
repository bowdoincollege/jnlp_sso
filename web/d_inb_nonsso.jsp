<%@ page language="java" %>

<%
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setHeader("Content-Disposition", "filename=\"d-bb.jnlp\";");
    response.setContentType("application/x-java-jnlp-file");
    String codebase = "https://dev-inb-vip.bowdoin.edu/forms/java/";
    //leave out port for jnlp if this is coming through the f5
    String jnlpurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/" + request.getRequestURI();
    if (request.getServerName().contains("vip")) {
        jnlpurl = "https://" + request.getServerName() + request.getRequestURI();
    }
    if (request.getQueryString() != null && request.getQueryString().contains("formsjar")) {
%>
<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="<%=codebase%>" href="">
    <information>
        <title>Oracle Forms</title>
        <vendor>Oracle</vendor>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <!-- Application Resources -->
        <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se"/>
        <jar href="frmall.jar" main="true"/>
    </resources>
    <component-desc/>
</jnlp>
<%
} else {
%>
<?xml version="1.0" encoding="UTF-8"?>
<jnlp spec="1.0+" codebase="<%=codebase%>" href="">
    <information>
        <title>Banner Launcher</title>
        <vendor>Ellucian</vendor>
    </information>
    <security>
        <all-permissions/>
    </security>
    <resources>
        <!-- Application Resources -->
        <j2se version="1.6+" href="http://java.sun.com/products/autodl/j2se"/>
        <jar href="sbanicons.jar"/>
        <jar href="sbannerui.jar"/>
        <jar href="sbanspecial.jar"/>
        <jar href="sbanorep_10_1_2_3.jar"/>
        <extension href="<%= jnlpurl %>?formsjar=yes"/>
    </resources>
    <applet-desc
            name="Forms"
            main-class="oracle.forms.engine.Main"
            width="1040"
            height="738">
        <param name="code" value="oracle.forms.engine.Main"/>
        <param name="serverURL"
               value="/forms/lservlet?ifcfs=/forms/frmservlet?config=test&#38;ifsessid=WLS_FORMS.formsapp.1625&#38;acceptLanguage=en-US,en;q=0.8,en-CA;q=0.6"/>
        <param name="serverArgs"
               value="escapeParams=true module=guainit.fmx userid=  debug=no host= port= obr=no record= tracegroup= log= term= ssoProxyConnect=no"/>
        <param name="separateFrame" value="true"/>
        <param name="splashScreen" value=""/>
        <param name="background" value=""/>
        <param name="lookAndFeel" value="Oracle"/>
        <param name="colorScheme" value="blaf"/>
        <param name="serverApp" value="default"/>
        <param name="logo" value="false"/>
    </applet-desc>
</jnlp>
<%}%>
