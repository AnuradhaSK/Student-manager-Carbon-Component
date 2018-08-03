<%@ page import="org.apache.axis2.context.ConfigurationContext" %>
<%@ page import="org.wso2.carbon.CarbonConstants" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIUtil" %>
<%@ page import="org.wso2.carbon.utils.ServerConstants" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIMessage" %>
<%@ page import="org.wso2.carbon.student.mgt.ui.StudentManagerClient" %>
<%@ page import="org.wso2.carbon.student.mgt.data.xsd.Student" %>

<%
    String serverURL = CarbonUIUtil.getServerURL(config.getServletContext(), session);
    ConfigurationContext configContext =
            (ConfigurationContext) config.getServletContext().getAttribute(CarbonConstants.CONFIGURATION_CONTEXT);
    String cookie = (String) session.getAttribute(ServerConstants.ADMIN_SERVICE_COOKIE);

    StudentManagerClient client;
    Student[] students;

    try {
        client = new StudentManagerClient(configContext, serverURL, cookie);
        students = client.getStudents();
    } catch (Exception e) {
        CarbonUIMessage.sendCarbonUIMessage(e.getMessage(), CarbonUIMessage.ERROR, request, e);
%>
<script type="text/javascript">
    location.href = "../admin/error.jsp";
</script>
<%
        return;
    }
%>

<div id="middle">
    <h2>Student Management</h2>

    <div id="workArea">
        <table class="styledLeft" id="moduleTable">
            <thead>
            <tr>
                <th width="20%">ID</th>
                <th width="40%">First Name</th>
                <th width="40%">Last Name</th>
            </tr>
            </thead>
            <tbody>
            <%
                for(Student student:students){
            %>
            <tr>
                <td><%=student.getID()%></td>
                <td><%=student.getFirstName()%></td>
                <td><%=student.getLastName()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>