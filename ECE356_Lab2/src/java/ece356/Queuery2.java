/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ece356;

/**
 *
 * @author mhamdaqa
 */
public class Queuery2 {
   private String empName;
   private String deptLocation;

    public Queuery2(String empName, String deptLocation) {
        this.empName = empName;
        this.deptLocation = deptLocation;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getDeptLocation() {
        return deptLocation;
    }

    public void setDeptLocation(String deptLocation) {
        this.deptLocation = deptLocation;
    }
   
   
}
