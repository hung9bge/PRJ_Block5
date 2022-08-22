/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author HUNGLM
 */
public class Staff {
    private int sid;
    private String sname;
    private String nvname;
    private ArrayList<WorkingTime> workingTimes = new ArrayList<>();
    private ArrayList<WorkShift> workShifts = new ArrayList<>();
    private Salary salary;
    private SalaryManagement management;

    public Salary getSalary() {
        return salary;
    }

    public void setSalary(Salary salary) {
        this.salary = salary;
    }

    public SalaryManagement getManagement() {
        return management;
    }

    public void setManagement(SalaryManagement management) {
        this.management = management;
    }
    
    

    
    
    public ArrayList<WorkingTime> getWorkingTimes() {
        return workingTimes;
    }

    public void setWorkingTimes(ArrayList<WorkingTime> workingTimes) {
        this.workingTimes = workingTimes;
    }

    public ArrayList<WorkShift> getWorkShifts() {
        return workShifts;
    }

    public void setWorkShifts(ArrayList<WorkShift> workShifts) {
        this.workShifts = workShifts;
    }
    
        public float getNumberOfWorkingHours()
    {
        float sum = 0.0f;
        for (WorkingTime timesheet : workingTimes) {
            sum+= timesheet.getWorkingHours();
            
        }
        
        return sum ;
    }
        public float getNumberofSalary(){
            float sum=0;
         sum =  getNumberOfWorkingHours()* salary.getSalary()+management.getBonus()-management.getAdvance()-management.getDeduction();
         return sum;
        }
   

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }


    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getNvname() {
        return nvname;
    }

    public void setNvname(String nvname) {
        this.nvname = nvname;
    }
    
    
    
}
