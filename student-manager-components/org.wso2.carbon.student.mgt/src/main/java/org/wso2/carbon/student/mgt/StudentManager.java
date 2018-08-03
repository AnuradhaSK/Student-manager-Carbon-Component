package org.wso2.carbon.student.mgt;

import org.wso2.carbon.student.mgt.data.Student;

public class StudentManager {
    private Student[] students;

    public StudentManager() {
        students = new Student[2];
        students[0] = new Student(1234,"Amal", "Gunatilake");
        students[1] = new Student(4321, "John", "Carter");
    }

    public Student[] getStudents() {
        return students;
    }
}
