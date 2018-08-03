package org.wso2.carbon.student.mgt.ui;


import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.apache.axis2.context.ConfigurationContext;
import org.wso2.carbon.student.mgt.data.xsd.Student;
import org.wso2.carbon.student.mgt.stub.StudentManagerStub;

import java.rmi.RemoteException;
public class StudentManagerClient {
    private StudentManagerStub stub;

    public StudentManagerClient(ConfigurationContext configCtx, String backendServerURL, String cookie) throws Exception{
        String serviceURL = backendServerURL + "StudentManager";
        stub = new StudentManagerStub(configCtx, serviceURL);
        ServiceClient client = stub._getServiceClient();
        Options options = client.getOptions();
        options.setManageSession(true);
        options.setProperty(org.apache.axis2.transport.http.HTTPConstants.COOKIE_STRING, cookie);
    }

    public Student[] getStudents() throws Exception{
        try{
            return stub.getStudents();
        }catch (RemoteException e) {
            String msg = "Cannot get the list of students"
                    + " . Backend service may be unavailable";
            throw new Exception(msg, e);
        }
    }
}
